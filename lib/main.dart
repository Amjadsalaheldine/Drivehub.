import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'screens/user_home_page.dart'; // صفحة الصفحة الرئيسية للمستخدم
import 'screens/profile_page.dart'; // صفحة البروفايل
import 'screens/driving_lesson_page.dart'; // صفحة تعلم القيادة
import 'screens/emergency_page.dart'; // صفحة الطوارئ
import 'screens/my_booking_page.dart'; // صفحة حجوزاتي

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/userhome': (context) => UserHomePage(), // صفحة UserHome
        '/profile': (context) => ProfilePage(), // صفحة البروفايل
        '/driving_lesson': (context) =>
            DrivingLessonPage(), // صفحة تعلم القيادة
        '/emergency': (context) => EmergencyPage(), // صفحة الطوارئ
        '/my_booking': (context) => MyBookingPage(), // صفحة حجوزاتي
      },
    );
  }
}
