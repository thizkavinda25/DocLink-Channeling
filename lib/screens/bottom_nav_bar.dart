import 'package:e_channeling/screens/doctor_home_screen.dart';
import 'package:e_channeling/screens/patients_screen.dart';
import 'package:e_channeling/screens/profile_screen.dart';
import 'package:e_channeling/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int currentIndex = 0;
  final List pages = [DoctorHomeScreen(), PatientsScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: CustomColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade100,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
            activeIcon: Icon(Iconsax.home_2),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Patients',
            activeIcon: Icon(Icons.group),
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle),
            label: 'Profile',
            activeIcon: Icon(Iconsax.profile_2user),
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
