import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'model/todo_list_manager.dart';
import 'model/todo_model.dart';

final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>(((ref) {
  return TodoListManager([
    TodoModel(id: const Uuid().v4(), description: 'DERS ÇALIŞ'),
    TodoModel(id: const Uuid().v4(), description: 'KİTAP OKU'),
  ]); // istersen içine TodoModel ekleyip uygulama ana ekranı boş gelmez
}));
