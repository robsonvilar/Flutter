/*
Criei uma função que substitui o eval().

Adicione a dependência ao arquivo pubspec.yaml:

dependencies:
   math_expressions: ^2.0.1
Depois utilize o código:
*/

import 'package:math_expressions/math_expressions.dart';

double funcao_eval(String entrada) {

   // Criando um analisador de expressões matemáticas
   Parser p = Parser();
   Expression exp = p.parse(entrada);

   // Criando um avaliador de expressões matemáticas
   ContextModel cm = ContextModel();
   double resultado = exp.evaluate(EvaluationType.REAL, cm);

   return resultado;
}

void main() {

   String expressao = "2 + 3 * 4";
   double resultado = funcao_eval(expressao);

   print("Resultado da expressão '$expressao': $resultado");
}