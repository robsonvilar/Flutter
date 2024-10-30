import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;

  final void Function() quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionda {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    List<String> respostas = temPerguntaSelecionda
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
        
    List<Widget> widgets =
        respostas.map((t) => Resposta(t, quandoResponder)).toList();

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...widgets,
      ],
    );
  }
}
