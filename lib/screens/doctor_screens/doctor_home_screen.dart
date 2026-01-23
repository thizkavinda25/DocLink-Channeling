import 'package:e_channeling/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topContain(),
            _patientAvailabilityCase(value, (bool newValue) {
              setState(() {
                value = newValue;
              });
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _appoinmentStatus(
                  screenSize.width * 0.43,
                  Icons.event_available,
                  'TODAY',
                  12.toString(),
                ),
                _appoinmentStatus(
                  screenSize.width * 0.43,
                  Icons.event_available,
                  'WEEKLY',
                  '\$${1240.toString()}',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Appointments',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(color: CustomColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _topContain() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MONDAY, FEB 21',
            style: TextStyle(color: CustomColors.primaryColor, fontSize: 15),
          ),
          Text(
            'Good Morning,\nDr.Name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      CircleAvatar(
        radius: 23,
        backgroundImage: NetworkImage(
          'https://static.vecteezy.com/system/resources/thumbnails/028/287/555/small/an-indian-young-female-doctor-isolated-on-green-ai-generated-photo.jpg',
        ),
      ),
    ],
  );
}

Widget _patientAvailabilityCase(bool value, ValueChanged<bool> onChanged) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    margin: EdgeInsets.only(top: 20, bottom: 25),
    width: double.infinity,
    height: 80,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 45,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(73, 137, 171, 199),
          child: Icon(
            Icons.settings_input_antenna,
            color: CustomColors.primaryColor,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Visibility',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              'Currently accepting patients',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
        CupertinoSwitch(value: value, onChanged: onChanged),
      ],
    ),
  );
}

Widget _appoinmentStatus(
  double width,
  IconData icon,
  String day,
  String count,
) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    margin: EdgeInsets.only(bottom: 25),
    width: width,
    height: 150,
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(15),
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Icon(icon),
        ),

        Text(day, style: TextStyle(color: Colors.grey.shade700)),
        Text(
          count,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: CustomColors.primaryColor,
          ),
        ),
      ],
    ),
  );
}
