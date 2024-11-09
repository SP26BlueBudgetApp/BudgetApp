import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/pages/main_screen.dart';
import 'package:flutter_application_1/pages/signup_screen.dart';
import 'package:flutter_application_1/pages/login_screen.dart';
import 'package:flutter_application_1/widgets/textfield.dart';
import 'package:flutter_application_1/widgets/buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget { //Intro Screen
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox( //Logo
                height: 250,
                child: Image.asset(
                  "images/pngtree-bank-icon-png-image_1757496.jpg",
                  fit: BoxFit.contain
                ),
            ),
            const Text(
              "Welcome to Blue BudgetApp",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Enter the App",
              onPressed: () => goToMain(context),
            ),
          ],
        ),
      ),
    );
  }

  goToMain(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
}