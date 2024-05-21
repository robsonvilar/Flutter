void main() {

  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Mariana', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.8},
  ];

  String Function(Map) pegarApenasONome = (aluno) => aluno['nome'];
  int Function(String) qtdDeLetras = (texto) => texto.length;
  int Function(int) letrasVezes2 = (entrada) => entrada * 2;

  var recebeAlunos = alunos.map(pegarApenasONome);
  var recebeQuantidadeLetras = recebeAlunos.map(qtdDeLetras);
  var qtdLetrasVezes2 = recebeQuantidadeLetras.map(letrasVezes2);

  print(recebeAlunos);
  print(recebeQuantidadeLetras);
  print(qtdLetrasVezes2);
}