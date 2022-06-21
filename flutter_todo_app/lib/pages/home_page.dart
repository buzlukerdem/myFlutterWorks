import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_todo_app/data/local_storage.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/models/task_model.dart';
import 'package:flutter_todo_app/widgets/custom_search_delegate.dart';
import 'package:flutter_todo_app/widgets/task_list_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Task> _allTasks;
  late LocalStorage _localstorage;

  @override
  void initState() {
    super.initState();
    // degisecek kısım sadece main de ki localstroage kısmı olur
    _localstorage = locator<LocalStorage>();
    _allTasks = <Task>[];
    _getAllTaskDB(); // metod olarak aşağıda tanımlı.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            _showAddTaskBottom();
          },
          child: const Text(
            'Bugün ne yapacaksın?',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: (() {
              _showSearchPage();
            }),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: (() {
              _showAddTaskBottom();
            }),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _allTasks.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                var _oankiEleman = _allTasks[index];
                return Dismissible(
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Bu Görev Silindi.'),
                    ],
                  ),
                  key: Key(_oankiEleman.id),
                  onDismissed: (direction) {
                    _allTasks.removeAt(index);
                    _localstorage.deleteTask(task: _oankiEleman);
                    setState(() {});
                  },
                  child: TaskItem(
                    task: _oankiEleman,
                  ),
                );
              },
              itemCount: _allTasks.length,
            )
          : const Center(
              child: Text('Hadi görev ekle.'),
            ),
    );
  }

  void _showAddTaskBottom() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: // viewInsets.bottom klavye açıldığında hemen bitişiğinde gösterilmesine yaradı.
                EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              title: TextField(
                // açılır açılmaz focus textfield içinde olsun
                autofocus: true,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                    hintText: 'Görev NE OLSUN ?', border: InputBorder.none),
                onSubmitted: (value) {
                  Navigator.of(context).pop();
                  DatePicker.showTimePicker(
                    context,
                    showSecondsColumn: false,
                    onConfirm: (time) async {
                      var eklenecekGorev =
                          Task.create(name: value, createdAt: time);
                      _allTasks.insert(0, eklenecekGorev); //
                      await _localstorage.addTask(task: eklenecekGorev); //
                      // BU İKİSİDE OLMAK ZORUNDA
                      setState(() {});
                    },
                  );
                },
              ),
            ),
          );
        });
  }

  Future<void> _getAllTaskDB() async {
    _allTasks = await _localstorage.getAllTask();
    setState(() {});
  }

  Future<void> _showSearchPage() async {
    // scaffold un kendi showSearch widget ı var. delegate için CustomSearchDelegate sınıfı oluşturuldu widgets'ların içinde.
    await showSearch(
        context: context, delegate: CustomSearchDelegate(allTasks: _allTasks));
    _getAllTaskDB();
  }
}
