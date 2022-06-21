import 'package:flutter_demo_state/model/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class TodoListManager extends StateNotifier<List<TodoModel>> {
  // initalTodos geçilmemişse boş bir dizi olusacak
  TodoListManager([List<TodoModel>? initialTodos]) : super(initialTodos ?? []);

  // id ataması bizde olcak sadece descprition eklenecek
  void addTodo(String description) {
    // state içinde todomodel olan bir liste veriyor.
    // state guncelleme
    var eklenecekTodo =
        TodoModel(id: const Uuid().v1(), description: description);
    // anlamı ...state : var olan listedekileri getir , sonra eklenecekTodoyu ekle
    state = [...state, eklenecekTodo];
  }

  // CHECKBOX kismi
  void toggle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
            id: todo.id,
            description: todo.description,
            completed: !todo.completed,
          )
        else
          todo,
    ];
  }

  // update
  void edit({required String id, required String newDescription}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
            id: todo.id,
            description: newDescription,
            completed: todo.completed,
          )
        else
          todo,
    ];
  }

  // delete remove
  void remove(TodoModel silinecekTodo) {
    // id leri aynı olmayan verileri yeni state oluşturup ekliyoruz.
    state = state.where((element) => element.id != silinecekTodo.id).toList();
  }

  int unCompletedTodos() {
    // bu method tamamlanmamış görevlerin sayısını donderir
    return state.where((element) => !element.completed).length;
  }
}
