import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
        ),
        child: Text(texto),
      ),
    );
  }
}
