import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //Diz para não aparecer o elemento de "banner de debug" na tela.
      debugShowCheckedModeBanner: false,
      home: CalculadoraPage(),
    );
  }
}

//A widget da calculadora é Stateful porque o usuário irá inserir e mudar os números dela.
class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  //O método State retorna o estado atual da classe CalculadoraPage.
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

//O underline no nome da classe abaixo diz que ela é uma classe privada.
class _CalculadoraPageState extends State<CalculadoraPage> {
  double numero1 = 0;
  double numero2 = 0;
  double resultado = 0;

  //Uma variável final é parecida com uma variável constante, com a diferença de que seu valor será definido fora do código (nesse caso, pelo input do usuário). 
  //TextEditingController é uma função que pega o valor inserido em uma caixa de texto e o insere em uma variável com o mesmo nome da caixa de texto (é semelhante ao getElementById).
  final TextEditingController campo1 = TextEditingController();
  final TextEditingController campo2 = TextEditingController();

  void somar() {
    setState(() {
      numero1 = double.parse(campo1.text);
      numero2 = double.parse(campo2.text);
      resultado = numero1 + numero2;
    });
  }

  void subtrair() {
    setState(() {
      numero1 = double.parse(campo1.text);
      numero2 = double.parse(campo2.text);
      resultado = numero1 - numero2;
    });
  }

  void multiplicar() {
    setState(() {
      numero1 = double.parse(campo1.text);
      numero2 = double.parse(campo2.text);
      resultado = numero1 * numero2;
    });
  }

  void dividir() {
    setState(() {
      numero1 = double.parse(campo1.text);
      numero2 = double.parse(campo2.text);
      resultado = numero1 / numero2;
    });
  }

  //Abaixo, criamos a interface do usuário. Age como um HTML + CSS, enquanto o código acima age como o javascript.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar é igual à navbar de um site
      appBar: AppBar(
        title: const Text("Calculadora Flutter"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        //O elemento filho do body é uma coluna. Cada um de seus elementos filhos (children), será uma linha dessa coluna.
        child: Column(
          children: [
            TextField(
              //controller é equivalente ao "ID" do HTML. keyboardType é equivalente ao "type".
              controller: campo1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o primeiro número",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              //controller é equivalente ao ID do HTML. keyboardType é equivalente ao type.
              controller: campo2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o segundo número",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            //Abaixo é criada uma nova linha que contêm os botões da calculadora.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // onPressed é semelhante ao onClick do HTML.
                ElevatedButton(onPressed: somar, child: const Text("+")),
                ElevatedButton(onPressed: subtrair, child: const Text("-")),
                ElevatedButton(onPressed: multiplicar, child: const Text("X")),
                ElevatedButton(onPressed: dividir, child: const Text("/"))
              ],
            ),
            const SizedBox(height: 20),

            Text(
              "Resultado: $resultado",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )
            )
          ]
        )
      ),
    );
  }
}
