
import 'dart:math';
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
      title: 'Triangle Area',
      home: const TriangleAreaPage(),
    );
  }
}

class TriangleAreaPage extends StatefulWidget {
  const TriangleAreaPage({super.key});

  @override
  State<TriangleAreaPage> createState() => _TriangleAreaPageState();
}

class _TriangleAreaPageState extends State<TriangleAreaPage> {
  final aController = TextEditingController();
  final bController = TextEditingController();
  final cController = TextEditingController();

  String result = "";

  void calculateArea() {
    final a = double.tryParse(aController.text);
    final b = double.tryParse(bController.text);
    final c = double.tryParse(cController.text);

    if (a == null || b == null || c == null) {
      setState(() => result = "Enter valid values.");
      return;
    }

    if (a + b <= c || a + c <= b || b + c <= a) {
      setState(() => result = "Invalid triangle.");
      return;
    }

    final s = (a + b + c) / 2;
    final area = sqrt(s * (s - a) * (s - b) * (s - c));

    setState(() {
      result = "Area = ${area.toStringAsFixed(3)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Triangle Area")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: aController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Side A"),
            ),
            TextField(
              controller: bController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Side B"),
            ),
            TextField(
              controller: cController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Side C"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateArea,
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 20),
            Text(result, style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
