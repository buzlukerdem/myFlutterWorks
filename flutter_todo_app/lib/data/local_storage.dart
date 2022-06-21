// bu sınıfımız abstarct olmalı çünkü ilerde sqflite ya da hive kullanacağımızda değişikliklerden widgetlarımız etkilenmemeli.

import 'package:flutter_todo_app/models/task_model.dart';
import 'package:hive/hive.dart';

abstract class LocalStorage {
  // future olacak temel veriler.
  Future<void> addTask({required Task task});
  Future<bool> deleteTask({required Task task});
  Future<Task> updateTask({required Task task});
  Future<Task?> getTask({required String id});
  Future<List<Task>> getAllTask();
}
// daha sonra hive , hive_generator, hive_flutter, build_runner packages kuruluyor.
// main de register.adapter işlemleri bittikten sonra local_storage.dart a dönüyoruz.

// get_it paketini kullanıyoruz sınıfları tek çatı altında toplamak için.

class HiveLocalStorage extends LocalStorage {
  // bu tane 5 metodu kendimiz hive in metodları ile doldurcaz.
  // ekleme çıkarma yapabilmek için box tanımlamamız lazım.

  late Box<Task> _taskBox;

  HiveLocalStorage() {
    _taskBox = Hive.box('tasks');
  }

  @override
  Future<void> addTask({required Task task}) async {
    await _taskBox.put(task.id, task);
  }

  @override
  Future<bool> deleteTask({required Task task}) async {
    //hiveobject ile.delete
    await task.delete();
    return true;
  }

  @override
  Future<List<Task>> getAllTask() async {
    List<Task> _allTask = <Task>[];
    _allTask = _taskBox.values.toList();
    if (_allTask.isNotEmpty) {
      // tarihe göre sıralama compareTo = kıyaslama
      _allTask.sort((Task a, Task b) => a.createdAt.compareTo(b.createdAt));
    }
    return _allTask;
  }

  @override
  Future<Task?> getTask({required String id}) async {
    if (_taskBox.containsKey(id)) {
      return _taskBox.get(id);
    } else {
      return null;
    }
  }

  @override
  Future<Task> updateTask({required Task task}) async {
    // save ile update.
    await task.save();
    return task;
  }
}


// class MockStorage extends LocalStorage{...} Degisiklik örneği.