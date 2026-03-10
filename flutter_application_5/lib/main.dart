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
      home: ContagemPage(),
    );
  }
}

class ContagemPage extends StatefulWidget {
  const ContagemPage({super.key});
  @override
  State<ContagemPage> createState() => _ContagemPageState();
}

class _ContagemPageState extends State<ContagemPage> {
  int numero = 0;
  int i = 1;
  String cont = "";

  final TextEditingController campo1 = TextEditingController();

  void contagem() {
    setState(() {
      numero = int.parse(campo1.text);
      while (i <= numero) {
        cont = "$cont\n $i";
        i += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contagem Flutter"),
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
                labelText: "Digite o número",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: contagem,
                  child: const Text("Gerar contagem"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              "Tabuada: $cont",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
