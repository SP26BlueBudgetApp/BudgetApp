import 'package:cloud_firestore/cloud_firestore.dart';

class Graph {
  int Expense;
  int Income;
  int Saving;

  Graph({
    required this.Expense,
    required this.Income,
    required this.Saving,
  });

  Graph.fromJson(Map<String, Object?> json) 
    : this(
        Expense: json['Expense'] as int? ?? 0, 
        Income: json['Income'] as int? ?? 0,
        Saving: json['Saving'] as int? ?? 0,
    );

  Graph copyWith({
    int? Expense,
    int? Income,
    int? Saving,
  
  }) {
    return Graph(
        Expense: Expense ?? this.Expense,
        Income: Income ?? this.Income,
        Saving: Saving ?? this.Saving,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'Expense': Expense,
      'Income' : Income,
      'Saving' : Saving,
    };
  }
}