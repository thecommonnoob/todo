import 'package:flutter/material.dart';
import 'package:todo/widgets/todo_item.dart';

import '../models/todo_item_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<TodoItemModel> todos = [];
  late var todoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "TODO",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: todoTextController,
                        decoration: const InputDecoration(
                            hintText: "TODO", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        todos
                            .add(TodoItemModel(todoTextController.text, false));
                        todoTextController.text = "";
                      });
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                for (var i = 0; i < todos.length; i++)
                  TodoItem(
                    todoContent: todos[i].todoContent,
                    isDone: todos[i].isDone,
                    onClickDone: () {
                      setState(() {
                        todos[i].isDone = !todos[i].isDone;
                        todos.removeAt(i);
                      });
                    },
                  )
              ],
            ))
          ],
        ),
      )),
    );
  }
}
