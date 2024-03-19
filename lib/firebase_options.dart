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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBRxknty8BNakpWmQiWPBffmjxXjaeHjBg',
    appId: '1:849396730061:web:ade608ebc830d550ca8184',
    messagingSenderId: '849396730061',
    projectId: 'market-master-8f760',
    authDomain: 'market-master-8f760.firebaseapp.com',
    storageBucket: 'market-master-8f760.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0flzqaXEZMPfkfJH1L9Bh9alvRp2Ngu4',
    appId: '1:849396730061:android:1f52c85814257f19ca8184',
    messagingSenderId: '849396730061',
    projectId: 'market-master-8f760',
    storageBucket: 'market-master-8f760.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzOmx6Q1iLGZVXeyi6U0mI9HDmFfzUjpU',
    appId: '1:849396730061:ios:5cf82b2dd3ecabc5ca8184',
    messagingSenderId: '849396730061',
    projectId: 'market-master-8f760',
    storageBucket: 'market-master-8f760.appspot.com',
    androidClientId: '849396730061-14srvrshae2om7oksl8hauivpjupe67f.apps.googleusercontent.com',
    iosClientId: '849396730061-gqcjvis5pi7thvipgh6nm4ou68uhah4u.apps.googleusercontent.com',
    iosBundleId: 'com.example.test1',
  );
}
