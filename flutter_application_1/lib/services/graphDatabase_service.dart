import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/graph.dart';

const String TODO_COLLECTION_REF = "Graph";

class GraphDatabaseService {

  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _GraphRef;

  GraphDatabaseService() {
    _GraphRef = _firestore.collection(TODO_COLLECTION_REF).withConverter<Graph>(
      fromFirestore: (snapshots, _) => Graph.fromJson(
          snapshots.data()!,
        ), 
      toFirestore: (Graph, _) => Graph.toJson());
  }

  Stream<QuerySnapshot> getGraph() {
    return _GraphRef.snapshots();
  }

  void addGraph(Graph Graph) async{
    _GraphRef.add(Graph);
  }

  void updateGraph(String budgetID, Graph budget) {
    _GraphRef.doc(budgetID).update(budget.toJson());
  }
}