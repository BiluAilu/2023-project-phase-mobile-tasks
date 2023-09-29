import 'package:add_task_with_nav/util.dart';
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
 
    final Task? task = ModalRoute.of(context)?.settings.arguments as Task?;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blueAccent,
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
            Image.asset('assets/images/shopping-list.png'),
            const Text(
              "Title",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Container(
              width: screen.width - 40,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(241, 238, 238, 1),
              ),
              child:  Text(task!=null? task.title:"T"),
            ),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Container(
              width: screen.width - 40,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(241, 238, 238, 1),
              ),
              child:  Text(task!=null? task.description:"des"
                 ),
            ),
            const Text(
              "Dead Line",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Container(
              width: screen.width - 40,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(241, 238, 238, 1),
              ),
              child:  Text(task!=null?task.date:"date"),
            ),
          ]),
        ));
  }
}
