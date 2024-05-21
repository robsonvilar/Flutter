void main() {

  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Mariana', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.8},
  ];

  var total = alunos.map((aluno) => aluno['nota']);

  var conversor = total.map((nota) => (nota as double).roundToDouble());

  var somaTotal = conversor.reduce(funcaoSomar);



  print(total);
  print(conversor);
  print(somaTotal);
  print(somaTotal / alunos.length);
}

double funcaoSomar(var a, var b) {
  return a + b;
}