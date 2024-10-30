class Data {
  int dia=0;
  int mes=0;
  int ano=0;

  // //Construtor com parametros opcionais
  // Data([int dia = 1, int mes = 1, int ano = 1970]) {
  //   this.dia = dia;
  //   this.mes = mes;
  //   this.ano = ano;
  // }

  //Construtor com parametros nomeados
  Data({int dia=1, int mes=1, int ano=1970}) {
    this.dia = dia; 
    this.mes = mes;
    this.ano = ano;
  }

  getData() {
    return '$dia/$mes/$ano';
  }
}

void main() {

  var dataAniversario = new Data(dia: 1, mes: 2, ano: 2022);

  print(dataAniversario.getData());
}