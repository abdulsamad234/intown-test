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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfYOU5BUXdF42nnQsfqL34wTL9kXqlt4Q',
    appId: '1:112156427975:android:a77b201aa335d7a683a0e2',
    messagingSenderId: '112156427975',
    projectId: 'intown-test',
    storageBucket: 'intown-test.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANtu1ka0CkaA2SkYFI5rJVDkEuoSjS3w4',
    appId: '1:112156427975:ios:0a29f29517b8d66a83a0e2',
    messagingSenderId: '112156427975',
    projectId: 'intown-test',
    storageBucket: 'intown-test.appspot.com',
    iosClientId: '112156427975-a9mc96b80pn961ji6jg9gto87kgm8sdm.apps.googleusercontent.com',
    iosBundleId: 'com.example.mapApp',
  );
}
