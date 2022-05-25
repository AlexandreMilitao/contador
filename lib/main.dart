import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  //stless - Usado para criara o Widget rapidamente
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      //Criando paginas
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image:AssetImage('assets/images/imagem.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            // alinhamento do eixo principal da coluna
            children: [
              Text(
                isFull ? 'Lotado' : 'Pode Entrar!',
                style: TextStyle(
                  fontSize: 30,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight:FontWeight.w700, // deixa a texto fino ou mais grosso
                ),
              ),
              Padding( // espaçamento entre o texto e os botões
                padding: EdgeInsets.all(40),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 100, //tamanho texto
                    color: isFull ? Colors.red : Colors.white, // cor do texto
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement, //funcao do botão
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty ? Colors.white.withOpacity(0.5) : Colors.white,
                      fixedSize: const Size(100, 100),
                      //Espaçamento em volta do texto
                      primary: Colors.black,
                      //Altera a cor que aparece o botão quando clicamos nele
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ), //estrutura do botão
                    ),
                    child: const Text(
                      'Saiu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ), // Texto do botão
                  ),
                  const SizedBox(width: 32), //Afasta os botões
                  TextButton(
                    onPressed: isFull ? null : increment, //funcao do botão
                    style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.white.withOpacity(0.5) : Colors.white,
                      fixedSize: const Size(100, 100),
                      //Espaçamento em volta do texto
                      primary: Colors.black,
                      //Altera a cor que aparece o botão quando clicamos nele
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ), //estrutura do botão
                    ),
                    child: const Text(
                      'Entrou',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ), // Texto do botão
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
