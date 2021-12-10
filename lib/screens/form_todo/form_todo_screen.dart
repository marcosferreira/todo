import 'package:flutter/material.dart';

class FormTodoScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FormTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
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
                  child: _buildForm(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Form _buildForm(BuildContext context) {
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
            decoration: const InputDecoration(
              labelText: 'Título da tarefa',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o título da tarefa';
              }
            },
            onSaved: (value) {
              print(value);
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Descrição da tarefa',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe a descrição da tarefa';
              }
            },
            onSaved: (value) {
              print(value);
            },
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              final bool isValidate = _formKey.currentState!.validate();
              if (isValidate) {
                _formKey.currentState!.save();
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
