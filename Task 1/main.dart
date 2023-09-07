import 'dart:io';

class Task {
  // Task Class: Create a class representing a task with the following properties:
// Title
// Description
// Due date
// Status (completed, pending)

  late String title;
  late String description;
  late DateTime dueDate;
  late String status;
  Task(String title, String description, DateTime dueDate, String status) {
    this.title = title;
    this.description = description;
    this.dueDate = dueDate;
    this.status = status;
  }

  void displayTaskDetails() {
    print('Title: $title');
    print('Description: $description');
    print('Due date: $dueDate');
    print('Status: $status');
  }
}

class TaskManager {
  List<Task> task = [];

  void addTask(Task t) {
    task.add(t);
  }

  void viewAllTasks() {
    print("-------------All tasks----------------");
    for (Task t in task) {
      t.displayTaskDetails();
    }
    print("---------------------------------------");
  }

  void viewCompletedTasks() {
    print("---->Completed Tasks------------------");
    for (Task t in task) {
      if (t.status == "Completed") {
        t.displayTaskDetails();
      }
    }
    print("---------------------------------------");
  }

  void viewPendingTasks() {
    print("---->Pending Tasks----------------------");
    for (Task t in task) {
      if (t.status == "Pending") {
        t.displayTaskDetails();
      }
    }
    print("---------------------------------------");
  }

  void editTask(int index,
      {String? title, String? description, DateTime? dueDate, String? status}) {
    if (index >= 0 && index < task.length) {
      if (title != null) task[index].title = title;
      if (description != null) task[index].description = description;
      if (dueDate != null) task[index].dueDate = dueDate;
      if (status != null) task[index].status = status;
    } else {
      print("index out of range");
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < task.length) {
      task.removeAt(index);
    } else {
      print("index out of range");
    }
  }
}

void main(List<String> args) {
  List<Task> tasks = [];
  TaskManager taskManager = TaskManager();
  int x = 1;
  print('------------------------------------------------------------');
  print('---------------------Welcome to Task manager app------------');
  print('------------------------------------------------------------');
  while (true) {
    print('*****Options');
    print("1. Add task");
    print("2. View task");
    print("3. Edit task");
    print("4. Deleted task");
    print("0. Exit");
    print('------------------------------------------------------------');
    print('------------------------------------------------------------');
    stdout.write('---->');
    x = int.parse(stdin.readLineSync()!);
    if (x == 1) {
      stdout.write('Enter title: ');
      String title = stdin.readLineSync()!;
      stdout.write('Enter description');
      String description = stdin.readLineSync()!;
      DateTime dueDate;
      while (true) {
        stdout.write("Enter date in format yyyy-mm-dd");
        String date = stdin.readLineSync()!;
        try {
          dueDate = DateTime.parse(date);
          break;
        } catch (e) {
          print("Invalid Date format, please try again");
        }
      }

      stdout.write('Enter status  (Completed/Pending)');
      String status = stdin.readLineSync()!;
      Task t = Task(title, description, dueDate, status);
      taskManager.addTask(t);
      print("Task has been added successfully ");
    } else if (x == 2) {
      print("***********Sub-Option");
      print("a. Display all tasks");
      print("b. Display completed tasks");
      print("c. Display pending tasks");
      stdout.write("-->");
      String op = stdin.readLineSync()!;
      if (op == "a") {
        taskManager.viewAllTasks();
      } else if (op == "b") {
        taskManager.viewCompletedTasks();
      } else if (op == "c") {
        taskManager.viewPendingTasks();
      } else {
        print("Error input");
      }
    } else if (x == 3) {
      print("Enter index of task you want to edit");
      int index = int.parse(stdin.readLineSync()!);
      print('Enter title');
      String title = stdin.readLineSync()!;
      print('Enter description');
      String description = stdin.readLineSync()!;
      print('Enter due date');
      DateTime dueDate = DateTime.parse(stdin.readLineSync()!);
      print('Enter status');
      String status = stdin.readLineSync()!;
      taskManager.editTask(index,
          title: title,
          description: description,
          dueDate: dueDate,
          status: status);

      print("Task has been edited successfully ");
    } else if (x == 4) {
      print("Enter index of task you want to delete");
      int index = int.parse(stdin.readLineSync()!);
      taskManager.deleteTask(index);
      print("Task deleted successfully");
    } else {
      break;
    }
  }
}
