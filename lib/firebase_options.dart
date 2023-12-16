// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDS28Q8ETqXWb9JBv748OO54mElpCp84WI',
    appId: '1:366702850959:web:d86dc3ec2627c353a0d1fa',
    messagingSenderId: '366702850959',
    projectId: 'notify-a4afa',
    authDomain: 'notify-a4afa.firebaseapp.com',
    storageBucket: 'notify-a4afa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuxmY9aRljCKCvfkkFeUs-zrxhJ1YpwPA',
    appId: '1:366702850959:android:32a065b0707cac58a0d1fa',
    messagingSenderId: '366702850959',
    projectId: 'notify-a4afa',
    storageBucket: 'notify-a4afa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbYwq8dYguJe0thC_nXHuOXH440CQm4_g',
    appId: '1:366702850959:ios:67db45e7dd98f05da0d1fa',
    messagingSenderId: '366702850959',
    projectId: 'notify-a4afa',
    storageBucket: 'notify-a4afa.appspot.com',
    iosBundleId: 'com.example.notify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBbYwq8dYguJe0thC_nXHuOXH440CQm4_g',
    appId: '1:366702850959:ios:3722c1489aae871aa0d1fa',
    messagingSenderId: '366702850959',
    projectId: 'notify-a4afa',
    storageBucket: 'notify-a4afa.appspot.com',
    iosBundleId: 'com.example.notify.RunnerTests',
  );
}