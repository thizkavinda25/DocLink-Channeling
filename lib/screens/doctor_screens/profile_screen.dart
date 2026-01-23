import 'package:e_channeling/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Profile Setup',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Text(
              'Fill in you professional credential',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  _profileAvatar(),
                  SizedBox(height: 15),
                  Text(
                    'CHANGE PROFILE PHOTO',
                    style: TextStyle(color: CustomColors.primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            _textField('FULL PROFESSIONAL NAME', '', Icons.person),
            SizedBox(height: 20),
            _textField(
              'MEDICAL SPECIALIZATION',
              '',
              Icons.medical_services_rounded,
            ),
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: CustomColors.primaryColor,
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _profileAvatar() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      CircleAvatar(
        radius: 60,
        backgroundColor: Colors.teal.shade300,
        child: CircleAvatar(
          radius: 55,
          backgroundImage: NetworkImage(
            'https://static.vecteezy.com/system/resources/thumbnails/028/287/555/small/an-indian-young-female-doctor-isolated-on-green-ai-generated-photo.jpg',
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
            onPressed: () {},
          ),
        ),
      ),
    ],
  );
}

Widget _textField(String labelText, String hintText, IconData icon) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: TextStyle(color: const Color.fromARGB(255, 81, 106, 135)),
      ),
      SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.grey.shade400),
        ),
      ),
    ],
  );
}
