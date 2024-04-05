import 'package:flutter/material.dart';

void main () {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatelessWidget {
  
  var perguntaSelecionada = 1;

  void responder() {
    perguntaSelecionada+=1;
    print('Pergunta respondida! $perguntaSelecionada');
  }
  
  @override
  Widget build(BuildContext context) {

    final List<String> perguntas = [
      'Qual eh a sua cor favorita?',
      'Qual eh o seu animal favorito?',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Perguntas', style: TextStyle(color: Colors.white),),),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(perguntas[perguntaSelecionada]),
              ElevatedButton(onPressed: responder, child: const Text('Resposta 1'),),
              ElevatedButton(onPressed: responder, child: const Text('Resposta 2'),),
              ElevatedButton(onPressed: responder, child: const Text('Resposta 3'),),
            ],
          ),
        ),
      ),
    );
  }
}