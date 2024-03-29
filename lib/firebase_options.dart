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
    apiKey: 'AIzaSyBhyUE4MziBp-4oBQiT7jX_eVfYRCWhsK4',
    appId: '1:335523645070:web:b7a758910ed16939ac2bdf',
    messagingSenderId: '335523645070',
    projectId: 'seamensclub-65a07',
    authDomain: 'seamensclub-65a07.firebaseapp.com',
    storageBucket: 'seamensclub-65a07.appspot.com',
    measurementId: 'G-LXSZ9RZ6LS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANz5fsFuzVrdwnAgwCkK2eamvfUxDTyXs',
    appId: '1:335523645070:android:c2e3970c81140230ac2bdf',
    messagingSenderId: '335523645070',
    projectId: 'seamensclub-65a07',
    storageBucket: 'seamensclub-65a07.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD24CQRqlbFqpGrbtBDbEHlfZjf8jfK7Gk',
    appId: '1:335523645070:ios:39907f110c764502ac2bdf',
    messagingSenderId: '335523645070',
    projectId: 'seamensclub-65a07',
    storageBucket: 'seamensclub-65a07.appspot.com',
    androidClientId: '335523645070-atri9o7unjlht1j6jn5ab9o2hcv6aa8d.apps.googleusercontent.com',
    iosClientId: '335523645070-ciup26drnhks9h55v2p8idc2v06oek3n.apps.googleusercontent.com',
    iosBundleId: 'mrblab.newshourapp',
  );
}
