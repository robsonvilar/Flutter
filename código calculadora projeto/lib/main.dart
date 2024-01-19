import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

double funcao_eval(String entrada) {
  Parser p = Parser();
  Expression exp = p.parse(entrada);

  ContextModel cm = ContextModel();
  double resultado = exp.evaluate(EvaluationType.REAL, cm);

  return resultado;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String variavel_exibe_calculo = '';
  String variavel_exibe_resultado_do_calculo = '0';

  List<String> lista_termos_operacionais = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '+',
    '-',
    '/',
    'x',
    '(',
    ')'
  ];

  void funcao_atualiza_displays() {
    setState(() {
      variavel_exibe_calculo;
      variavel_exibe_resultado_do_calculo;
    });
  }

  void funcao_calcula_operacao_matematica() {
    funcao_atualiza_displays();
    variavel_exibe_calculo = variavel_exibe_calculo.replaceAll('x', '*');
    try {
      variavel_exibe_resultado_do_calculo =
          funcao_eval(variavel_exibe_calculo).toString();
    } catch (erro) {
      print(erro);
    }
    variavel_exibe_calculo = variavel_exibe_calculo.replaceAll('*', 'x');
    funcao_atualiza_displays();
  }

  void funcao_recebe_entradas_das_teclas(String entrada_tecla) {
    if (lista_termos_operacionais.contains(entrada_tecla) == true) {
      variavel_exibe_calculo += entrada_tecla;
    }
    if (entrada_tecla == '<x') {
      variavel_exibe_calculo = variavel_exibe_calculo.substring(
          0, variavel_exibe_calculo.length - 1);
    }
    if (entrada_tecla == 'AC') {
      variavel_exibe_calculo = '';
      variavel_exibe_resultado_do_calculo = '0';
    }
    if (entrada_tecla == '=') {
      funcao_calcula_operacao_matematica();
      variavel_exibe_calculo = variavel_exibe_resultado_do_calculo;
      variavel_exibe_resultado_do_calculo = '';
      funcao_atualiza_displays();
    }
    if (entrada_tecla != '=') {
      funcao_calcula_operacao_matematica();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(variavel_exibe_calculo,
                    style: const TextStyle(fontSize: 50, color: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(variavel_exibe_resultado_do_calculo,
                    style: const TextStyle(fontSize: 40, color: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 164, 167, 164)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 164, 167, 164))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('AC');
                  },
                  child: const Text('AC', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 164, 167, 164)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 164, 167, 164))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('(');
                  },
                  child: const Text('(', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 164, 167, 164)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 164, 167, 164))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas(')');
                  },
                  child: const Text(')', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: Colors.orange)),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('<x');
                  },
                  child: const Text('<x', style: TextStyle(fontSize: 40)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('7');
                  },
                  child: const Text('7', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('8');
                  },
                  child: const Text('8', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('9');
                  },
                  child: const Text('9', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: Colors.orange)),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('/');
                  },
                  child: const Text('/', style: TextStyle(fontSize: 40)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('4');
                  },
                  child: const Text('4', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('5');
                  },
                  child: const Text('5', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('6');
                  },
                  child: const Text('6', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: Colors.orange)),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('x');
                  },
                  child: const Text('x', style: TextStyle(fontSize: 40)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('1');
                  },
                  child: const Text('1', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('2');
                  },
                  child: const Text('2', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('3');
                  },
                  child: const Text('3', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: Colors.orange)),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('-');
                  },
                  child: const Text('-', style: TextStyle(fontSize: 40)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('0');
                  },
                  child: const Text('0', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('.');
                  },
                  child: const Text('.', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 85, 87, 85)),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 85, 87, 85))),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('=');
                  },
                  child: const Text('=', style: TextStyle(fontSize: 40)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.orange),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: Colors.orange)),
                    ),
                  ),
                  onPressed: () {
                    funcao_recebe_entradas_das_teclas('+');
                  },
                  child: const Text('+', style: TextStyle(fontSize: 40)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
