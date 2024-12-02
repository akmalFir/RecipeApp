import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Rx<User?> firebaseUser = Rx<User?>(null);
  var userDetails = Rx<Map<String, dynamic>?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _fetchUserDetails);
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar('Login Error', e.toString());
    }
  }

  Future<void> register(String name, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': name,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      Get.snackbar('Success', 'Account created successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password reset email sent');
    } catch (e) {
      Get.snackbar('Reset Error', e.toString());
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed(AppRoutes.login);
  }

  Future<void> _fetchUserDetails(User? user) async {
    if (user != null) {
      final snapshot = await _firestore.collection('users').doc(user.uid).get();
      userDetails.value = snapshot.data();
    } else {
      userDetails.value = null;
    }
  }
}
