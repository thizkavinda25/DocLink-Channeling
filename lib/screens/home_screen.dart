import 'package:e_channeling/utils/custom_colors.dart';
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
              _searchBar(),
              SizedBox(height: 25),
              _filterText('Categories', 'See all', () {}),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _categoryType(
                    'Cardiology',
                    'https://wallpapers.com/images/hd/heartbeat-icon-cardiology-symbol-ztqhiau3i8dhfu5k.jpg',
                  ),
                  _categoryType(
                    'Dental',
                    'https://cdn-icons-png.flaticon.com/512/2818/2818366.png',
                  ),
                  _categoryType(
                    'Neurology',
                    'https://cdn-icons-png.flaticon.com/512/8125/8125694.png',
                  ),
                  _categoryType(
                    'Pediatrics',
                    'https://cdn-icons-png.flaticon.com/512/7858/7858216.png',
                  ),
                ],
              ),
              SizedBox(height: 25),
              _filterText('Recommended Doctors', 'View All', () {}),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                height: 130,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dr.James Robinson',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Cardiologist',
                          style: TextStyle(color: CustomColors.primaryColor),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Heart Clinic',
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: const Color.fromARGB(255, 241, 201, 56),
                            ),
                            Text('4.5'),
                            Text('(120 reviews)'),
                            SizedBox(width: 5),
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: CustomColors.primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
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
          'https://scontent.fcmb12-1.fna.fbcdn.net/v/t39.30808-1/516455545_708522328633028_5045923263555048150_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=102&ccb=1-7&_nc_sid=e99d92&_nc_eui2=AeFRdODaKZgZtdGUXxCfmqY6Dvk54LZcHTMO-TngtlwdMzfs_nporzfdnYjth-c4Y-h3xya4IRZgSZMvd_Gswwi1&_nc_ohc=LO4PqqQX_hwQ7kNvwFAgcIY&_nc_oc=AdkEgzMrZVhkCtGfoIqWYmzFtm7jXviZ0gzdjFodas-oNn_Os_K4A3ahNueQLDkXnk0&_nc_zt=24&_nc_ht=scontent.fcmb12-1.fna&_nc_gid=VGCTaGebWE0jbkUBTG05bQ&oh=00_AfoD1v45ESAlmEfZe-ibr8yhOx1wT1m0ueddIG-xeG2c3w&oe=697D1B9A',
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
            child: Icon(Icons.notifications, size: 30),
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

Widget _searchBar() {
  return SizedBox(
    width: 350,
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        hint: Text(
          'Search Doctor or Specialty',
          style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
        ),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

Widget _filterText(
  String labelText,
  String buttonText,
  VoidCallback onPressed,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        labelText,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(color: CustomColors.primaryColor),
        ),
      ),
    ],
  );
}

Widget _categoryType(String categoryName, String url) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey.shade200,
        backgroundImage: NetworkImage(url),
      ),
      SizedBox(height: 5),
      Text(categoryName),
    ],
  );
}
