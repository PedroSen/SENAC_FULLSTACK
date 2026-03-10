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
      home: MediaAlunoPage(),
    );
  }
}

//A widget da calculadora é Stateful porque o usuário irá inserir e mudar os números dela.
class MediaAlunoPage extends StatefulWidget {
  const MediaAlunoPage({super.key});

  @override
  //O método State retorna o estado atual da classe CalculadoraPage.
  State<MediaAlunoPage> createState() => _MediaAlunoPageState();
}

//O underline no nome da classe abaixo diz que ela é uma classe privada.
class _MediaAlunoPageState extends State<MediaAlunoPage> {
  double nota1 = 0;
  double nota2 = 0;
  double nota3 = 0;
  double nota4 = 0;
  double media = 0;

  //Uma variável final é parecida com uma variável constante, com a diferença de que seu valor será definido fora do código (nesse caso, pelo input do usuário). 
  //TextEditingController é uma função que pega o valor inserido em uma caixa de texto e o insere em uma variável com o mesmo nome da caixa de texto (é semelhante ao getElementById).
  final TextEditingController campo1 = TextEditingController();
  final TextEditingController campo2 = TextEditingController();
  final TextEditingController campo3 = TextEditingController();
  final TextEditingController campo4 = TextEditingController();

  void calculoMedia() {
    setState(() {
      nota1 = double.parse(campo1.text);
      nota2 = double.parse(campo2.text);
      nota3 = double.parse(campo3.text);
      nota4 = double.parse(campo4.text);
      media = (nota1 + nota2 + nota3 + nota4)/4;
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

            TextField(
              //controller é equivalente ao ID do HTML. keyboardType é equivalente ao type.
              controller: campo3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o terceiro número",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              //controller é equivalente ao ID do HTML. keyboardType é equivalente ao type.
              controller: campo4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o quarto número",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            //Abaixo é criada uma nova linha que contêm os botões da calculadora.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // onPressed é semelhante ao onClick do HTML.
                ElevatedButton(onPressed: calculoMedia, child: const Text("Calcular Média")),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              "Média: $media",
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
