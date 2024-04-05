import 'package:flutter/material.dart';
import './questao.dart';

void main () {
  runApp(PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {

  var _perguntaSelecionada = 1;

  void _responder() {
    setState(() {
      _perguntaSelecionada+=1;
    });
  
    print('Pergunta respondida! $_perguntaSelecionada');

    if (_perguntaSelecionada >= 6) {
      _perguntaSelecionada = 0;
    }
  }

  @override
  Widget build(BuildContext context) {

    final List<String> _perguntas = [
      'Qual eh a sua cor favorita?',
      'Qual eh o seu animal favorito?',
      'De que animal voce gosta?',
      'Voce gosta de futebol?',
      'Voce gosta de praia',
      'Voce gosta de video game?',
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
              Questao(_perguntas[_perguntaSelecionada]),
              ElevatedButton(onPressed: _responder, child: const Text('Resposta 1'),),
              ElevatedButton(onPressed: _responder, child: const Text('Resposta 2'),),
              ElevatedButton(onPressed: _responder, child: const Text('Resposta 3'),),
            ],
          ),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  
  PerguntaAppState createState() {
    return PerguntaAppState();
  }

}

