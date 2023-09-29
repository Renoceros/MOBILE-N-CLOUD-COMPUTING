import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triangle Area Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController baseController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double area = 0.0;

  void calculateArea() {
    double base = double.tryParse(baseController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;
    double result = (base * height) / 2;
    setState(() {
      area = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Triangle Area Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter Triangle Base:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextField(
              controller: baseController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Text(
              'Enter Triangle Height:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: calculateArea,
              child: Text('Calculate Area'),
            ),
            SizedBox(height: 20),
            Text(
              'Triangle Area: $area',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    baseController.dispose();
    heightController.dispose();
    super.dispose();
  }
}
