import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:triazine/constants.dart';
import 'package:triazine/presentation/widgets/buttons/curved_border_button.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  List<PageViewModel> introModelsList = introItemList
      .map((e) => PageViewModel(
            // title: "",
            title: e.label,
            body: e.bodyText,

            image: Image.asset(e.imagePath),
            decoration: const PageDecoration(
                footerPadding: EdgeInsets.zero,
                bodyPadding: EdgeInsets.zero,
                imagePadding: EdgeInsets.all(50),
                imageFlex: 3,
                bodyTextStyle: TextStyle(color: Colors.grey)),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IntroductionScreen(
              pages: introModelsList,
              infiniteAutoScroll: true,
              autoScrollDuration: 3000,
              showBackButton: false,
              showNextButton: false,
              showDoneButton: false,
              showSkipButton: false,
              dotsDecorator: DotsDecorator(
                  color: themeColor.withOpacity(0.5),
                  activeColor: themeColor,
                  activeSize: Size(14, 14)),
              onDone: () {
                // On button pressed
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          color: Colors.black, letterSpacing: 2, fontSize: 16),
                    )),
                CurvedBorderButton(
                  child: "LOGIN",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
