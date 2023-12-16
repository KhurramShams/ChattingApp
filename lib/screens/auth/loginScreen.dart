import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notify/api/Api.dart';
import 'package:notify/screens/homeScreen.dart';
import 'package:notify/helper/Dialog.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  _handleGoogleButtonClick() {
    //For showing bar
    Dialogs.showLoadingBar(context);
    _signInWithGoogle().then((user) async {
      //for hiding bar
      Navigator.pop(context);
      if (user != null) {
        log('User:${user.user}');
        log('UserAdditionalInfo:${user.additionalUserInfo}');

        if ((await Api.UserExit())) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => homeScreen()));
        } else {
          await Api.UserCreate().then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => homeScreen()));
          });
        }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await Api.auth.signInWithCredential(credential);
    } catch (e) {
      log('\n _signInWithGoogle: $e ');
      Dialogs.showSnackabr(context, 'Wrong(Check Internet!!)');
      return null;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset('assets/images/BackGroundLogo.png'),
              ),
            ),
            SizedBox(height: 250),
            Column(
              children: [
                Text(
                  'Login With Social Media Accounts',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () => {_handleGoogleButtonClick()},
                    child: Text('Sign In With Google'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
