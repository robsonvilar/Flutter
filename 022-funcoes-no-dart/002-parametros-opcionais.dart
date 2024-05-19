void main() {

print(funcaoEntrada());

print(funcaoEntrada(2));

imprimirData();

imprimirData(12,6,2025);
}

int funcaoEntrada([int entrada=10]) {
  return entrada;
}

imprimirData([int dia=13, int mes=5, int ano=2024]) {
  print("$dia/$mes/$ano");
}