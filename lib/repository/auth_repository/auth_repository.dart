import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  //registration method
  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    String token = await result.user!.getIdToken() ?? '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    log(token);
    return result;

    // on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     throw Exception('This password is too weak');
    //   } else if (e.code == 'email-already-in-use') {
    //     throw Exception('The account already exists for that email.');
    //   }
    // } catch (e) {
    //   throw Exception(e.toString());
  }

  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    String token = await result.user!.getIdToken() ?? '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    log(token);
    return result;
  }

  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
