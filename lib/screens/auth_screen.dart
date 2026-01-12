import 'package:e_channeling/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
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
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey.shade500,
                      ),
                      hintText: 'Name',
                      controller: authProvider.nameController,
                    ),

                  CustomTextField(
                    prefixIcon: Icon(
                      CupertinoIcons.mail_solid,
                      color: Colors.grey.shade500,
                    ),
                    hintText: 'Email',
                    controller: authProvider.emailController,
                  ),
                  if (authMode != 'forgot')
                    CustomTextField(
                      prefixIcon: Icon(
                        CupertinoIcons.padlock_solid,
                        color: Colors.grey.shade500,
                      ),
                      hintText: 'Password',
                      isPassword: true,
                      controller: authProvider.passwordController,
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
                      controller: authProvider.confirmPasswordController,
                    ),
                  SizedBox(height: 15),
                  CustomButton(
                    buttonText: authMode == 'signup'
                        ? 'Sign Up'
                        : authMode == 'signin'
                        ? 'Log In'
                        : 'Send Reset Link',
                    onTap: () {
                      if (authMode == 'signup') {
                        authProvider.createAccount(context);
                      } else if (authMode == 'signin') {
                        authProvider.login(context);
                      } else {
                        // Call password reset method
                      }
                    },
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
      },
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
