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
      body: SingleChildScrollView(
        child: Column(
              children: [
                //Profile Edit
                Text(
                  "First Last",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                ),
                InkWell(
                  child:
                      const Text("Edit Profile", style: TextStyle(color: Color.fromARGB(255, 114, 114, 114))),
                ),
                SizedBox(height: 20),
        
                //Monthly BReakdown Section
                Text(
                  "Monthly Breakdown",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 75,
                  width: 175,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 143, 143, 143),
                      ),
                  ),
                  child: Text(
                    "Total Income\n\$ 5000\n+ 5%",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 75,
                  width: 175,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 143, 143, 143),
                      ),
                  ),
                  child: Text(
                    "Total Expense\n\$ 3000\n- 3%",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 15),

                //Spending Goals
                Text(
                  "Spending Goals",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 80,
                  width: 175,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                  ),
                  child: Text(
                    "Budget Goals: \$500\nShopping\nclothing\n\$300"
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 80,
                  width: 175,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                  ),
                  child: Text(
                    "Budget Goals: \$200\nRestaurant\nEating out\n\$150"
                  ),
                ),
                SizedBox(height: 20),

                //Transactions
                Text(
                  "Recent Transactions",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  tileColor: Color.fromARGB(255, 238, 238, 238),
                  title: Text(
                    "Amazon \$50",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "Online Shopping"
                  ),
                ),
                SizedBox(height: 5),
                ListTile(
                  tileColor: Color.fromARGB(255, 238, 238, 238),
                  title: Text(
                    "Food Delivery \$20",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "Food"
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}