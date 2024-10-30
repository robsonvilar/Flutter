import 'package:flutter/material.dart';
import './resposta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String textoAtual = 'Nenhum texto';

  void bomDia() {
    setState(() {
      textoAtual = 'Bom dia';
    });
  }

  void boaTarde() {
    setState(() {
      textoAtual = 'Boa tarde';
    });
  }

  void boaNoite() {
    setState(() {
      textoAtual = 'Boa noite';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Resposta(textoAtual),
              ElevatedButton(
                onPressed: bomDia,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.lightGreen),
                  fixedSize: MaterialStatePropertyAll(Size(150, 10)),
                ),
                child: const Text(
                  'Bom dia',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: boaTarde,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.lightGreen),
                  fixedSize: MaterialStatePropertyAll(Size(150, 10)),
                ),
                child: const Text(
                  'Boa tarde',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: boaNoite,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.lightGreen),
                  fixedSize: MaterialStatePropertyAll(Size(150, 10)),
                ),
                child: const Text(
                  'Boa noite',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
