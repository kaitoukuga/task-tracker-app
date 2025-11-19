import 'package:flutter/material.dart';
import '../models/task.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends  State<HomeScreen> {
  void _editTask(Task task, int index) async {
    final updatedTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(
          existingTask: task,
        ),
      ),
    );

    if (updatedTask != null) {
      setState(() {
        tasks[index] = updatedTask;
      });
    }
  }
  // Dummy Task
  List<Task> tasks = [
    Task(title: "Belajar Flutter", description: "Pelajari dasar widget"),
    Task(title: "Buat UI Task Tracker", description: "Tampilkan list tugas"),
    Task(title: "Commit ke GitHub", description: "Push project awal"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Tracker'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: Icon(
                task.isDone ? Icons.check_circle : Icons.circle_outlined,
                color: task.isDone ? Colors.green : Colors.grey,
              ),
              onTap: () {
                setState(() {
                  task.isDone = !task.isDone;
                });
              },
              onLongPress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.edit),
                            title: const Text("Edit Task"),
                            onTap:() {
                              Navigator.pop(context);
                              _editTask(task, index);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.delete),
                            title: const Text("Delete Task"),
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                tasks.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder:  (context) => const AddTaskScreen()),
          );

          if (result != null) {
            setState(() {
              tasks.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}