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
            Expanded(
              child: _selectedTab == 0
                  ? const Center(child: Text('Upcoming Appointments'))
                  : const Center(child: Text('Past Appointments')),
            ),
          ],
        ),
      ),
    );
  }
}
