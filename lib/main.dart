
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrianglePage(),
    );
  }
}

class TrianglePage extends StatefulWidget {
  const TrianglePage({super.key});

  @override
  State<TrianglePage> createState() => _TrianglePageState();
}

class _TrianglePageState extends State<TrianglePage> {
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();
  String result = "";

  void calc() {
    final aa = double.tryParse(a.text);
    final bb = double.tryParse(b.text);
    final cc = double.tryParse(c.text);

    if (aa == null || bb == null || cc == null) {
      setState(() => result = "قيم غير صحيحة");
      return;
    }

    if (aa + bb <= cc || aa + cc <= bb || bb + cc <= aa) {
      setState(() => result = "المثلث غير صالح");
      return;
    }

    final s = (aa + bb + cc) / 2;
    final area = sqrt(s * (s - aa) * (s - bb) * (s - cc));

    setState(() => result = "المساحة = ${area.toStringAsFixed(3)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("حاسبة مساحة المثلث")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: a, decoration: const InputDecoration(labelText: "الضلع الأول")),
            TextField(controller: b, decoration: const InputDecoration(labelText: "الضلع الثاني")),
            TextField(controller: c, decoration: const InputDecoration(labelText: "الضلع الثالث")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: calc, child: const Text("احسب")),
            const SizedBox(height: 20),
            Text(result, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
