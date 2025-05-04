import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/add_task_screen.dart';  // Certifique-se de que esse caminho está correto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  TaskListScreenState createState() => TaskListScreenState(); // Nome da classe foi alterado
}

class TaskListScreenState extends State<TaskListScreen> {  // Classe pública agora
  List<Map<String, String?>> tasks = []; // A descrição pode ser nula

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getStringList('tasks') ?? [];
    setState(() {
      tasks = taskList.map((task) {
        final parts = task.split(',');
        return {
          'name': parts[0],
          'status': parts.length > 1 ? parts[1] : 'Pendente',
          'description': parts.length > 2 ? parts[2] : '',
        };
      }).toList();
    });
  }

  Future<void> _addTask(String name, String? description) async {
    final newTask = {
      'name': name,
      'status': 'Pendente',
      'description': description ?? '',
    };
    setState(() {
      tasks.add(newTask);
    });
    final prefs = await SharedPreferences.getInstance();
    final updatedList = tasks.map((t) => '${t['name']},${t['status']},${t['description']}').toList();
    prefs.setStringList('tasks', updatedList);
  }

  void _toggleStatus(int index) async {
    setState(() {
      tasks[index]['status'] =
          tasks[index]['status'] == 'Pendente' ? 'Concluída' : 'Pendente';
    });
    final prefs = await SharedPreferences.getInstance();
    final updatedList = tasks.map((t) => '${t['name']},${t['status']},${t['description']}').toList();
    prefs.setStringList('tasks', updatedList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tarefas')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]['name']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Status: ${tasks[index]['status']}'),
                if (tasks[index]['description'] != null && tasks[index]['description']!.isNotEmpty)
                  Text('Descrição: ${tasks[index]['description']}'),
              ],
            ),
            trailing: Checkbox(
              value: tasks[index]['status'] == 'Concluída',
              onChanged: (val) => _toggleStatus(index),
              activeColor: Colors.green,
            ),
            onTap: () {
              setState(() {
                tasks[index]['status'] =
                    tasks[index]['status'] == 'Pendente' ? 'Concluída' : 'Pendente';
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(onSave: _addTask),
            ),
          );
          _loadTasks(); // Recarrega a lista após voltar
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
