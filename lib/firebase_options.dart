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
    apiKey: 'AIzaSyAC7_oMqCZY809Ip-U8qvjrb9hHDN9VcR4',
    appId: '1:443942271587:web:718d871e80e63da4a1d656',
    messagingSenderId: '443942271587',
    projectId: 'flutter-chat-app-b658f',
    authDomain: 'flutter-chat-app-b658f.firebaseapp.com',
    storageBucket: 'flutter-chat-app-b658f.appspot.com',
    measurementId: 'G-F61JBZG9ZX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJ8ydEnoMq5pU8uG4AnKt793kKoDdtofY',
    appId: '1:443942271587:android:ff174de90ff9bbe2a1d656',
    messagingSenderId: '443942271587',
    projectId: 'flutter-chat-app-b658f',
    storageBucket: 'flutter-chat-app-b658f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeAtzIH2R23Qc66VD8Mii6B2XeP-H6IAI',
    appId: '1:443942271587:ios:bfc4935d10923c0ea1d656',
    messagingSenderId: '443942271587',
    projectId: 'flutter-chat-app-b658f',
    storageBucket: 'flutter-chat-app-b658f.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDeAtzIH2R23Qc66VD8Mii6B2XeP-H6IAI',
    appId: '1:443942271587:ios:44548f060700bf28a1d656',
    messagingSenderId: '443942271587',
    projectId: 'flutter-chat-app-b658f',
    storageBucket: 'flutter-chat-app-b658f.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}