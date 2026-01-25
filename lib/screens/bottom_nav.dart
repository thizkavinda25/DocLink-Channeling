import 'package:e_channeling/screens/home_screen.dart';
import 'package:e_channeling/screens/my_appointment.dart';
import 'package:e_channeling/screens/profile.dart';
import 'package:e_channeling/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  final List<Widget> pages = [HomeScreen(), MyAppointment(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: CustomColors.primaryColor,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade100,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            activeIcon: Icon(Iconsax.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'My Appointments',
            activeIcon: Icon(Icons.calendar_month),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
