import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              _topContainer(),
              SizedBox(height: 30),
              SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hint: Text(
                      'Search Doctor or Specialty',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _topContainer() {
  return Row(
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmxCtAv6-KuwyqmthuZbmX9m-1rLa0yKS8IA&s',
        ),
        radius: 23,
      ),
      SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome Back', style: TextStyle(color: Colors.grey.shade700)),
          Text(
            'Hello, Thisara',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Spacer(),
      Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.notifications),
          ),
          Positioned(
            right: 0,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.red,
              child: Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
