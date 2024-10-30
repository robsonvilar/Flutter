import 'dart:math';

void main() {

  var minhaFnPar = () => print('Eita! O Valor e par!');
  var minhaFnImpar = () => print('Legal! O Valor e impar!');

  executar(minhaFnPar, minhaFnImpar);
}

void executar(Function fnPar, Function fnImpar) {

  if (Random().nextInt(10) % 2 == 0) {
    fnPar();
  }
  else {
    fnImpar();
  }

}