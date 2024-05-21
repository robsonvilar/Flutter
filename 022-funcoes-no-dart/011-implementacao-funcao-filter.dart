void main() {

  var notas = [8.2, 7.3, 6.8, 5.4, 2.7, 9.3];
  var boasNotasFn = (double nota) => nota >= 7.5;

  var somenteNotasBoas = filtrar<double>(notas,boasNotasFn);

  print(somenteNotasBoas);

}


List<E> filtrar<E>(List<E> lista, bool Function(E) fn) {
  List<E> listaFiltrada = [];
  for (E elemento in lista) {
    if (fn(elemento) == true) {
      listaFiltrada.add(elemento);
    }
  }
  return listaFiltrada;
}
