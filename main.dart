import 'package:flutter/material.dart';
import 'package:internship_dp_flutter/Screens/login_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Login_Page_main();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login_Page_main(),
    );
  }
}
