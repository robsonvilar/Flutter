void main() {

  var adicao = (int a, int b) {
    return a + b;
  };

  print(adicao(4,19));

  var subtracao = (int a, int b) => a - b; //arrow function

  var divisao = (int a, int b) => a / b; //arrow function

  var multiplicacao = (int a, int b) => a * b; //arrow function

  print(subtracao(9,13));
  print(divisao(9,13));
  print(multiplicacao(9,13));
}