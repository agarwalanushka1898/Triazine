import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triazine/presentation/screens/login_screen.dart';
import 'package:triazine/presentation/screens/otp_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OtpScreen(),
    );
  }
}
