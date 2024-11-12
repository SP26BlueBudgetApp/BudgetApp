import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/pages/budget_screen.dart';
import 'package:flutter_application_1/pages/report_screen.dart';
import 'package:flutter_application_1/pages/settings_screen.dart';
import 'package:flutter_application_1/pages/homeOfficial_screen.dart';
import 'package:flutter_application_1/pages/signup_screen.dart';
import 'package:flutter_application_1/pages/home_screen.dart';
import 'package:flutter_application_1/pages/signup_screen.dart';
import 'package:flutter_application_1/widgets/textfield.dart';
import 'package:flutter_application_1/widgets/buttons.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget { //Literally JUST THE NAV BAR
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
  }

class _MainScreenState extends State<MainScreen> {
  int myIndex = 0; //settings page
  List<Widget> widgetList = const [
    HomeofficialScreen(),
    BudgetScreen(),
    ReportScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) { //Change state on navigation bar
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Budget',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reporting',
            backgroundColor: Colors.black,
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.black,
          ),
        ],
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: IndexedStack(
            index: myIndex,
            children: widgetList,
          ),
        ),
      ),
    );
  }
}