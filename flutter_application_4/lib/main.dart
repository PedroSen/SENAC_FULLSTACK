import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabuadaPage(),
    );
  }
}

class TabuadaPage extends StatefulWidget {
  const TabuadaPage({super.key});

  @override
  State<TabuadaPage> createState() => _TabuadaPageState();
}

class _TabuadaPageState extends State<TabuadaPage> {
  int numero = 0;
  int produto = 0;
  String tab = "";
  
  final TextEditingController campo1 = TextEditingController();

  void tabuada() {
    setState(() {

      numero = int.parse(campo1.text);
      for (int i = 1; i <= 10; i++) {
        produto = numero * i;
        tab = "$tab\n$numero X $i = $produto";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabuada Flutter"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: campo1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o primeiro número",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: tabuada,
                  child: const Text("Gerar tabuada"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              "Tabuada: $tab",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
