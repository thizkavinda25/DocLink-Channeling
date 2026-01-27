import 'package:e_channeling/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({super.key});

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
        title: Text(
          'My Appointments',
          style: TextStyle(
            color: CustomColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: const Color.fromARGB(224, 229, 236, 254),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedTab == 0
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Upcoming',
                            style: TextStyle(
                              color: _selectedTab == 0
                                  ? const Color.fromARGB(255, 66, 103, 178)
                                  : Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedTab == 1
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Past',
                            style: TextStyle(
                              color: _selectedTab == 1
                                  ? const Color.fromARGB(255, 66, 103, 178)
                                  : Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _selectedTab == 0
                ? Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: _doctorDetails(),
                  )
                : Text('data'),
          ],
        ),
      ),
    );
  }
}

Widget _doctorDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          image: DecorationImage(
            image: NetworkImage(
              'https://media.istockphoto.com/id/1342134434/photo/caring-doctor-listens-to-patient.jpg?s=612x612&w=0&k=20&c=oTy-3urXPXBh_7oNGQS-mbleCsKpcxGz_-WLcL40EMk=',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr. Aris Thorne',
              style: TextStyle(
                color: CustomColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              spacing: 10,
              children: [
                Text(
                  'Cardiologist',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 29, 50, 80),
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Heart & Vascular Center',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 29, 50, 80),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 15,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.event, color: Colors.grey.shade700, size: 15),
                    SizedBox(width: 3),
                    Text(
                      'Jan 27, 2026',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 42, 73, 117),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.access_time_filled,
                      color: Colors.grey.shade700,
                      size: 15,
                    ),
                    SizedBox(width: 3),
                    Text(
                      '10:30 AM',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 42, 73, 117),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: CustomColors.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.event, color: Colors.white, size: 22),
                        SizedBox(width: 5),
                        Text(
                          'Add to Calendar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
