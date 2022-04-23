import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_location.dart';

class FirebaseRepository {
  //Class with all Authentication and firestore functions

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firestoreDB = FirebaseFirestore.instance;

  /// Function to sign in anonymously
  Future<void> signIn() async {
    try {
      await _firebaseAuth.signInAnonymously();
    } on FirebaseAuthException catch (exception) {
      throw Exception(exception.toString());
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  /// Check if user is logged in
  bool isUserLoggedIn() {
    try {
      final User? currentUser = _firebaseAuth.currentUser;
      return currentUser != null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Get current user id
  String getUserId() {
    try {
      final User? currentUser = _firebaseAuth.currentUser;
      return currentUser!.uid;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Log user out
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Do upload to firebase firestore
  Future<void> uploadLocation(UserLocation userLocation, String uid) async {
    try {
      // Check if user has location stored in firebase if not create it
      await _firestoreDB.collection('users').doc(uid).set(<String, dynamic>{
        'location': GeoPoint(userLocation.latitude, userLocation.longitude)
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
