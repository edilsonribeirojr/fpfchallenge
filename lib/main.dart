import 'package:flutter/material.dart';
import 'package:fpf_project/screens/add_number_screen.dart';
import 'package:fpf_project/screens/cat_fact_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/add_task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  TaskListScreenState createState() => TaskListScreenState();
}

class TaskListScreenState extends State<TaskListScreen> {
  List<Map<String, String>> tasks = []; // Alterado para Map<String, String>

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Carregar as tarefas do SharedPreferences
  }

  // Carrega as tarefas do SharedPreferences
  _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getStringList('tasks') ?? [];
    setState(() {
      tasks = taskList.map((task) {
        final taskData = task.split(',');
        return {
          'name': taskData[0],  // Certificando-se que é String
          'description': taskData.length > 1 ? taskData[1] : '',  // Descrição como String
          'status': taskData.length > 2 ? taskData[2] : 'Pendente',  // Status como String
        };
      }).toList();
    });
  }

  // Salva as tarefas no SharedPreferences
  _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = tasks.map((task) {
      return '${task['name']},${task['description']},${task['status']}'; // Garantir que os dados são strings
    }).toList();
    prefs.setStringList('tasks', taskList);
  }

  // Alterna o status de uma tarefa
  void _toggleTaskStatus(int index) {
    setState(() {
      tasks[index]['status'] = (tasks[index]['status'] == 'Pendente') ? 'Concluída' : 'Pendente';
      _saveTasks(); // Salva as alterações no SharedPreferences
    });
  }

  // Adiciona uma nova tarefa
  void _addTask(String name, String? description) {
    setState(() {
      tasks.add({
        'name': name,
        'description': description ?? '', // Garantir que descrição seja uma String
        'status': 'Pendente'
      });
      _saveTasks(); // Salva a lista de tarefas no SharedPreferences
    });
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
            subtitle: Text('Status: ${tasks[index]['status']}'),
            leading: Checkbox(
              value: tasks[index]['status'] == 'Concluída',
              checkColor: Colors.green,
              onChanged: (bool? value) {
                _toggleTaskStatus(index);  // Alterna o status da tarefa
              },
            ),
            onTap: () {
              _toggleTaskStatus(index);  // Alterna o status da tarefa ao tocar na tarefa
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskScreen(onSave: _addTask)),
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              // Navegar para a página dos números
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNumberScreen()),
              );
            },
            child: Icon(Icons.functions),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              // Navegar para a página dos gatos
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CatFactScreen()),
              );
            },
            child: Icon(Icons.pets),
          ),
        ],
      ),
    );
  }
}
