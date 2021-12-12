class ToDo {
  late String? id;
  late String? name;
  late String? descrption;
  late bool check = false;

  ToDo({
    this.id,
    this.name,
    this.descrption,
    this.check = false,
  });
}

List<ToDo> listTodo = [
  ToDo(id: '1', name: 'Tarefa 1', descrption: 'Realizar limpeza de components'),
  ToDo(id: '2', name: 'Tarefa 2', descrption: 'Manutenção na impressora'),
  ToDo(id: '3', name: 'Tarefa 2', descrption: 'Manutenção na impressora'),
  ToDo(id: '4', name: 'Tarefa 2', descrption: 'Manutenção na impressora'),
  ToDo(id: '5', name: 'Tarefa 2', descrption: 'Manutenção na impressora'),
  ToDo(id: '6', name: 'Tarefa 2', descrption: 'Manutenção na impressora'),
];
