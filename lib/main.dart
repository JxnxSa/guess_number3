import 'package:flutter/material.dart';
import 'package:guess_number3/pages/game_page.dart';

// yop level function
void main() {
  runApp(const MyApp());
} // คือการ new MyApp ขึ้นมา

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //var gp = GamePage();

    return MaterialApp(
      //MaterialApp คือชื่อคลาส
      title: 'Flutter Demo', // ชื่อ app  // title:  คือ พารามิเตอร์
      theme: ThemeData(
          //theme: คือ พารามิเตอร์
          primarySwatch: Colors.green),
      //home: gp, // home:  คือ พารามิเตอร์
      home: GamePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
