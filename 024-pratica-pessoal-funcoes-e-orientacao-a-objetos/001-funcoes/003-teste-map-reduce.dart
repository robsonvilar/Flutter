void main() {

    var dicionario1 = [
        {'nome': 'n1', 'nota': 1},
        {'nome': 'n2', 'nota': 2},
        {'nome': 'n3', 'nota': 3},
    ];

    String Function(Map) v1 = (aluno) => aluno['nome'];

    var receberAlunos = dicionario1.map(v1);

    print(receberAlunos);

}