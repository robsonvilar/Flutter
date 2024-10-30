import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  String texto;
  void Function() botaoClicado;

  Botao(
    this.texto,
    this.botaoClicado,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: botaoClicado,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(200, 40)),
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
