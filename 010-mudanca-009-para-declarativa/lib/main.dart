import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 1;

  void _responder() {
    setState(() {
      _perguntaSelecionada += 1;
    });

    print('Pergunta respondida! $_perguntaSelecionada');

    if (_perguntaSelecionada >= 3) {
      _perguntaSelecionada = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _perguntas = [
      {
        'texto': 'Qual é a sua cor favorita ?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito ?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual é o seu instrutor favorito ?',
        'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
      },
    ];

    List<String> respostas = _perguntas[_perguntaSelecionada].cast()['respostas'];
    List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Perguntas',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
              ...widgets,
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
