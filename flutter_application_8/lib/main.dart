import 'package:flutter/material.dart';

void main() {
  runApp(const RockInRio());
}

class RockInRio extends StatelessWidget {
  const RockInRio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rock in Rio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> favoritos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rock in Rio")),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: listaAtracoes.length,
        itemBuilder: (context, index) {
          final atracao = listaAtracoes[index];
          final isFavorito = favoritos.contains(atracao.nome);

          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            clipBehavior: Clip.antiAlias, //Torna os cantos do item mais suaves
            elevation: 6,
            child: InkWell(
              //Torna o item clicável
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AtracaoHomePage(atracao: atracao),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, //Alinha linhas e colunas (equivalente ao justify-content e align-content do CSS)
                children: [
                  Hero(
                    tag: atracao.nome,
                    child: Image.asset(
                      atracao.imagemUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            atracao.nome,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorito ? Icons.favorite : Icons.favorite_border,
                            color: isFavorito ? Colors.red : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (isFavorito) {
                                favoritos.remove(atracao.nome);
                              } else {
                                favoritos.add(atracao.nome);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AtracaoHomePage extends StatelessWidget {
  final Atracao atracao;

  const AtracaoHomePage({super.key, required this.atracao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: atracao.nome,
              child: Image.asset(
                atracao.imagemUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    atracao.nome,
                    style: TextStyle(
                      fontSize: 26, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Dia ${atracao.dia}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: atracao.tags
                    .map(
                      (tag)=>Chip(label: Text('#$tag'),
                        backgroundColor: Colors.red.shade500,
                      ),
                    )
                    .toList(),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text("voltar")
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Atracao {
  final String nome;
  final int dia;
  final List<String> tags;
  final String imagemUrl;

  const Atracao(this.nome, this.dia, this.tags, this.imagemUrl);
}

const listaAtracoes = [
  Atracao (
    "Iron Maiden",
    2,
    ["Espetáculo", "Fãs", "Novo Álbum"],
    "assets/imagem/iron.jpg",
  ),
  Atracao (
    "Justin Bieber",
    4,
    ["TopCharts", "hits", "POP"],
    "assets/imagem/justin.jpg",
  ),
  Atracao (
    "Green Day",
    9,
    ["Sucesso", "Reconhecimento", "Show"],
    "assets/imagem/green_day.jpg",
  ),
  Atracao (
    "Ivete Sangalo",
    10,
    ["Carreira", "Energia", "Brasil"],
    "assets/imagem/ivete.jpg",
  ),
];