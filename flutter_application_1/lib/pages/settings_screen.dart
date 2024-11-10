import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/pages/signup_screen.dart';
import 'package:flutter_application_1/pages/login_screen.dart';
import 'package:flutter_application_1/pages/home_screen.dart';
import 'package:flutter_application_1/widgets/textfield.dart';
import 'package:flutter_application_1/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingScreenState();
  }

class _SettingScreenState extends State<SettingsScreen> { //settings page
  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
        title: Text("Settings"),
        ),
      backgroundColor: Colors.white,
      body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox( // Account Settings
                child: TextButton.icon(
                  onPressed: () {
                
                  },
                  icon: const Icon(Icons.account_circle, color: Color.fromARGB(255, 49, 49, 49)),
                  label: const Text('Account Settings'),
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 49, 49, 49), // Text color
                    textStyle: const TextStyle(
                      fontSize: 28,
                      inherit: true,
                      ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox( // Privacy Settings
                child: TextButton.icon(
                  onPressed: () {
                
                  },
                  icon: const Icon(Icons.privacy_tip, color: Color.fromARGB(255, 49, 49, 49)),
                  label: const Text('Privacy Settings'),
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 49, 49, 49), // Text color
                    textStyle: const TextStyle(
                      fontSize: 28,
                      inherit: true,
                      ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox( // Theme settings
                child: TextButton.icon(
                  onPressed: () {
                
                  },
                  icon: const Icon(Icons.format_paint, color: Color.fromARGB(255, 49, 49, 49)),
                  label: const Text('Theme Settings'),
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 49, 49, 49), // Text color
                    textStyle: const TextStyle(
                      fontSize: 28,
                      inherit: true,
                      ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox( // Notification settings
                child: TextButton.icon(
                  onPressed: () {
                
                  },
                  icon: const Icon(Icons.notification_add, color: Color.fromARGB(255, 49, 49, 49)),
                  label: const Text('Notification Settings'),
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 49, 49, 49), // Text color
                    textStyle: const TextStyle(
                      fontSize: 28,
                      inherit: true,
                      ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              CustomButton( //signout button
                label: "Sign Out",
                onPressed: () async {
                  await auth.signout();
                  goToLogin(context);
                },
              )
            ],
        ),
      ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
}