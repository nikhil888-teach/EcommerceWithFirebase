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
    apiKey: 'AIzaSyDdowxzm1vQm6MUoCctCItYaOSqM7C4PX4',
    appId: '1:75123193741:web:2d6cf4f73cd326a4f66fc4',
    messagingSenderId: '75123193741',
    projectId: 'topecommerce-fab5d',
    authDomain: 'topecommerce-fab5d.firebaseapp.com',
    databaseURL: 'https://topecommerce-fab5d-default-rtdb.firebaseio.com',
    storageBucket: 'topecommerce-fab5d.appspot.com',
    measurementId: 'G-DBXTYH7DZW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAny28jOleouHiPv4kPs_8ZspzwdEqJVvM',
    appId: '1:75123193741:android:04b69785b9ca20b3f66fc4',
    messagingSenderId: '75123193741',
    projectId: 'topecommerce-fab5d',
    databaseURL: 'https://topecommerce-fab5d-default-rtdb.firebaseio.com',
    storageBucket: 'topecommerce-fab5d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWZim25hn8y5V_u_jkFfuhuuW4deiRqmI',
    appId: '1:75123193741:ios:717012a7fbf4807df66fc4',
    messagingSenderId: '75123193741',
    projectId: 'topecommerce-fab5d',
    databaseURL: 'https://topecommerce-fab5d-default-rtdb.firebaseio.com',
    storageBucket: 'topecommerce-fab5d.appspot.com',
    androidClientId: '75123193741-2nq59m9fm5sr0jjha1dt26vio4m3o9r4.apps.googleusercontent.com',
    iosClientId: '75123193741-u9aganh01588pau96gk1g1la5i7fkpnu.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWZim25hn8y5V_u_jkFfuhuuW4deiRqmI',
    appId: '1:75123193741:ios:717012a7fbf4807df66fc4',
    messagingSenderId: '75123193741',
    projectId: 'topecommerce-fab5d',
    databaseURL: 'https://topecommerce-fab5d-default-rtdb.firebaseio.com',
    storageBucket: 'topecommerce-fab5d.appspot.com',
    androidClientId: '75123193741-2nq59m9fm5sr0jjha1dt26vio4m3o9r4.apps.googleusercontent.com',
    iosClientId: '75123193741-u9aganh01588pau96gk1g1la5i7fkpnu.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );
}
