import 'package:flutter/material.dart';
void main() {
  runApp(TodoApp());
}
class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListScreen(),
    );
  }
}
class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}
class _TodoListScreenState extends State<TodoListScreen> {
  List<Task> tasks = [
    Task(title: 'Estudar p provas pq tamo abublé dazideia'),
    Task(title: 'Aguentar até o final d novembro sem gastar dinheiro em certo(s) joguinho(s) asiático(s)'),
    Task(title: 'Fazer a primeira parte do trabalho da Renata'),
    Task(title: 'Akl bglh q dá 2 pontos (1 ponto p 2 matérias diferentes) em outubro'),
    Task(title: 'Diminuir o resumo da prova de mat pq aparentemente 5 folhas de resumo é exagero'),
    Task(title: 'Terminar o semestre sem trancar o curso e ir p design ano q vem'),
    Task(title: 'Perguntar p cara q fica olhando p mim qndo eu saio d casa se tem sujeira na minha cara, e o outro cara do ponto de ônibus tbm'),
    Task(title: 'Felipe, eu acho q vc tá deixando isso aq pessoal demais'),
    Task(title: 'Acha'),
    Task(title: 'Acho'),
    Task(title: 'Massa, todas as opiniões são válidas, contanto q ngm saia machucado :thumbsup:'),
    Task(title: 'Eu tava com meus mano...'),
    Task(title: 'Slkeisquerecebaláeleborabillamostradinho'),
    Task(title: 'Yass queen, slay! Slaayy!! SLAAAAAAAAAAAY YOUR ENEMIES!!!'),
  ];
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }
  void editTask(int index) {
    TextEditingController _controller = TextEditingController(text: tasks[index].title);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Editar tarefa"),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: "Nome da tarefa"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Salvar"),
              onPressed: () {
                setState(() {
                  tasks[index].title = _controller.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            leading: Checkbox(
              value: tasks[index].isDone,
              onChanged: (bool? value) {
                setState(() {
                  tasks[index].isDone = value!;
                });
              },
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => editTask(index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteTask(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
class Task {
  String title;
  bool isDone;
  Task({required this.title, this.isDone = false});
}