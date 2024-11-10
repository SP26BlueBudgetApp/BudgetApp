import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/pages/signup_screen.dart';
import 'package:flutter_application_1/pages/login_screen.dart';
import 'package:flutter_application_1/pages/home_screen.dart';
import 'package:flutter_application_1/widgets/textfield.dart';
import 'package:flutter_application_1/widgets/buttons.dart';
import 'package:flutter/material.dart';

class HomeofficialScreen extends StatefulWidget { //First page in nav bar
  const HomeofficialScreen({Key? key}) : super(key: key);

  @override
  State<HomeofficialScreen> createState() => _HomeofficialState();
  }

class _HomeofficialState extends State<HomeofficialScreen> { //settings page
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
        title: Text("Home"),
        ),
      backgroundColor: Colors.white,
      body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}