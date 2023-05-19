import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user details in Firestore
      await _db.collection('Users').doc(userCredential.user!.uid).set({
        'email': email,
        'password': password,
      });

      print('Registration successful');
    } catch (e) {
      print('Error during registration: $e');
    }
    Firebase.initializeApp();
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('Login successful');
      print('User ID: ${userCredential.user!.uid}');
    } catch (e) {
      print('Error during login: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('Sign out successful');
    } catch (e) {
      print('Error during sign out: $e');
    }
  }
}




