import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

//Dessa vez a página é stateful, pois mudará de cor, havendo, portanto, elementos e variáveis que mudam de estado
class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  //As variáveis abaixo armazenam a escolha de cor do usuário e mudarão de valor quando o usuário trocar a cor.
  bool darkMode = false;
  int indiceCor = 0;
  Color corFundo = Colors.blue.shade100;

  void mudaCor() {
    setState(() {
      indiceCor++;
      //O switch case abaixo checa qual o valor atual do indiceCor (1, 2, 3 ou 0) para definir qual cor de fundo será usada.
      //Isso também poderia ser feito usando if else ao invés de switch case.
      switch (indiceCor) {
        case 1:
          corFundo = Colors.green.shade100;
          break;
        case 2:
          corFundo = Colors.orange.shade100;
          break;
        case 3:
          corFundo = Colors.purple.shade100;
          break;
        default:
          indiceCor = 0;
          corFundo = Colors.blue.shade100;
      }
    });
  }

  void alternarDark() {
    //setState é usado sempre que mudamos o valor de uma variável.
    //Só pode ser usado em Widgets Stateful, onde variáveis podem mudar de estado.
    setState(() {
      darkMode = !darkMode; //muda o valor de darkMode de "false" para "true"
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calcular IMC",
      debugShowCheckedModeBanner: false,

      //Aqui criamos diferentes temas possíveis com diferentes cores para a página.
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: corFundo,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,

      //A classe da página principal recebe dois parâmetros que informam qual tema e cores serão aplicados.
      //Esses parâmetros são usados por um método da classe TelaIMC.
      home: TelaIMC(mudarCor: mudaCor, alternarDark: alternarDark),
    );
  }
}

class TelaIMC extends StatefulWidget {
  //Pesquisar sobre o que o trecho abaixo faz
  final Function mudarCor;
  final Function alternarDark;
  const TelaIMC({
    super.key,
    required this.mudarCor,
    required this.alternarDark,
  });
  @override
  State<TelaIMC> createState() => _TelaIMCState();
}

class _TelaIMCState extends State<TelaIMC> {
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final alturaController = TextEditingController();
  final pesoController = TextEditingController();

  //Todas as variáveis devem ser declaradas com algum valor inicial
  String resultado = "";
  double imc = 0;

  Color corResultado = Colors.black;
  IconData iconeSaude = Icons.favorite;

  void calcularIMC() {
    if (nomeController.text.isEmpty ||
        idadeController.text.isEmpty ||
        alturaController.text.isEmpty ||
        pesoController.text.isEmpty) {
      setState(() {
        resultado = "Preencha todos os campos!";
      });
      return;
    }
    double altura = double.parse(alturaController.text.replaceAll(",", "."));
    double peso = double.parse(alturaController.text.replaceAll(",", "."));

    imc = peso/(altura*altura);

    String classificacao = "";
    int idade = int.parse(idadeController.text);

    if (imc < 18.5) {
      classificacao = "Abaixo do peso";
      corResultado = Colors.blue;
      iconeSaude = Icons.sentiment_dissatisfied;
    } else if (imc < 25) {
      classificacao = "Sobrepeso";
      corResultado = Colors.orange;
      iconeSaude = Icons.warning;
    } else if (imc < 35) {
      classificacao = "Obesidade Grau I";
      corResultado = Colors.redAccent;
      iconeSaude = Icons.health_and_safety;
    } else if (imc < 40) {
      classificacao = "Obesidade Grau II";
      corResultado = Colors.red;
      iconeSaude = Icons.error;
    } else {
      classificacao = "Obesidade Grau III";
      corResultado = Colors.purple;
      iconeSaude = Icons.dangerous;
    }

    setState(() {
      resultado =
          "${nomeController.text},$idade anos\n"
          "Seu IMC é: ${imc.toStringAsFixed(5).replaceAll(".", ",")}.\n"
          "Classificação: $classificacao";
    });
  }

  void limparCampos() {
    setState(() {
      nomeController.clear();
      idadeController.clear();
      alturaController.clear();
      pesoController.clear();
      resultado = "";
      imc = 0;
    });
  }

  //ABAIXO, A INTERFACE. ACIMA, A LÓGICA.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
      ),

      //Abaixo é selecionada uma imagem de fundo do site. Para isso, o body deve ser do tipo Container.
      //Além disso, deve ser criada uma pasta assets e uma pasta imagem dentro dela, e no arquivo
      //pubspec.yaml, deve ser adicionado, abaixo de "assets:" a linha "- assets/imagem/"
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("imagem/png-clipart-smiley-desktop-happiness-face-smiley-miscellaneous-face.png"),
          fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: idadeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Idade",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.cake),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Altura (ex: 1,75)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.height),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Peso (ex: 70,5)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monitor_weight),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  ElevatedButton.icon(
                    onPressed: calcularIMC,
                    icon: const Icon(Icons.calculate),
                    label: const Text("Calcular"),
                  ),

                  ElevatedButton.icon(
                    onPressed: limparCampos,
                    icon: const Icon(Icons.cleaning_services),
                    label: const Text("Limpar"),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  ElevatedButton.icon(
                    onPressed: () => widget.mudarCor(),
                    icon: const Icon(Icons.palette),
                    label: const Text("Cor"),
                  ),

                  ElevatedButton.icon(
                    onPressed: () => widget.alternarDark(),
                    icon: const Icon(Icons.dark_mode),
                    label: const Text("Dark"),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Card(
                elevation: 8,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(25),

                  child: Column(
                    children: [
                      Icon(iconeSaude, size: 70, color: corResultado),

                      const SizedBox(height: 10),

                      Text(
                        resultado,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: corResultado,
                        ),
                      ),

                      const SizedBox(height: 20),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: imc == 0 ? 0 : imc / 40,
                          minHeight: 20,
                          backgroundColor: Colors.grey[300],
                          color: corResultado,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
