import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/local_storage.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/models/task_model.dart';
import 'package:flutter_todo_app/widgets/task_list_items.dart';

// SearchDelegate diye bi sınıf var.

class CustomSearchDelegate extends SearchDelegate {
  final List<Task> allTasks;

  CustomSearchDelegate({required this.allTasks});

  @override
  // buildActions arama kısmının sağ tarafında ki iconları.
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query.isEmpty ? null : query = '';
        },
        icon: const Icon(Icons.clear),
        color: Colors.black,
      )
    ];
  }

  @override
  // buildLeading en başta ki iconları.
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  // bir arama yapıp arama butonuna bastıgımızda çıkacak sonuçları nasıl listeleneceğini.
  Widget buildResults(BuildContext context) {
    // koşulumuzu yazıyoruz.
    var filteredList = allTasks
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filteredList.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              var _oankiEleman = filteredList[index];
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
                    // burda localstroage a erişemediğimiz için silme işlemi veritabanında gerçekleşmiyor.
                    Text('Bu Görev Silindi.'),
                  ],
                ),
                key: Key(_oankiEleman.id),
                onDismissed: (direction) async {
                  filteredList.removeAt(index);
                  await locator<LocalStorage>().deleteTask(task: _oankiEleman);
                  // setState(() {});
                },
                child: TaskItem(
                  task: _oankiEleman,
                ),
              );
            },
            itemCount: filteredList.length,
          )
        : const Center(
            child: Text('Aradığınızı bulamadık'),
          );
  }

  @override
  // yazdıkça görünmesini istediğimiz şeyler.
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
