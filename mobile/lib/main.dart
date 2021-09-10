import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Profile Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Container(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Color(0xFF4169e1)
                    )
                ),
              )
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF4169e1),
                      width: 5,
                    ),
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: ExactAssetImage('assets/images/profile1.jpg'),
                    )
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(100, 0, 0, 100),
                    child: ElevatedButton(
                      onPressed: () {
                        print('Clicked!');
                      },
                      child: Icon(Icons.create_sharp, color: Color(0xFF4169e1)),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                        primary: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 75,
                    child: OutlinedButton(
                      child: const Text("Button text"),
                      onPressed: () {
                        print('Clicked Here 1');
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 75,
                    child: OutlinedButton(
                      child: const Text("Button text"),
                      onPressed: () {
                        print('Clicked Here 1');
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 75,
                    child: OutlinedButton(
                      child: const Text("Button text"),
                      onPressed: () {
                        print('Clicked Here 1');
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 75,
                    child: OutlinedButton(
                      child: const Text("Button text"),
                      onPressed: () {
                        print('Clicked Here 1');
                      },
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
