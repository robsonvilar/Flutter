import 'package:math_expressions/math_expressions.dart';

class ClasseEval {
  String eval(String entrada) {
    try {
      // Criando um analisador de expressões matemáticas
      Parser p = Parser();
      Expression exp = p.parse(entrada);

      // Criando um avaliador de expressões matemáticas
      ContextModel cm = ContextModel();
      double resultado = exp.evaluate(EvaluationType.REAL, cm);

      return resultado.toString();
    } 
    catch (erro) {
      return '?';
    }

  }
}