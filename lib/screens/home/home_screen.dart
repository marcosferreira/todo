import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDo> listItens = listTodo;
  bool listCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tarefas'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 20,
            color: Colors.blue,
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: listItens.length,
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
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: ListTile(
                  title: Text(
                    listItens[index].name,
                    style: TextStyle(
                      decoration: listItens[index].check
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(
                    listItens[index].descrption,
                    style: TextStyle(
                      decoration: listItens[index].check
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        listItens[index].check = !listItens[index].check;
                      });
                    },
                    icon: listItens[index].check
                        ? const Icon(Icons.check_box)
                        : const Icon(Icons.check_box_outline_blank),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
