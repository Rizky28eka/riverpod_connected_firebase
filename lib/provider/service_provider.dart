import 'package:f_riverpot_connected_firebase/services/todo_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceProvider = StateProvider<TodoService>((ref) {
  return TodoService();
});
