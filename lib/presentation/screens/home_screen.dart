import 'package:flutter/material.dart';
import 'package:triazine/constants.dart';
import 'package:triazine/presentation/screens/tabs/home_tab.dart';
import 'package:triazine/presentation/screens/tabs/other_tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _tabs = [
    HomeTab(),
    OtherTab(title: "Second"),
    OtherTab(title: "Third"),
    OtherTab(title: "Fourth"),
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            index = val;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.paid), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.verified), label: "Badge"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: themeColor,
      ),
      body: _tabs[index],
    );
  }
}
