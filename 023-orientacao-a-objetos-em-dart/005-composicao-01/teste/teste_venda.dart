import '../modelo/produto.dart';
import '../modelo/venda.dart';
import '../modelo/cliente.dart';
import '../modelo/venda_item.dart';

void main() {
  var venda = Venda(
    cliente: Cliente(
      cpf: '123.456.789-00',
      nome: 'Francisco Cardoso',
    ),
    items: <VendaItem>[
      VendaItem(
        quantidade: 10,
        produto: Produto(
          codigo: 1,
          nome: 'Caneta Bic',
          preco: 5.89,
          desconto: 0.5,
        ),
      ),
      VendaItem(
        quantidade: 100,
        produto: Produto(
          codigo: 52,
          nome: 'Borracha',
          preco: 0.5,
          desconto: 0.1,
        ),
      ),
      VendaItem(
        quantidade: 8,
        produto: Produto(
          codigo: 123,
          nome: 'Caderno',
          preco: 6.89,
          desconto: 0.2,
        ),
      ),
    ],
  );

  print(venda.valorTotal);

  print('Nome do primeiro produto é: ${venda.items[0].produto.nome}');
  print('O CPF do cliente é: ${venda.cliente.cpf}');
}