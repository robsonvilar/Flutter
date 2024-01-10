import 'package:math_expressions/math_expressions.dart';

/*
Para fazer esse código funcionar, adicione o código ao arquivo pubspec.yaml

dev_dependencies:
  math_expressions: ^2.0.1

*/

double funcao_eval(String entrada) {
  Parser p = Parser();
  Expression exp = p.parse(entrada);

  ContextModel cm = ContextModel();
  double resultado = exp.evaluate(EvaluationType.REAL, cm);

  return resultado;
}

void main() {
  String expressao = "(2 + 3) * 4 + 1";
  double resultado = funcao_eval(expressao);

  print("Resultado da expressão '$expressao': $resultado");
}
