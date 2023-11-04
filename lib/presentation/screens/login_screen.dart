import 'package:flutter/material.dart';
import 'package:triazine/presentation/widgets/buttons/curved_border_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Enter your phone number",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "The quick brown fox jumps over a lazy dog. Djs flock by",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 50),
                const TextField(),
                const SizedBox(height: 20),
                RadioListTile(
                  value: true,
                  groupValue: true,
                  onChanged: (v) {},
                  title: const Text(
                    "I have read and agree to the terms of use of NPAY",
                    style: TextStyle(color: Colors.grey),
                  ),
                  // subtitle: Text("clskjlkj"),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [CurvedBorderButton(child: "NEXT")],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
