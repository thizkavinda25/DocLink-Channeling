import 'package:e_channeling/screens/doctor_screens/doctor_home_screen.dart';
import 'package:e_channeling/screens/doctor_screens/patients_screen.dart';
import 'package:e_channeling/screens/doctor_screens/profile_screen.dart';
import 'package:e_channeling/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DoctorBottomNavBar extends StatefulWidget {
  const DoctorBottomNavBar({super.key});

  @override
  State<DoctorBottomNavBar> createState() => _DoctorBottomNavBar();
}

class _DoctorBottomNavBar extends State<DoctorBottomNavBar> {
  int currentIndex = 0;
  final List pages = [DoctorHomeScreen(), PatientsScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: CustomColors.primaryColor,
        unselectedItemColor: Colors.black,
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
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
