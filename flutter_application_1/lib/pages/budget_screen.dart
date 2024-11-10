import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/pages/signup_screen.dart';
import 'package:flutter_application_1/pages/login_screen.dart';
import 'package:flutter_application_1/pages/home_screen.dart';
import 'package:flutter_application_1/pages/settings_screen.dart';
import 'package:flutter_application_1/services/database_service.dart';
import 'package:flutter_application_1/models/budgetgoals.dart';
import 'package:flutter_application_1/widgets/textfield.dart';
import 'package:flutter_application_1/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
  }

class _BudgetScreenState extends State<BudgetScreen> { //Budget page
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: _buildUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: _displayTextInputDialog,
        backgroundColor: Color.fromARGB(255, 49, 49, 49),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        "Budget"
      ),
    );
  }

  Widget _buildUI() {
    return SafeArea(
        child: Column(
          children: [
            _messagesListView(),
          ],
        ),
    );
  }

  Widget _messagesListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        stream: _databaseService.getBudgetGoals(),
        builder: (context, snapshot) {
          List BudgetGoals = snapshot.data?.docs ?? [];
          if (BudgetGoals.isEmpty) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SizedBox(
                  height: 150,
                  child: Image.asset(
                    "images/pngtree-bank-icon-png-image_1757496.jpg",
                    fit: BoxFit.contain
                  ),
                ),
                Text(
                "Add a new BudgetGoal first",
                style: TextStyle(fontSize: 30)),
                
                ],
            ),
              // child: Text(
              //   "Add a new BudgetGoal first",
              //   style: TextStyle(fontSize: 30)),
            );
          }
          return ListView.builder(
            itemCount: BudgetGoals.length,
            itemBuilder: (context, index) {
              Budgetgoals budget = BudgetGoals[index].data();
              String budgetID = BudgetGoals[index].id;
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: ListTile(
                tileColor: Color.fromARGB(255, 238, 238, 238),
                title: Text(
                  budget.category + " \n\$" + budget.budget.toString(),
                  style: TextStyle(fontSize: 20),
                  ),
                subtitle: Text(
                  "\Creation Date: " +
                  DateFormat("MM-dd-yyyy h:mm a").format(
                    budget.createdOn.toDate(),
                  ) +
                  "\n\End Date:         " +
                  DateFormat("MM-dd-yyyy h:mm a").format(
                    budget.updatedOn.toDate(),
                  ),
                ),
                trailing: Checkbox(
                  value: budget.isDone, 
                  onChanged: (value) {
                    Budgetgoals updateBudget = budget.copyWith(isDone: !budget.isDone, updatedOn: Timestamp.now());
                  _databaseService.updateBudgetGoal(budgetID, updateBudget);
                  }),
                  onLongPress: () {
                    _databaseService.deleteBudgetGoal(budgetID);
                  },
              ),
              );
          });
        }
      ),
    );
  }

  void _displayTextInputDialog() async {
    return showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text('Add a budget goal'),
          content: Column(
            children: [
              TextField(
                controller: _textEditingController1, 
                decoration: InputDecoration(hintText: "Category"),
              ),
              TextField(
                controller: _textEditingController2, 
                decoration: InputDecoration(hintText: "budget in money ex. 100"),
              )
            ],
          ),
          actions: <Widget> [
            MaterialButton (
              color: Color.fromARGB(255, 49, 49, 49),
              textColor: Colors.white,
              child: Text('Create'),
              onPressed: () {
                Budgetgoals budget = Budgetgoals(
                  category: _textEditingController1.text,
                  budget: int.parse(_textEditingController2.text), 
                  isDone: false, 
                  createdOn: Timestamp.now(), 
                  updatedOn: Timestamp.now(),
                );
                _databaseService.addBudgetGoals(budget);
                Navigator.pop(context);
                _textEditingController1.clear();
                _textEditingController2.clear();
              },
            ),
          ]
        );
      }
    );
  }
}