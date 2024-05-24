import './cliente.dart';
import './venda_item.dart';

class Venda {
  Cliente cliente = Cliente();
  List<VendaItem> items = [];

  Venda({Cliente? cliente, List<VendaItem>? items}) 
    : cliente = cliente ?? Cliente(),
      items = items ?? [];

  dynamic get valorTotal {
    dynamic v1 = items.map((item) => item.preco * item.quantidade);
    v1 = v1.reduce((t, a) => t + a);
    return v1;
  }
}