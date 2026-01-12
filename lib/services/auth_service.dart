// ignore_for_file: use_build_context_synchronously

import 'package:e_channeling/utils/custom_dialogs.dart';
import 'package:e_channeling/utils/navigate_manage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/auth_screen.dart';

class AuthService {
  Future<User?> signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use' && context.mounted) {
        CustomDialogs.errorMessage(
          context,
          'The account already exists for that email.',
        );
      } else if (e.code == 'weak-password' && context.mounted) {
        CustomDialogs.errorMessage(context, 'The password is too weak.');
      }
    } catch (error) {
      return null;
    }
    return null;
  }

  Future<User?> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        CustomDialogs.errorMessage(
          context,
          'Please check your email and password.',
        );
      }
    } catch (error) {
      return null;
    }
    return null;
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    NavigateManage.goReplace(context, AuthScreen());
  }
}
