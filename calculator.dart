import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String number1 = "";
  String number2 = "";
  String operation = "";
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Number 1"),

              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Number 1",
                ),
                onChanged: (value) {
                  number1 = value;
                },
              ),

              const SizedBox(height: 15),

              const Text("Number 2"),

              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Number 2",
                ),
                onChanged: (value) {
                  number2 = value;
                },
              ),

              const SizedBox(height: 20),

              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = "+";
                      });
                    },
                    child: const Text("+"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = "-";
                      });
                    },
                    child: const Text("-"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = "*";
                      });
                    },
                    child: const Text("*"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = "/";
                      });
                    },
                    child: const Text("/"),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  double a = double.parse(number1);
                  double b = double.parse(number2);

                  setState(() {
                    if (operation == "+") {
                      result = (a + b).toString();
                    } else if (operation == "-") {
                      result = (a - b).toString();
                    } else if (operation == "*") {
                      result = (a * b).toString();
                    } else if (operation == "/") {
                      if (b != 0) {
                        result = (a / b).toString();
                      } else {
                        result = "Cannot divide by zero";
                      }
                    } else {
                      result = "Select an operation";
                    }
                  });
                },
                child: const Text("="),
              ),

              const SizedBox(height: 15),

              Text(
                "Result: $result",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
