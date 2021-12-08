class ToDo {
  late String name;
  late String descrption;
  late bool check = false;

  ToDo({required this.name, required this.descrption, this.check = false});
}

List<ToDo> listTodo = [
  ToDo(name: 'Tarefa 1', descrption: 'Realizar limpeza de components'),
  ToDo(name: 'Tarefa 2', descrption: 'Manutenção na impressora'),
  ToDo(name: 'Tarefa 2', descrption: 'Manutenção na impressora'),
  ToDo(name: 'Tarefa 2', descrption: 'Manutenção na impressora'),
  ToDo(name: 'Tarefa 2', descrption: 'Manutenção na impressora'),
  ToDo(name: 'Tarefa 2', descrption: 'Manutenção na impressora'),
];
