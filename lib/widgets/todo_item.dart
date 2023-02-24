import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String todoContent;
  final bool isDone;
  final VoidCallback onClickDone;
  const TodoItem(
      {super.key,
      required this.todoContent,
      required this.isDone,
      required this.onClickDone});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(
            child: Text(
              widget.todoContent,
              softWrap: true,
            ),
          ),
          IconButton(
              onPressed: () {
                widget.onClickDone();
              },
              icon: Icon(widget.isDone
                  ? Icons.check_box
                  : Icons.check_box_outline_blank))
        ]),
      ),
    );
  }
}
