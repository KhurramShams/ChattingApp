import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notify/api/Api.dart';
import 'package:notify/screens/auth/loginScreen.dart';
import 'package:notify/screens/homeScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3000), () {
      if (Api.auth.currentUser != null) {
        log('\n User:${Api.auth.currentUser}');

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => homeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => loginScreen()));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 230),
                  child: Image.asset('assets/images/BackGroundLogo.png'),
                ),
              ),
            ),
            SizedBox(height: 200),
            Column(
              children: [
                Text(
                  'Made By Student Of SIBA Mirpurkhas',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
