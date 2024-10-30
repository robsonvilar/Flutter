void main() {

  int variavelPrincipal = 0;

  void Function() funcao1 = () {
    variavelPrincipal = 1;
  };

  void Function() funcao2 = () {
    variavelPrincipal = 2;
  };
  
  funcao_teste(funcao1, funcao2, 1);
  print(variavelPrincipal);
  funcao_teste(funcao1, funcao2, 2);
  print(variavelPrincipal);
  funcao_teste(funcao1, funcao2, 3);
  print(variavelPrincipal);
}

void funcao_teste(Function f1, Function f2, int entrada) {

  if (entrada == 1) {
    f1();
  }
  else if (entrada == 2) {
    f2();
  }
  else {
    print('Não selecionado');
  }
}