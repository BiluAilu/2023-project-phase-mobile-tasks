import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TaskDetailPage extends StatefulWidget {
  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Color.fromARGB(255, 0, 140, 255),
          ),
         
          title: const Text(
            'Task Detail',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert) ,color: Colors.black,)],
        ),
        body: Container(
          width: screen.width - 40,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
           Container(
            child:  Image.asset('assets/images/business-task-list.png'),
            height: screen.height*0.32,
            alignment: Alignment.center,
           ),
            const Text(
              "Title",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              width: screen.width - 40,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(176, 200, 252, 1),
              ),
              child: const Text('UI/UX App Design'),
            ),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold

              ),
            ),
            Container(
              width: screen.width - 40,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(176, 200, 252, 1),
              ),
              child: const Text(
                  'First I have to animate the logo and prototyping my design. It\'s very important.'),
            ),
            const Text(
              "Dead Line",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold

              ),
            ),
            Container(
              width: screen.width - 40,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(176, 200, 252, 1),
              ),
              child: const Text('April. 29 ,2023'),
            ),
          ]),
        ));
  }
}
