import './produto.dart';

class VendaItem {
  Produto produto = Produto();
  int quantidade=0;
  double _preco=0;

  VendaItem({Produto? produto, int quantidade = 0})
      : produto = produto ?? Produto(),
        quantidade = quantidade;

  get getProduto => this.produto;
  set setProduto( produto) => this.produto = produto;

  get getQuantidade => this.quantidade;
  set setQuantidade( quantidade) => this.quantidade = quantidade;

  get preco {
    _preco = produto.precoComDesconto;
    return _preco;
  } 
  set preco( value) {
    if (value > 0) {
      this._preco = value;
    }
  } 
}