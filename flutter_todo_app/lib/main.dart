import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_app/data/local_storage.dart';
import 'package:flutter_todo_app/models/task_model.dart';
import 'package:flutter_todo_app/pages/home_page.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

// task_model de hive işlemleri yapıldıktan sonra main e geçiyoruz
// register işlemlerini yapıyoruz.

//getit...
final locator = GetIt.instance;
void setup() {
  // degisecek tek yer HiveLocalStorage -> örnek MockStorage
  locator.registerSingleton<LocalStorage>(HiveLocalStorage());
}

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  // kutumuzu açıyoruz.
  var taskBox = await Hive.openBox<Task>('tasks');
  // bir gün önce ki verileri silmek istiyoruz; foreach ile elemanları geziyoruz.
  for (var task in taskBox.values) {
    if (task.createdAt.day != DateTime.now().day) {
      taskBox.delete(task.id);
    }
  }
}

Future<void> main() async {
  // uzun sürecek işlem oldugu için widgetflutterbinding
  WidgetsFlutterBinding();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await setupHive();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black))),
      home: HomePage(),
    );
  }
}
