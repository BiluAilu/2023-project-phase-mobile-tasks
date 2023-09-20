import 'package:add_task/todo_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                image: AssetImage(
                    'assets/images/stick-man-painting-on-canvas.png'), // Replace with your image asset path
                fit: BoxFit.cover, // You can adjust the image fit as needed
              ),
          color: Color.fromRGBO(238, 111, 87, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(

                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent)),
                  child:  Container(
                    margin: const EdgeInsets.only(left: 20,right: 20),
                    child:  const Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white),
                  ),),
                 
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TodoList()));
                  },
                )
              ],
            )));
  }
}
