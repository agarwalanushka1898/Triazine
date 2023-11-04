import 'package:flutter/material.dart';


class OtherTab extends StatelessWidget {
  const OtherTab({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}