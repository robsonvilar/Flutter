import 'package:flutter/material.dart';
import './botao.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int posicaoAtual = 0;
  int variavelPontuacao = 0;

  List lista1 = [
    {
      'texto': 'Escolha um animal:',
      'lista': [
        {'item': 'gato', 'pontuacao': 1},
        {'item': 'cachorro', 'pontuacao': 2},
        {'item': 'elefante', 'pontuacao': 3},
        {'item': 'girafa', 'pontuacao': 4},
      ]
    },
    {
      'texto': 'Escolha um veículo:',
      'lista': [
        {'item': 'bicicleta', 'pontuacao': 1},
        {'item': 'moto', 'pontuacao': 2},
        {'item': 'carro', 'pontuacao': 3},
        {'item': 'avião', 'pontuacao': 4},
      ]
    },
    {
      'texto': 'Escolha uma fruta:',
      'lista': [
        {'item': 'banana', 'pontuacao': 1},
        {'item': 'goiaba', 'pontuacao': 2},
        {'item': 'pêra', 'pontuacao': 3},
        {'item': 'maçã', 'pontuacao': 4},
      ]
    },
  ];

  bool get temPerguntaSelecionada {
    return posicaoAtual < lista1.length;
  }

  void botaoClicado(int pontuacao) {
    setState(() {
      posicaoAtual += 1;
      variavelPontuacao += pontuacao;
    });
  }

  void funcaoReiniciar() {
    setState(() {
      posicaoAtual = 0;
      variavelPontuacao = 0;
    });
  }

  String funcaoResultadoFinal(int pontuacao) {
    if (pontuacao <= 3) {
      return 'Bom = $pontuacao';
    }
    else if (pontuacao <= 6) {
      return 'Muito bom = $pontuacao';
    } else if (pontuacao <= 12) {
      return 'Excelente = $pontuacao';
    } 
    return 'Horrível = $pontuacao';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Perguntas',
              style: TextStyle(fontSize: 30),
            ),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Text(
                    lista1[posicaoAtual]['texto'],
                    style: const TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: ListView(
                      children:
                          lista1[posicaoAtual]['lista'].map<Widget>((item) {
                        return Center(
                          child: Botao(
                            item['item'].toString(),
                            () => botaoClicado(item['pontuacao']),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      funcaoResultadoFinal(variavelPontuacao),
                      style: const TextStyle(fontSize: 50),
                    ),
                    ElevatedButton(
                      onPressed: funcaoReiniciar,
                      child: const Text('Reiniciar'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
