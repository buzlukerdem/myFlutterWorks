import 'package:flutter/material.dart';
import 'package:flutter_demo_state/all_provider.dart';
import 'package:flutter_demo_state/widgets/title_widget.dart';
import 'package:flutter_demo_state/widgets/toolbar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'model/todo_model.dart';
import 'widgets/todo_list_item_widget.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({Key? key}) : super(key: key);

  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(todoListProvider);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          const TitleWidget(),
          TextField(
            controller: newTodoController,
            decoration:
                const InputDecoration(labelText: 'Neler Yapacaksın Bugün ?'),
            onSubmitted: (newTodo) {
              ref.read(todoListProvider.notifier).addTodo(newTodo);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const ToolBarWidget(),
          for (var i = 0; i < allTodos.length; i++)
            Dismissible(
                key: ValueKey(allTodos[i].id),
                onDismissed: (_) {
                  ref.read(todoListProvider.notifier).remove(allTodos[i]);
                },
                child: TodoListItemWidget(item: allTodos[i]))
        ],
      ),
    );
  }
}
