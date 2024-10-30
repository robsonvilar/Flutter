void main() {
  var notas = [
    7.3,
    5.4,
    7.7,
    8.1,
    5.5,
    4.9,
    9.1,
    10,
  ];

  var total = notas.reduce(somar);

  print(total);
}

num somar(num a, num b) {
  print('$a + $b');
  return a + b;
}