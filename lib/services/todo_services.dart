import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_riverpot_connected_firebase/models/todo_model.dart';

class TodoService {
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');

  // Crud
  void addNewTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }
}
