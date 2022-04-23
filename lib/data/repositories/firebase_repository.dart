import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  //Class with all Authentication and firestore functions

  final FirebaseAuth _firebaseAuth        = FirebaseAuth.instance;

  final FirebaseFirestore _firestore      = FirebaseFirestore.instance;

}
