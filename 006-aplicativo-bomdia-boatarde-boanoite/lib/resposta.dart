import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  Resposta(this.texto);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(''),
        const Center(child: Text('Você apertou o botão:', style: TextStyle(fontSize: 25),)),
        Center(child: Text('[$texto]',style: const TextStyle(fontSize: 25),))
      ],
    );
  }
}
