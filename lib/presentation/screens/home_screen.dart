import 'package:flutter/material.dart';
import 'package:triazine/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: themeColor,
            height: 140,
          )
        ],
      ),
    );
  }
}
