import 'package:flutter/material.dart';
import 'package:flutter_demo_state/all_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/todo_model.dart';

class TodoListItemWidget extends ConsumerWidget {
  TodoModel item;
  TodoListItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: item.completed,
        onChanged: (value) {
          ref.read(todoListProvider.notifier).toggle(item.id);
        },
      ),
      title: Text(item.description),
    );
  }
}
