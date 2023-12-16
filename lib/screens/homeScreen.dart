import 'dart:core';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify/api/Api.dart';
import 'package:notify/model/chat_user.dart';
import 'package:notify/widget/chat_user_card.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => homeScreenState();
}

class homeScreenState extends State<homeScreen> {
  List<ChatUser> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TopBar Honme Icon
        leading: Icon(CupertinoIcons.home),
        title: Text(
          'Notify',
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: FloatingActionButton(
          onPressed: () async {
            await Api.auth.signOut();
            await GoogleSignIn().signIn();
          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),
      //Body
      body: StreamBuilder(
        //Data calling
        stream: Api.firestore.collection('Users').snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            // If data is loading
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(
                child: CircularProgressIndicator(),
              );
            // If data is loaded then show it
            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data?.docs;
              list =
                  data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];

              if (list.isNotEmpty) {
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return chat_user_card(
                        user: list[index],
                      );
                    });
              } else {
                return Center(
                    child: Text(
                  'No Connection Found',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ));
              }
          }
        },
      ),
    );
  }
}
