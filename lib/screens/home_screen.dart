import 'package:flutter/material.dart';
import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends  State<HomeScreen> {
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
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}