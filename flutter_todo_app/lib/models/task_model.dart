import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task_model.g.dart'; // dosya adımız ne ise o

// hiveobject update ve delete işlemlerinde kolaylık sağlıyor.
@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  bool isCompleted;

  Task(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.isCompleted});

  factory Task.create({required String name, required DateTime createdAt}) {
    return Task(
        id: Uuid().v1(), name: name, createdAt: createdAt, isCompleted: false);
  }
}



// v1() : Tarihi string e çevirmeye yarıyor.