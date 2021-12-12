import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool listCheck = false;

  @override
  Widget build(BuildContext context) {
    TodoProvider toDoItems = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tarefas'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteApp.formTodo);
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: _buildBody(toDoItems),
    );
  }

  Stack _buildBody(TodoProvider toDoItems) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 20,
          color: Colors.blue,
        ),
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: toDoItems.count,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 350,
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: ListTile(
                onTap: () {
                  setState(() {
                    toDoItems.byIndex(index).check =
                        !toDoItems.byIndex(index).check;
                  });
                },
                leading: toDoItems.byIndex(index).check
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.check_box_outline_blank),
                title: Text(
                  toDoItems.byIndex(index).name!,
                  style: TextStyle(
                    decoration: toDoItems.byIndex(index).check
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                subtitle: Text(
                  '${toDoItems.byIndex(index).descrption} ${toDoItems.byIndex(index).id}',
                  style: TextStyle(
                    decoration: toDoItems.byIndex(index).check
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RouteApp.formTodo,
                            arguments: toDoItems.byIndex(index),
                          );
                        },
                        icon: const Icon(Icons.edit_outlined),
                        // icon: toDoItems.byIndex(index).check
                        //     ? const Icon(Icons.check_box)
                        //     : const Icon(Icons.check_box_outline_blank),
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () {
                          toDoItems.distroy(toDoItems.byIndex(index));
                        },
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
