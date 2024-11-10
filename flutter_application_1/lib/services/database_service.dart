import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/budgetgoals.dart';

const String TODO_COLLECTION_REF = "BudgetGoals";

class DatabaseService {

  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _BudgetGoalsRef;

  DatabaseService() {
    _BudgetGoalsRef = _firestore.collection(TODO_COLLECTION_REF).withConverter<Budgetgoals>(
      fromFirestore: (snapshots, _) => Budgetgoals.fromJson(
          snapshots.data()!,
        ), 
      toFirestore: (BudgetGoals, _) => BudgetGoals.toJson());
  }

  Stream<QuerySnapshot> getBudgetGoals() {
    return _BudgetGoalsRef.snapshots();
  }

  void addBudgetGoals(Budgetgoals BudgetGoals) async{
    _BudgetGoalsRef.add(BudgetGoals);
  }

  void updateBudgetGoal(String budgetID, Budgetgoals budget) {
    _BudgetGoalsRef.doc(budgetID).update(budget.toJson());
  }

  void deleteBudgetGoal(String budgetID) {
    _BudgetGoalsRef.doc(budgetID).delete();
  }
}