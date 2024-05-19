void main() {

  print(funcaoEntrada(nome: 'carlos', idade: 20));

  print(funcaoEntrada());
}

String funcaoEntrada({String nome='robson', int idade=10}) {
  return 'nome=$nome e idade=$idade';
}