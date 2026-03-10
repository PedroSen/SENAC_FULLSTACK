//Importa os comandos do flutter e a biblioteca material.dart, que serve como o CSS/bootstrap
import 'package:flutter/material.dart';

//Método main(), primeiro método que roda quando o progrma é executado, a partir
//do qual são executados todos os outros métodos.
void main() {
  //runApp serve para rodar todos os métodos dentro de um classe.
  runApp(const MainApp());
}

// MainApp é o método principal do código. Herda os métodos da classe StatelessWidget,
//que tem métodos para criação de Widgets não dinâmicos. Faz parte de material.dart
class MainApp extends StatelessWidget {
  //É o construtor da classe
  const MainApp({super.key});

  //@override sobrescreve o método build() da classe StatelessWidget pelo método build() abaixo
  @override
  //A linha abaixo cria o Widget principal da página
  Widget build(BuildContext context) {
    //Classe cujos atributos são os elementos da página
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
