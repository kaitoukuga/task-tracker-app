import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/task.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends  State<HomeScreen> {
  late Box<Task> taskBox;

  @override
  void initState() {
    super.initState();
    taskBox = Hive.box<Task>('tasks');
  }
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
      taskBox.putAt(index, updatedTask);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final tasks = taskBox.values.toList();

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
                task.isDone = !task.isDone;
                taskBox.putAt(index, task);
                setState(() {});
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
                              taskBox.deleteAt(index);
                              setState(() {});
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
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder:  (_) => const AddTaskScreen()),
          );

          if (newTask != null) {
            taskBox.add(newTask);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}