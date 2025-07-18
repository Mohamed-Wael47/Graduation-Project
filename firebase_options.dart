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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-_5zFRLgQdQAU4xTFF-6dVECHCMWSk0U',
    appId: '1:862472482676:android:3119088bde707a60a98621',
    messagingSenderId: '862472482676',
    projectId: 'atendanceapp-2813c',
    storageBucket: 'atendanceapp-2813c.appspot.com',
    
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQUMG5qalEqDkfug_DAavkbPiUrpjVYIM',
    appId: '1:505232662214:ios:fd06f542b5844ada2141c7',
    messagingSenderId: '505232662214',
    projectId: 'skin-care-app-bf325',
    storageBucket: 'skin-care-app-bf325.appspot.com',
    iosClientId: '505232662214-0cicb0vp8r7hi39js9hge447tn7nofu0.apps.googleusercontent.com',
    iosBundleId: 'com.example.shoppingapp',
  );
}
