import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calcular Salário",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange[50],
      ),
      home: const TelaSalario(),
    );
  }
}

class TelaSalario extends StatefulWidget {
  const TelaSalario({super.key});
  @override
  State<TelaSalario> createState() => _TelaSalarioPage();
}

class _TelaSalarioPage extends State<TelaSalario> {
  TextEditingController salarioController = TextEditingController();
  double desconto = 0;
  double salarioFinal = 0;

  void calcularSalario() {
    String texto = salarioController.text.replaceAll(",", ".");
    double salario = double.tryParse(texto) ?? 0;

    setState(() {
      if (salario <= 2000) {
        desconto = salario * 0.05;
      } else if (salario <= 4000) {
        desconto = salario * 0.1;
      } else {
        desconto = salario * 0.15;
      }
      salarioFinal = salario - desconto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calcular Salário")),
      body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: salarioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite o salário:",
                border: OutlineInputBorder(),
              )
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: calcularSalario, child: const Text("Calcular")),
            const SizedBox(height: 30),
            Text(
              "Desconto de R\$ ${desconto.toStringAsFixed(2).replaceAll(".",",")}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              "Salário final R\$ ${salarioFinal.toStringAsFixed(2).replaceAll(".",",")}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
          ],
          )
      )
    );
  }
}
