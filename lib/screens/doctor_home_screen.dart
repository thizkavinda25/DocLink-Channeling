import 'package:e_channeling/services/auth_service.dart';
import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Doctor Home Screen',style: TextStyle(fontSize: 35),),
          SizedBox(height: 20,),
          IconButton(onPressed: (){
           setState(() {
              AuthService().signOut(context);
           });
          }, icon: Icon(Icons.login,size: 35,))
        ],
      ),),
    );
  }
}