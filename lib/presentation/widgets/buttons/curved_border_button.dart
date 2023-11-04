import 'package:flutter/material.dart';

class CurvedBorderButton extends StatelessWidget {
  const CurvedBorderButton({super.key, required this.child});
  final String child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(50)),
      child: Text(
        child,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, letterSpacing: 2),
      ),
    );
  }
}
