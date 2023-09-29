import 'package:flutter/material.dart';
import 'util.dart';
import 'todo_list.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class CreateTodoPage extends StatefulWidget {
  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _discController = TextEditingController();
  BoxDecoration cardDecoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      // ignore: prefer_const_literals_to_create_immutables
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 225, 223, 223),
            offset: Offset(1, 0.2),
            blurRadius: 5)
      ]);
  TextStyle style = TextStyle(
      fontWeight: FontWeight.bold, 
      color: Color.fromARGB(255, 0, 140, 255),
      );

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        final formattedDate =
            DateFormat.yMMMd().format(picked); // Format the date
        _dateController.text = formattedDate;
      });
    }
  }

  void showSnackbar(BuildContext context) {
    final snackbar = SnackBar(
      content: Text('Input cannot be empty'),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

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
            'Create new Task',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Main task name',
                  style: style,
                ),
              ),
              Container(
                decoration: cardDecoration,
                width: screen.width - 20,
                margin: const EdgeInsets.only(
                    bottom: 20, left: 10, right: 10, top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Expanded(
                    child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'task name',
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Due Date',
                  style: style,
                ),
              ),
              Container(
                width: screen.width - 20,
                margin: const EdgeInsets.only(
                    bottom: 20, left: 10, right: 10, top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: cardDecoration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text("April 29, 2023 12:30 AM",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                    Expanded(
                        child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Date',
                      ),
                      controller: _dateController,
                      onChanged: (value) => {},
                    )),

                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: const Icon(
                         Icons.calendar_month,
                      size: 20,
                      color: Color.fromARGB(255, 0, 140, 255),
                    ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Description',
                  style: style,
                ),
              ),
              Container(
                decoration: cardDecoration,
                width: screen.width - 20,
                margin: const EdgeInsets.only(
                    bottom: 20, left: 10, right: 10, top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Expanded(
                    child: TextField(
                      maxLines: 4,
                      
                  controller: _discController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Description',
                  ),
                )),
              ),
              SizedBox(
                height: screen.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      //Rounded shaped button
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(5),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 0, 140, 255)
                              
                              )
                              
                              ),
                      onPressed: () {
                        if (_dateController.text == "" ||
                            _dateController.text == null ||
                            _titleController.text == "" ||
                            _titleController.text == null ||
                            _discController.text == "" ||
                            _discController.text == null) {
                          showSnackbar(context);
                        } else {
                          setState(() {
                            Task t = Task(
                                _dateController.text,
                                _titleController.text,
                                 getRandomColor(),
                                description:  _discController.text);
                            tasks.add(t);
                          });
                         
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      child: GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: const Text(
                            "Add Task",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        // onTap: () {

                        //   Navigator.pop(context);
                        // },
                      ))
                ],
              )
            ],
          ),
        ));
  }

  Container content(Size screen, BoxDecoration cardDecoration, String s) {
    return Container(
      width: screen.width - 20,
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: cardDecoration,
      child: Text(
        s,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}
