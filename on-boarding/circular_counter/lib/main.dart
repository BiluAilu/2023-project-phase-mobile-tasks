import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  

  



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
        if (_counter==10){
          _counter=-1;
        }
      _counter++;
    });
  }
    void _decrementCounter() {
    setState(() {
        if (_counter==0){
          _counter=11;
        }
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
  final mediaQueryData = MediaQuery.of(context);
   
    return Scaffold(
      appBar: AppBar(
     
        title: const Text("Circular counter"),
      ),
      body: Center(
  
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(

                  onPressed: _decrementCounter,
                  child: const Text('Decrement'),
                ),
                SizedBox(width: mediaQueryData.size.width*0.1,),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Increment'),
                ),
              ],
            )
          ],
        ),
      ),
        );
  }
}
