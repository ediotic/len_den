import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:len_den/models/user_model.dart';
import 'package:len_den/utils/auth_state.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final authState = AuthState.initial.obs;
  final errorMsg = ''.obs;

  final Rxn<UserModel> currentUser = Rxn<UserModel>();

  Future<void> logout() async {
    try {
      authState.value = AuthState.loading;
      errorMsg.value = '';

      await _auth.signOut();

      // Current user ka data clear karein
      currentUser.value = null;

      authState.value = AuthState.success;
    } on FirebaseAuthException catch (e) {
      errorMsg.value = e.message ?? 'Logout failed. Please try again.';
      authState.value = AuthState.error;
    } catch (_) {
      errorMsg.value = 'Something went wrong. Please try again.';
      authState.value = AuthState.error;
    }
  }

  Future<bool> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      authState.value = AuthState.loading;
      errorMsg.value = '';

      // Firebase mein login
      final userLoginDetails = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final firebaseUser = userLoginDetails.user;

      if (firebaseUser == null) {
        errorMsg.value = 'Unable to login. Please try again.';
        authState.value = AuthState.error;
        return false;
      }

      // Firestore se user ki details lena
      final userDoc = await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .get();

      if (userDoc.exists && userDoc.data() != null) {
        currentUser.value = UserModel.fromJson(userDoc.data()!);
      } else {
        // Agar Firestore profile nahi milti,
        // tab bhi Firebase Auth login successful ho sakta hai.
        currentUser.value = null;
      }

      authState.value = AuthState.success;
      return true;
    } on FirebaseAuthException catch (e) {
      errorMsg.value = switch (e.code) {
        'invalid-email' => 'Please enter a valid email.',
        'user-not-found' => 'No account found with this email.',
        'wrong-password' => 'Incorrect password.',
        'invalid-credential' => 'Invalid email or password.',
        'network-request-failed' => 'Please check your internet connection.',
        _ => e.message ?? 'Login failed. Please try again.',
      };

      authState.value = AuthState.error;
      return false;
    } on FirebaseException catch (e) {
      errorMsg.value = e.message ?? 'Could not load user profile.';
      authState.value = AuthState.error;
      return false;
    } catch (_) {
      errorMsg.value = 'Something went wrong. Please try again.';
      authState.value = AuthState.error;
      return false;
    }
  }

  Future<bool> userRegister({
    required String name,
    required String phnNumber,
    required String email,
    required String password,
  }) async {
    try {
      authState.value = AuthState.loading;
      errorMsg.value = '';

      // 1. Firebase Authentication mein account create karein
      final credentials = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final firebaseUser = credentials.user;

      if (firebaseUser == null) {
        errorMsg.value = 'User account could not be created.';
        authState.value = AuthState.error;
        return false;
      }

      // 2. Firebase Auth profile mein name update karein
      await firebaseUser.updateDisplayName(name.trim());

      // 3. UserModel object banayein
      final userModel = UserModel(
        uid: firebaseUser.uid,
        name: name.trim(),
        email: email.trim(),
        phoneNumber: phnNumber.trim(),
      );

      // 4. Firestore mein user details save karein
      await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .set(userModel.toJson());

      // 5. Current user ko controller mein rakhein
      currentUser.value = userModel;

      authState.value = AuthState.success;
      return true;
    } on FirebaseAuthException catch (e) {
      errorMsg.value = switch (e.code) {
        'email-already-in-use' => 'Email is already registered.',
        'invalid-email' => 'Please enter a valid email.',
        'weak-password' => 'Please choose a stronger password.',
        'network-request-failed' => 'Please check your internet connection.',
        _ => e.message ?? 'Registration failed.',
      };

      authState.value = AuthState.error;
      return false;
    } on FirebaseException catch (e) {
      errorMsg.value = e.message ?? 'Could not save user profile.';
      authState.value = AuthState.error;
      return false;
    } catch (_) {
      errorMsg.value = 'Something went wrong. Please try again.';
      authState.value = AuthState.error;
      return false;
    }
  }
}
