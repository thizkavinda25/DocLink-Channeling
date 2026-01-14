import 'dart:async';

import 'package:e_channeling/screens/auth_screen.dart';
import 'package:e_channeling/screens/home_screen.dart';
import 'package:e_channeling/utils/navigate_manage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../services/user_service.dart';
import 'doctor_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  super.initState();
  Timer(const Duration(seconds: 3), () async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      NavigateManage.goReplace(context, AuthScreen());
    } else {
      final userData = await UserService().getUserById(user.uid);

      if (userData!.role == 'doctor') {
        NavigateManage.goReplace(context, DoctorHomeScreen());
      } else {
        NavigateManage.goReplace(context, HomeScreen());
      }
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/lottie/doctor.json',
                height: 350,
                fit: BoxFit.fill,
                repeat: true,
                animate: true,
              ),
              Text.rich(
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                TextSpan(
                  text: 'Doc',
                  children: [
                    TextSpan(
                      text: 'Link',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Text(
                'Care starts here',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
