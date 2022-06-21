import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/local_storage.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:intl/intl.dart';
import '../models/task_model.dart';

class TaskItem extends StatefulWidget {
  Task task;
  TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final TextEditingController _taskNameController = TextEditingController();
  late LocalStorage _localstorage;

  @override
  void initState() {
    super.initState();
    _localstorage = locator<LocalStorage>();
  }

  @override
  Widget build(BuildContext context) {
    // bunu taşıdık initstate den update işlemi çalışması için
    _taskNameController.text = widget.task.name;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 30,
          ),
        ],
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            widget.task.isCompleted = !widget.task.isCompleted;
            _localstorage.updateTask(task: widget.task);

            setState(() {});
          },
          child: Container(
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              color: widget.task.isCompleted ? Colors.green : Colors.white,
              border: Border.all(color: Colors.black, width: 1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        title: widget.task.isCompleted
            ? Text(
                widget.task.name,
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey),
              )
            : TextField(
                minLines: 1,
                maxLines: null,
                // klavye de ki check butonu
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(border: InputBorder.none),
                controller: _taskNameController,
                onSubmitted: (newValue) {
                  widget.task.name = newValue;
                  _localstorage.updateTask(task: widget.task);
                },
              ),
        // tarih formatlama intl paketi kullanıldı.
        trailing: Text(
          DateFormat('hh:mm a').format(widget.task.createdAt),
          style: TextStyle(fontSize: 14, color: Colors.green),
        ),
      ),
    );
  }
}
