import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triazine/presentation/screens/home_screen.dart';
import 'package:triazine/presentation/screens/info_screen.dart';
import 'package:triazine/presentation/screens/login_screen.dart';
import 'package:triazine/presentation/screens/otp_screen.dart';
import 'package:triazine/presentation/screens/search_screen.dart';
import 'package:triazine/presentation/screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
