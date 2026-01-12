import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String authMode = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text.rich(
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                TextSpan(
                  text: 'Your',
                  children: [
                    TextSpan(
                      text: ' Health',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                authMode == 'signup'
                    ? 'Create an account to get started'
                    : authMode == 'signin'
                    ? 'Please log in to your account'
                    : 'Enter your email to reset your password',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30),
              if (authMode == 'signup')
                CustomTextField(
                  prefixIcon: Icon(Icons.person, color: Colors.grey.shade500),
                  hintText: 'Name',
                ),

              CustomTextField(
                prefixIcon: Icon(
                  CupertinoIcons.mail_solid,
                  color: Colors.grey.shade500,
                ),
                hintText: 'Email',
              ),
              if (authMode != 'forgot')
                CustomTextField(
                  prefixIcon: Icon(
                    CupertinoIcons.padlock_solid,
                    color: Colors.grey.shade500,
                  ),
                  hintText: 'Password',
                  isPassword: true,
                ),
              if (authMode == 'signin')
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        authMode = 'forgot';
                      });
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              if (authMode == 'signup')
                CustomTextField(
                  prefixIcon: Icon(
                    CupertinoIcons.padlock_solid,
                    color: Colors.grey.shade500,
                  ),
                  hintText: 'Confirm Password',
                  isPassword: true,
                ),
              SizedBox(height: 15),
              CustomButton(
                buttonText: authMode == 'signup'
                    ? 'Sign Up'
                    : authMode == 'signin'
                    ? 'Log In'
                    : 'Send Reset Link',
              ),
              SizedBox(height: 15),
              _orDivider(authMode),
              SizedBox(height: 15),
              CustomButton(
                buttonText: authMode == 'signup'
                    ? 'Sign In'
                    : authMode == 'signin'
                    ? 'Sign Up'
                    : 'Sign In',
                isOutlined: true,
                onTap: () {
                  setState(() {
                    if (authMode == 'signin') {
                      authMode = 'signup';
                    } else {
                      authMode = 'signin';
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _orDivider(String authMode) {
  return Row(
    children: [
      Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          authMode == 'signup'
              ? 'Already have an account?'
              : authMode == 'signin'
              ? 'Don\'t have an account?'
              : 'Remember me?',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
    ],
  );
}
