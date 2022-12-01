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
    apiKey: 'AIzaSyA8G4hP4Q8uCnAlar88zGZCKfix-cAwwEY',
    appId: '1:361210109793:web:70dd3e3f3032733c532f20',
    messagingSenderId: '361210109793',
    projectId: 'siadmaps',
    authDomain: 'siadmaps.firebaseapp.com',
    storageBucket: 'siadmaps.appspot.com',
    measurementId: 'G-52PJCBDZCH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTLoalKzZa4QhqpdL5mVakG8GCxTna6xw',
    appId: '1:361210109793:android:a476f186ca471dfb532f20',
    messagingSenderId: '361210109793',
    projectId: 'siadmaps',
    storageBucket: 'siadmaps.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSG8j7g1vA2_ekZFbf8oiyqAcb8rBc9Yg',
    appId: '1:361210109793:ios:a1cd7599a24fe02d532f20',
    messagingSenderId: '361210109793',
    projectId: 'siadmaps',
    storageBucket: 'siadmaps.appspot.com',
    iosClientId: '361210109793-t7uvta0rhernj8ebpq2kv0cbjmdtvkou.apps.googleusercontent.com',
    iosBundleId: 'com.example.siadmaps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSG8j7g1vA2_ekZFbf8oiyqAcb8rBc9Yg',
    appId: '1:361210109793:ios:a1cd7599a24fe02d532f20',
    messagingSenderId: '361210109793',
    projectId: 'siadmaps',
    storageBucket: 'siadmaps.appspot.com',
    iosClientId: '361210109793-t7uvta0rhernj8ebpq2kv0cbjmdtvkou.apps.googleusercontent.com',
    iosBundleId: 'com.example.siadmaps',
  );
}