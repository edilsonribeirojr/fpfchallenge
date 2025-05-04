import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/add_task_screen.dart';
import 'screens/cat_fact_screen.dart'; // Adicionando o novo arquivo

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
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Map<String, String>> tasks = [];
  final List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getStringList('tasks') ?? [];
    setState(() {
      tasks = taskList.map((task) {
        final taskData = task.split(',');
        return {
          'name': taskData[0],
          'status': taskData[1],
        };
      }).toList();
    });
  }

  void _addTask(String name, String? description) {
    setState(() {
      _tasks.add({
        'name': name,
        'description': description,
        'isCompleted': false,
      });
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
            onTap: () {
              setState(() {
                tasks[index]['status'] = (tasks[index]['status'] == 'Pendente') ? 'Concluída' : 'Pendente';
                final prefs = SharedPreferences.getInstance();
                final taskList = tasks.map((task) => '${task['name']},${task['status']}').toList();
                prefs.then((prefs) => prefs.setStringList('tasks', taskList));
              });
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
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
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
