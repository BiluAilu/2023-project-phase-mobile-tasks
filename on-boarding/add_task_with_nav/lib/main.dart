import 'package:flutter/material.dart';
import 'create_todo.dart';
import 'todo_list.dart';
import 'todo_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/':(context)=>MyHomePage(),
        '/home': (context) => TodoList(),
        '/create': (context) => CreateTodoPage(),
        '/view': (context) => TaskDetailPage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            margin: EdgeInsets.all(0),
            width: screen.width,
            height: screen.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/to-do-list.png'),
              ),
              color: (Color.fromARGB(255, 0, 140, 255)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 255, 255))),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(color: Color.fromARGB(255, 1, 0, 0)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                SizedBox(
                  height: 15,
                )
              ],
            )));
  }
}
