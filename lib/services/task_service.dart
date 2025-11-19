import 'package:hive/hive.dart';
import '../models/task.dart';

class TaskService {
  final Box<Task> taskBox = Hive.box<Task>('tasks');

  List<Task> getTasks() => taskBox.values.toList();

  void addTask(Task task) {
    taskBox.add(task);
  }

  void updateTask(int index, Task updatedTask) {
    taskBox.putAt(index, updatedTask);
  }

  void deleteTask(int index) {
    taskBox.deleteAt(index);
  }
}