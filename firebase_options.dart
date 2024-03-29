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
    apiKey: 'AIzaSyC02NBv5Y6hmeTfQK-U17vKvEKbuMr34bk',
    appId: '1:565613316848:web:28a559f4246f1e10a7d035',
    messagingSenderId: '565613316848',
    projectId: 'yumebazaar-64dc0',
    authDomain: 'yumebazaar-64dc0.firebaseapp.com',
    storageBucket: 'yumebazaar-64dc0.appspot.com',
    measurementId: 'G-FCJH4QYYHG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGPeMc65Mn_zAr31JuyuLovYPxoyksNuI',
    appId: '1:565613316848:android:bcde043fecceb247a7d035',
    messagingSenderId: '565613316848',
    projectId: 'yumebazaar-64dc0',
    storageBucket: 'yumebazaar-64dc0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLSN977NzOqENckGu4MCUIoCl1uYNw6pw',
    appId: '1:565613316848:ios:d48fc5eb67412936a7d035',
    messagingSenderId: '565613316848',
    projectId: 'yumebazaar-64dc0',
    storageBucket: 'yumebazaar-64dc0.appspot.com',
    androidClientId: '565613316848-d7qrg3bks0mh7nm8ns266sjgodi3usmj.apps.googleusercontent.com',
    iosClientId: '565613316848-27u2d7knk5jp9pv3f9oeec45qau97fmo.apps.googleusercontent.com',
    iosBundleId: 'com.example.cwtEcommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDLSN977NzOqENckGu4MCUIoCl1uYNw6pw',
    appId: '1:565613316848:ios:4231478d40138ef8a7d035',
    messagingSenderId: '565613316848',
    projectId: 'yumebazaar-64dc0',
    storageBucket: 'yumebazaar-64dc0.appspot.com',
    androidClientId: '565613316848-d7qrg3bks0mh7nm8ns266sjgodi3usmj.apps.googleusercontent.com',
    iosClientId: '565613316848-jkoegc05sci7p4nvk8na20muck6ehvsr.apps.googleusercontent.com',
    iosBundleId: 'com.example.cwtEcommerceApp.RunnerTests',
  );
}
