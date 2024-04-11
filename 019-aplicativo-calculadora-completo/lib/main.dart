import 'package:flutter/material.dart';
import './funcao_eval.dart';

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
    } else if ((entrada == '<x') && (variavel_calcula_resultado.isEmpty == false)) {
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
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                variavel_calculo_auxiliar,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('AC'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    'AC',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('('),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '(',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01(')'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    ')',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('<x'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '<x',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('7'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '7',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('8'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '8',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('9'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '9',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('/'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '/',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('4'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('5'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '5',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('6'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '6',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('*'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '*',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('1'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('2'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('3'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('+'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('0'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('.'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '.',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('='),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '=',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => funcao_calcula_resultado01('-'),
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll<CircleBorder>(
                        CircleBorder()),
                    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.width * 0.2),
                    ),
                  ),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
