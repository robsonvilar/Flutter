import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

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
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
      'De qual animal você gosta?',
      'Você gosta de futebol?',
      'Você gosta de praia',
      'Você gosta de video game?',
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
              Resposta('Resposta 1',_responder),
              Resposta('Resposta 2',_responder),
              Resposta('Resposta 3',_responder),
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

