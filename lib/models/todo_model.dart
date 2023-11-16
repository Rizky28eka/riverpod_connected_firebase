import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  late String docID;
  final String titleTask;
  final String description;
  final String category;
  final String dateTask;
  final String timeTask;

  TodoModel({
    required this.titleTask,
    required this.description,
    required this.category,
    required this.dateTask,
    required this.timeTask,
    required docID,
  });

  Map<String, dynamic> toMap() {
    return {
      'docID': docID,
      'titleTask': titleTask,
      'description': description,
      'category': category,
      'dateTask': dateTask,
      'timeTask': timeTask,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      docID: map['docID'] ?? '',
      titleTask: map['titleTask'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      dateTask: map['dateTask'] ?? '',
      timeTask: map['timeTask'] ?? '',
    );
  }

  factory TodoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return TodoModel(
      docID: doc.id,
      titleTask: doc['titleTask'],
      description: doc['description'],
      category: doc['category'],
      dateTask: doc['dateTask'],
      timeTask: doc['timeTask'],
    );
  }
}
