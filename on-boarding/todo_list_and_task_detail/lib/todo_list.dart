import 'package:todo_list_and_task_detail/todo_list.dart';
import 'package:todo_list_and_task_detail/todo_detail.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert) ,color: Colors.black,)],

          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Color.fromARGB(255, 0, 140, 255),
          ),
          title: const Text(
            'Todo List',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/task-list.png',
                    height: screen.height * 0.25,
                  )
                ],
              ),
              const Text(
                "Tasks List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SingleChildScrollView(child: Column(children: [
                MyCard("June, 29, 2023", "Do assignments",context,true),
                // MyCard("April, 29, 2023", "UI/UX App Design",context,Colors.green),
                MyCard("August, 02, 2023", "Meet friends",context,false),
                MyCard("September, 29, 2023", "Take an exam",context,true),
              ]),),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 TextButton(
                style: ButtonStyle(
                  
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 140, 255))),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTodoPage()));
                },
                child:Container(
                  margin: const EdgeInsets.only(left: 30,right: 30,),
                  child:  const Text(
                  "Create Task",
                  style: TextStyle(color: Colors.white),
                ),)
                )
                
          
              ],)
               ],
          ),
        ));
  }
}

// ignore: non_constant_identifier_names
Widget MyCard(String d, String title,BuildContext context,bool checked) {
  return Container(
    margin: const EdgeInsets.only(top: 15,right: 10,left: 10),
    decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(

        Radius.circular(25)
    ),
    // ignore: prefer_const_literals_to_create_immutables
    boxShadow:[BoxShadow(
        color: Color.fromARGB(255, 192, 189, 189),
        offset: Offset(1,0.2),
        blurRadius: 5
    )]
),
    
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskDetailPage()));
        },
        child:        Container(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
                child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(title[0]),
            ))),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
       Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
        children: [
          
           Text(d),
           SizedBox(width: 3,),
          //  Container(
          //   width: 5,
          //   height: 40,
          //   color:color,
            
          //  )
          checked?Icon(Icons.check_box,color: Color.fromARGB(255, 0, 140, 255),):
          Icon(Icons.check_box_outline_blank,color: Color.fromARGB(255, 0, 140, 255),)
        ],
       )
      ],
    ),
  ),)
     
  
  );
}
