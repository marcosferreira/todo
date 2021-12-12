import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/provider/todo_provider.dart';

class FormTodoScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  FormTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      final toDo = ModalRoute.of(context)!.settings.arguments as ToDo;

      _formData['id'] = toDo.id!;
      _formData['name'] = toDo.name!;
      _formData['description'] = toDo.descrption!;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
        centerTitle: true,
      ),
      body: _buildBody(context, _formData),
    );
  }

  Widget _buildBody(BuildContext context, Map<String, String> _formData) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 20,
            color: Colors.blue,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  width: 350,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: _buildForm(context, _formData),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Form _buildForm(BuildContext context, Map<String, String> _formData) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Adicionar nova tarefa',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 32),
          TextFormField(
            initialValue: _formData['name'],
            decoration: const InputDecoration(
              labelText: 'Título da tarefa',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Informe o título da tarefa';
              }
              return null;
            },
            onSaved: (value) => _formData['name'] = value!,
            // print(value);
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: _formData['description'],
            decoration: const InputDecoration(
              labelText: 'Descrição da tarefa',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Informe a descrição da tarefa';
              }
              return null;
            },
            onSaved: (value) => _formData['description'] = value!,
            // print(value);
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              final bool isValidate = _formKey.currentState!.validate();

              if (isValidate) {
                _formKey.currentState!.save();

                ModalRoute.of(context)!.settings.arguments == null
                    ? Provider.of<TodoProvider>(context, listen: false).post(
                        ToDo(
                          name: _formData['name'],
                          descrption: _formData['description'],
                        ),
                      )
                    : Provider.of<TodoProvider>(context, listen: false).put(
                        ToDo(
                          id: _formData['id'],
                          name: _formData['name'],
                          descrption: _formData['description'],
                        ),
                      );

                Navigator.pop(context);
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
