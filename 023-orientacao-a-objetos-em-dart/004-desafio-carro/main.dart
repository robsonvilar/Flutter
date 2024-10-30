import '001-carro.dart';

void main() {

  Carro c1 = new Carro(max_vel: 200, atual_vel: 40);

  for(int i=0; i<=10; i++) {
      c1.acelerar();
  }

  print(c1.getVelocidadeAtual);
  print(c1.getVelocidadeMaxima);
}