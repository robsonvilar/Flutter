import 'package:flutter/material.dart';
import './funcao_eval.dart';
import './classe_botao.dart';

void main() {
  runApp(const Calculadora());
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String variavel_calcula_resultado = '0';

  String variavel_calculo_auxiliar = '0';

  ClasseEval ce1 = ClasseEval();

  List<String> termos_permitidos = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    '/',
    '*',
    '+',
    '-',
    '(',
    ')',
    '.'
  ];

  void funcao_calcula_resultado01(String entrada) {
    print(entrada);

    if (variavel_calcula_resultado == '0' && entrada != '.') {
      variavel_calcula_resultado = '';
    }

    if (termos_permitidos.contains(entrada) == true) {
      variavel_calcula_resultado += entrada;

      variavel_calculo_auxiliar = variavel_calcula_resultado;

      variavel_calculo_auxiliar = ce1.eval(variavel_calculo_auxiliar);

      if (variavel_calculo_auxiliar[variavel_calculo_auxiliar.length - 1] ==
              '0' &&
          variavel_calculo_auxiliar[variavel_calculo_auxiliar.length - 2] ==
              '.') {
        variavel_calculo_auxiliar = variavel_calculo_auxiliar.substring(
            0, variavel_calculo_auxiliar.length - 1);
        variavel_calculo_auxiliar = variavel_calculo_auxiliar.substring(
            0, variavel_calculo_auxiliar.length - 1);
      }

      setState(() {
        variavel_calcula_resultado;
        variavel_calculo_auxiliar;
      });
    } else if (entrada == '=') {
      variavel_calcula_resultado = ce1.eval(variavel_calcula_resultado);

      variavel_calculo_auxiliar = '0';

      if (variavel_calcula_resultado[variavel_calcula_resultado.length - 1] ==
              '0' &&
          variavel_calcula_resultado[variavel_calcula_resultado.length - 2] ==
              '.') {
        variavel_calcula_resultado = variavel_calcula_resultado.substring(
            0, variavel_calcula_resultado.length - 1);
        variavel_calcula_resultado = variavel_calcula_resultado.substring(
            0, variavel_calcula_resultado.length - 1);
      }

      if (variavel_calcula_resultado == '?') {
        variavel_calcula_resultado = '0';
      }

      setState(() {
        variavel_calcula_resultado;
        variavel_calculo_auxiliar;
      });
    } else if ((entrada == '<x') &&
        (variavel_calcula_resultado.isEmpty == false)) {
      setState(() {
        variavel_calcula_resultado = variavel_calcula_resultado.substring(
            0, variavel_calcula_resultado.length - 1);
      });
    } else if (entrada == 'AC') {
      setState(() {
        variavel_calcula_resultado = '0';
        variavel_calculo_auxiliar = '0';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                variavel_calcula_resultado,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                variavel_calculo_auxiliar,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButtonCustomizado(
                    text: 'AC',
                    onPressed: () => funcao_calcula_resultado01('AC'),
                    backgroundColor: Colors.grey.shade400,
                    foregroundColor: Colors.black),
                ElevatedButtonCustomizado(
                    text: '(',
                    onPressed: () => funcao_calcula_resultado01('('),
                    backgroundColor: Colors.grey.shade400,
                    foregroundColor: Colors.black),
                ElevatedButtonCustomizado(
                    text: ')',
                    onPressed: () => funcao_calcula_resultado01(')'),
                    backgroundColor: Colors.grey.shade400,
                    foregroundColor: Colors.black),
                ElevatedButtonCustomizado(
                    text: '<x',
                    onPressed: () => funcao_calcula_resultado01('<x'),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButtonCustomizado(
                    text: '7',
                    onPressed: () => funcao_calcula_resultado01('7'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '8',
                    onPressed: () => funcao_calcula_resultado01('8'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '9',
                    onPressed: () => funcao_calcula_resultado01('9'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '/',
                    onPressed: () => funcao_calcula_resultado01('/'),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButtonCustomizado(
                    text: '4',
                    onPressed: () => funcao_calcula_resultado01('4'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '5',
                    onPressed: () => funcao_calcula_resultado01('5'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '6',
                    onPressed: () => funcao_calcula_resultado01('6'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '*',
                    onPressed: () => funcao_calcula_resultado01('*'),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButtonCustomizado(
                    text: '1',
                    onPressed: () => funcao_calcula_resultado01('1'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '2',
                    onPressed: () => funcao_calcula_resultado01('2'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '3',
                    onPressed: () => funcao_calcula_resultado01('3'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '+',
                    onPressed: () => funcao_calcula_resultado01('+'),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButtonCustomizado(
                    text: '0',
                    onPressed: () => funcao_calcula_resultado01('1'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '.',
                    onPressed: () => funcao_calcula_resultado01('1'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '=',
                    onPressed: () => funcao_calcula_resultado01('1'),
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white),
                ElevatedButtonCustomizado(
                    text: '-',
                    onPressed: () => funcao_calcula_resultado01('1'),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
