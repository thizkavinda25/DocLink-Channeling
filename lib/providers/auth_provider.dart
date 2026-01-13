import 'package:e_channeling/models/user_model.dart';
import 'package:e_channeling/screens/home_screen.dart';
import 'package:e_channeling/services/auth_service.dart';
import 'package:e_channeling/services/user_service.dart';
import 'package:e_channeling/utils/custom_dialogs.dart';
import 'package:e_channeling/utils/navigate_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  Future<void> createAccount(BuildContext context) async {
    if (_nameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty ||
        _confirmPasswordController.text.trim().isEmpty) {
      CustomDialogs.errorMessage(
        context,
        'Please fill in all the required fields.',
      );
    } else if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(_emailController.text.trim()) ==
        false) {
      CustomDialogs.errorMessage(
        context,
        'Please enter a valid email address.',
      );
    } else if (_passwordController.text.trim().length < 6) {
      CustomDialogs.errorMessage(
        context,
        'Password must be at least 6 characters long.',
      );
    } else if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      CustomDialogs.errorMessage(context, 'Passwords do not match');
    } else {
      EasyLoading.show(status: 'Creating account');
      final user = await AuthService().signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
      if (user != null) {
        final userModel = UserModel(
          uid: user.uid,
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
        );
        final isSuccess = await UserService().saveUserData(userModel);
        if (isSuccess && context.mounted) {
          NavigateManage.goReplace(context, HomeScreen());
        }
      }

      EasyLoading.dismiss();
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
    }
  }

  Future<void> login(BuildContext context) async {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      CustomDialogs.errorMessage(
        context,
        'Please fill in all the required fields.',
      );
    } else if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(_emailController.text.trim()) ==
        false) {
      CustomDialogs.errorMessage(
        context,
        'Please enter a valid email address.',
      );
    } else {
      EasyLoading.show(status: 'Logging in');
      final user = await AuthService().signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
      if (user != null && context.mounted) {
        NavigateManage.goReplace(context, HomeScreen());
      }

      EasyLoading.dismiss();
      _emailController.clear();
      _passwordController.clear();
    }
  }

  Future<void> sendResetEmail(BuildContext context) async {
    if (_emailController.text.trim().isEmpty) {
      CustomDialogs.errorMessage(context, 'Please enter your email');
      return;
    }

    if (!RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+",
    ).hasMatch(_emailController.text.trim())) {
      CustomDialogs.errorMessage(context, 'Invalid email address');
      return;
    }

    EasyLoading.show(status: 'Sending reset email...');

    try {
      await Future.delayed(const Duration(milliseconds: 300));
      await AuthService().resetPassword(email: _emailController.text.trim());

      if (context.mounted) {
        CustomDialogs.successMessage(
          context,
          'Password reset email sent successfully',
        );
      }

      _emailController.clear();
    } catch (e) {
      EasyLoading.showError('Something went wrong');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
