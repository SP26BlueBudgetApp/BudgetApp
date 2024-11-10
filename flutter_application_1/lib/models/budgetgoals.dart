import 'package:cloud_firestore/cloud_firestore.dart';

class Budgetgoals {
  String category;
  int budget;
  bool isDone;
  Timestamp createdOn;
  Timestamp updatedOn;

  Budgetgoals({
    required this.category,
    required this.budget,
    required this.isDone,
    required this.createdOn,
    required this.updatedOn,
  });

  Budgetgoals.fromJson(Map<String, Object?> json) 
    : this(
        category: json['category'] as String? ?? 'No Category', 
        budget: json['budget'] as int? ?? 0,
        isDone: json['isDone'] as bool? ?? false,
        createdOn: json['createdOn'] as Timestamp? ?? Timestamp.now(),
        updatedOn: json['updatedOn'] as Timestamp? ?? Timestamp.now(),
    );

  Budgetgoals copyWith({
    String? category,
    int? budget,
    bool? isDone,
    Timestamp? createdOn,
    Timestamp? updatedOn,
  
  }) {
    return Budgetgoals(
        category: category ?? this.category,
        budget: budget ?? this.budget,
        isDone: isDone ?? this.isDone,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn
    );
  }

  Map<String, Object?> toJson() {
    return {
      'category': category,
      'budget' : budget,
      'isDone' : isDone,
      'createdOn' : createdOn,
      'updatedOn' : updatedOn,
    };
  }
}