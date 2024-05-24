class Produto {
  int codigo;
  String nome;
  double preco;
  double desconto;

  Produto({this.codigo=0, this.nome='null', this.preco=0, this.desconto=0});

  double get precoComDesconto {
    return (1 - desconto) * preco;
  }
}