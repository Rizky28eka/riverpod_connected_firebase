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
    apiKey: 'AIzaSyBHt3aoAbDhwXdvxz3P5tXUz45Hex_4Lw0',
    appId: '1:852400002136:web:53a2388bdc6cc1c344262d',
    messagingSenderId: '852400002136',
    projectId: 'todo-firestore-46920',
    authDomain: 'todo-firestore-46920.firebaseapp.com',
    storageBucket: 'todo-firestore-46920.appspot.com',
    measurementId: 'G-00VXXBK0G4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWqL55VmC7JXcMxRIG7HeckQf4NdHPu04',
    appId: '1:852400002136:android:5b8bf4aca8ec0aa044262d',
    messagingSenderId: '852400002136',
    projectId: 'todo-firestore-46920',
    storageBucket: 'todo-firestore-46920.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMGuOYM1IliNHuneSf7R9t4MyE3ZNoFB4',
    appId: '1:852400002136:ios:28610eb889878e4744262d',
    messagingSenderId: '852400002136',
    projectId: 'todo-firestore-46920',
    storageBucket: 'todo-firestore-46920.appspot.com',
    iosBundleId: 'com.example.fRiverpotConnectedFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMGuOYM1IliNHuneSf7R9t4MyE3ZNoFB4',
    appId: '1:852400002136:ios:c03db9f0a824249f44262d',
    messagingSenderId: '852400002136',
    projectId: 'todo-firestore-46920',
    storageBucket: 'todo-firestore-46920.appspot.com',
    iosBundleId: 'com.example.fRiverpotConnectedFirebase.RunnerTests',
  );
}
