import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
import 'package:notify/model/chat_user.dart';

class Api {
  // For Google Login Authentication
  static FirebaseAuth auth = FirebaseAuth.instance;
  // For Acessing Firestore DataBase
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  // For Current User
  static User get user => auth.currentUser!;
  // For Check If User Found Or Not
  static Future<bool> UserExit() async {
    return (await firestore
            .collection('Users')
            .doc(auth.currentUser!.uid)
            .get())
        .exists;
  }

  // For Creating New User
  static Future<void> UserCreate() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final chatUser = ChatUser(
        image: user.photoURL.toString(),
        name: user.displayName.toString(),
        about: 'Hi I am using Notify',
        createdAt: time,
        lastActive: time,
        id: user.uid,
        isOnline: false,
        email: user.email.toString(),
        pushToken: '');
    return (await firestore
        .collection('Users')
        .doc(user.uid)
        .set(chatUser.toJson()));
  }
}
