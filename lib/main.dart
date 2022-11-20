import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controler = TextEditingController();
  String grading = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: controler,
              decoration: InputDecoration(
                  hintText: "Type your score", prefixIcon: Icon(Icons.percent)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: ElevatedButton(
                  child: Text("Calculate"),
                  onPressed: () {
                    setState(() {
                      int? grade = int.tryParse(controler.text);

                      if (grade == null) {
                        print("${controler.text} is not a number");
                      }

                      if (grade! >= 90) {
                        print("A");
                        grading = "A";
                      } else if (grade >= 80) {
                        print("B");
                        grading = "B";
                      } else if (grade >= 70) {
                        print("C");
                        grading = "C";
                      } else if (grade >= 60) {
                        print("D");
                        grading = "D";
                      } else {
                        grading = "F";
                      }
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Text(
                grading,
                style: TextStyle(fontSize: 150),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
