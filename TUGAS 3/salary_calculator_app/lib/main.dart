import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salary Calculator',
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
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  double totalSalary = 0.0;

  void calculateSalary() {
    double salary = double.tryParse(salaryController.text) ?? 0.0;
    String status = statusController.text;

    double bonus = 0.10 * salary; // 10% of salary
    double allowance = (status == 'M') ? 0.08 * salary : 0.05 * salary;

    double result = salary + bonus + allowance;
    setState(() {
      totalSalary = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Calculator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter Employee Details:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                controller: idController,
                decoration: InputDecoration(labelText: 'Id Pegawai'),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: salaryController,
                decoration: InputDecoration(labelText: 'Gaji'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: statusController,
                decoration: InputDecoration(
                    labelText: 'Status (M for Menikah, other for others)'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: calculateSalary,
                child: Text('Calculate Salary'),
              ),
              SizedBox(height: 20),
              Text(
                'Total Salary: $totalSalary',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    salaryController.dispose();
    statusController.dispose();
    super.dispose();
  }
}
