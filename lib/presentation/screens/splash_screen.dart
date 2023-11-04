import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:triazine/presentation/screens/info_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    log("start");
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const InfoScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text(
          "Splash Screen",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
