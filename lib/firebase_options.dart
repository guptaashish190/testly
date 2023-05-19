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
    apiKey: 'AIzaSyC0SGZm9t6VrMZ8WzOLcOkjcG6cR4VUUlo',
    appId: '1:801821654029:web:a056a8af46d223c731e944',
    messagingSenderId: '801821654029',
    projectId: 'testly-33276',
    authDomain: 'testly-33276.firebaseapp.com',
    storageBucket: 'testly-33276.appspot.com',
    measurementId: 'G-RPVJTY671S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAn21fdtyQ9br1_eDK32inkEDbse4ri0Lw',
    appId: '1:801821654029:android:b88665f580b7b65e31e944',
    messagingSenderId: '801821654029',
    projectId: 'testly-33276',
    storageBucket: 'testly-33276.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDROihKDz1D5nAphOYJ3dmxZ1bQV9AfAEQ',
    appId: '1:801821654029:ios:1915cbbfd703880131e944',
    messagingSenderId: '801821654029',
    projectId: 'testly-33276',
    storageBucket: 'testly-33276.appspot.com',
    iosClientId: '801821654029-ki3s7skcu7ap531mms6ngl4asmb21867.apps.googleusercontent.com',
    iosBundleId: 'com.example.testly',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDROihKDz1D5nAphOYJ3dmxZ1bQV9AfAEQ',
    appId: '1:801821654029:ios:1915cbbfd703880131e944',
    messagingSenderId: '801821654029',
    projectId: 'testly-33276',
    storageBucket: 'testly-33276.appspot.com',
    iosClientId: '801821654029-ki3s7skcu7ap531mms6ngl4asmb21867.apps.googleusercontent.com',
    iosBundleId: 'com.example.testly',
  );
}