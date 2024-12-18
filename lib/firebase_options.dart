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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCngimXC2zNwCczWukA5kUAUzdttvf4HEI',
    appId: '1:432176851605:web:40add9fc37acffcf66c99c',
    messagingSenderId: '432176851605',
    projectId: 'koodiaranaclient',
    authDomain: 'koodiaranaclient.firebaseapp.com',
    storageBucket: 'koodiaranaclient.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQjFtYnwIpMPJpUX1XJW7j0RiXywE4drQ',
    appId: '1:432176851605:android:c1a918a659d64e0a66c99c',
    messagingSenderId: '432176851605',
    projectId: 'koodiaranaclient',
    storageBucket: 'koodiaranaclient.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPnQyPHejQ-sJax7xUEfEMI7H4xEGaqZQ',
    appId: '1:432176851605:ios:1501b29df0ad034666c99c',
    messagingSenderId: '432176851605',
    projectId: 'koodiaranaclient',
    storageBucket: 'koodiaranaclient.firebasestorage.app',
    iosClientId: '432176851605-cb344hmeholfhuos9n7qehua88enj07i.apps.googleusercontent.com',
    iosBundleId: 'com.example.koodiaranaClient',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPnQyPHejQ-sJax7xUEfEMI7H4xEGaqZQ',
    appId: '1:432176851605:ios:1501b29df0ad034666c99c',
    messagingSenderId: '432176851605',
    projectId: 'koodiaranaclient',
    storageBucket: 'koodiaranaclient.firebasestorage.app',
    iosClientId: '432176851605-cb344hmeholfhuos9n7qehua88enj07i.apps.googleusercontent.com',
    iosBundleId: 'com.example.koodiaranaClient',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCngimXC2zNwCczWukA5kUAUzdttvf4HEI',
    appId: '1:432176851605:web:cdfbf0a93e0f04aa66c99c',
    messagingSenderId: '432176851605',
    projectId: 'koodiaranaclient',
    authDomain: 'koodiaranaclient.firebaseapp.com',
    storageBucket: 'koodiaranaclient.firebasestorage.app',
  );

}