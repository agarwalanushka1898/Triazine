import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:triazine/presentation/screens/home_screen.dart';
import 'package:triazine/presentation/widgets/buttons/curved_border_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int count = 60;
  late Timer _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  _startTimer() {
    count = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count == 0) {
        _timer.cancel();
        return;
      }
      setState(() {
        count--;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
                  "Enter verification code",
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
                OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 50,
                  // spaceBetween: 10,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    print("Completed: $pin");
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CurvedBorderButton(
                        child: "NEXT",
                        ontap: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomeScreen()));
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: count > 0
                            ? null
                            : () {
                                _startTimer();
                              },
                        child: Text(
                          "Send code again",
                          style: TextStyle(
                              color: count > 0
                                  ? Colors.blue.withOpacity(0.5)
                                  : Colors.blue),
                        )),
                    if (count > 0)
                      Text(
                        "($count)",
                        style: const TextStyle(color: Colors.blue),
                      )
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Change phone number",
                      style: TextStyle(decoration: TextDecoration.underline),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
