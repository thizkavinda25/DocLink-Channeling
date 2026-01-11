import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
                'Just one appointment away',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30),
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
              CustomTextField(
                prefixIcon: Icon(
                  CupertinoIcons.padlock_solid,
                  color: Colors.grey.shade500,
                ),
                hintText: 'Password',
                isPassword: true,
              ),
              CustomTextField(
                prefixIcon: Icon(
                  CupertinoIcons.padlock_solid,
                  color: Colors.grey.shade500,
                ),
                hintText: 'Confirm Password',
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
