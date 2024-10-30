void main() {

  var numeros = [-5,-4,-3,-2,-1,0,1,2,3,4,5];

  bool Function(int) valores1 = (int nota) => nota > 0;

  var valores = numeros.where(valores1);

  print(valores);
}

