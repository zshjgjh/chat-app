// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCzzJ9DgtfOuSTjCHNJE8RvFNcGdl0J5_Y',
    appId: '1:1016451619073:web:59c2042d14fc54d7f9e300',
    messagingSenderId: '1016451619073',
    projectId: 'chat-app-d7150',
    authDomain: 'chat-app-d7150.firebaseapp.com',
    storageBucket: 'chat-app-d7150.appspot.com',
    measurementId: 'G-MSJCJJ0CW1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzgG3fZ3sVqJ8Z8l2hnrzLQgepgGoy4r8',
    appId: '1:1016451619073:android:1548913b975a6b6bf9e300',
    messagingSenderId: '1016451619073',
    projectId: 'chat-app-d7150',
    storageBucket: 'chat-app-d7150.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArtsqbQKW1-VhTzI0FcvmqRRFIhrjCB-0',
    appId: '1:1016451619073:ios:33736f46a61622ddf9e300',
    messagingSenderId: '1016451619073',
    projectId: 'chat-app-d7150',
    storageBucket: 'chat-app-d7150.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );
}
