import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/pages/signup_screen.dart';
import 'package:flutter_application_1/pages/login_screen.dart';
import 'package:flutter_application_1/pages/home_screen.dart';
import 'package:flutter_application_1/pages/settings_screen.dart';
import 'package:flutter_application_1/services/graphDatabase_service.dart';
import 'package:flutter_application_1/models/graph.dart';
import 'package:flutter_application_1/widgets/textfield.dart';
import 'package:flutter_application_1/widgets/buttons.dart';
import 'package:flutter_application_1/widgets/badges.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
  }

class _ReportScreenState extends State<ReportScreen> { //Budget page
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

  int touchedIndex=0;

  final GraphDatabaseService _databaseService = GraphDatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: _buildUI(),
      );
  }

    PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        "Report"
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
        stream: _databaseService.getGraph(),
        builder: (context, snapshot) {
          List graph = snapshot.data?.docs ?? [];
          
          return ListView.builder(
            itemCount: graph.length,
            itemBuilder: (context, index) {
              Graph report = graph[index].data();
              String reportID = graph[index].id;
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 55,
                horizontal: 10,
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.black),
                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),                        )
                        ),
                    ),
                    child: Text(
                        "Income: " + "\$" + report.Income.toString(),
                        style: TextStyle(fontSize: 32),
                      ),
                    onLongPress: () {
                      _displayTextInputDialogExpense(reportID);
                    },  
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.black),
                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),                        )
                        ),
                    ),
                    child: Text(
                        "Expense: " + "\$" + report.Expense.toString(),
                        style: TextStyle(fontSize: 32),
                      ),
                    onLongPress: () {
                      _displayTextInputDialogExpense(reportID);
                    },  
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Savings: " + "\$" + report.Saving.toString(),
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: SizedBox(
                      height: 350,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback: 
                              (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                  return;
                                }
                                  touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                                });
                              }
                          ),
                          sections: pieChartSection(report.Expense,report.Income,report.Saving),
                          sectionsSpace: 3,
                          centerSpaceRadius: 0,
                        ),
                      ),
                    ),
                  ),
                ],             
            )
            );
          });
        }
      ),
    );
  }
  void _displayTextInputDialogExpense(String reportID) async {
    return showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text('Change Income/Expense'),
          content: Column(
            children: [
              TextField(
                controller: _textEditingController1, 
                decoration: InputDecoration(hintText: "Income: ex. 100"),
              ),
              TextField(
                controller: _textEditingController2, 
                decoration: InputDecoration(hintText: "Expense: ex. 100"),
              ),
            ],
          ),
          actions: <Widget> [
            MaterialButton (
              color: Color.fromARGB(255, 49, 49, 49),
              textColor: Colors.white,
              child: Text('Change'),
              onPressed: () {
                Graph report = Graph(
                  Expense: int.parse(_textEditingController2.text),
                  Income: int.parse(_textEditingController1.text), 
                  Saving: int.parse(_textEditingController1.text) - int.parse(_textEditingController2.text), 
                );
                _databaseService.updateGraph(reportID, report);
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

  List<PieChartSectionData> pieChartSection(int Expense, int Income, int Savings) {

    int total = Expense+Income+Savings;
    double expensePercent = Expense / total * 100;
    double incomePercent = Income / total * 100;
    double savingsPercent = Savings / total * 100;

    List<Color> sectionColors = [
      Colors.red,
      Colors.green,
      Colors.orange,
    ];

    List<IconData> sectionIcons = [
      Icons.arrow_downward,
      Icons.arrow_upward,
      Icons.savings,
    ];

    return List.generate(
      3, 
      (index) {
        final isTouched = index == touchedIndex;
        final radius = isTouched ? 190.0 : 150.0;
        final fontSize = isTouched ? 30.0 : 24.0;
        final widgetSize = isTouched ? 50.0 : 40.0;
        switch (index) {
          case 0:
            return PieChartSectionData(
              color: sectionColors[index],
              value: expensePercent,
              title: expensePercent.toString() + '%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              badgeWidget: CustomBadge(
                icon: sectionIcons[index], 
                size: widgetSize, 
                borderColor: Colors.black
                ),
              badgePositionPercentageOffset: 0.98,
            );
          case 1:
            return PieChartSectionData(
              color: sectionColors[index],
              value: incomePercent,
              title: incomePercent.toString() + '%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              badgeWidget: CustomBadge(
                icon: sectionIcons[index], 
                size: widgetSize, 
                borderColor: Colors.black
                ),
              badgePositionPercentageOffset: 0.98,
            );
          case 2:
            return PieChartSectionData(
              color: sectionColors[index],
              value: savingsPercent,
              title: savingsPercent.toString() + '%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              badgeWidget: CustomBadge(
                icon: sectionIcons[index], 
                size: widgetSize, 
                borderColor: Colors.black
                ),
              badgePositionPercentageOffset: 0.98,
            );
        }
        return PieChartSectionData(
        );
      },
    );
  }
}