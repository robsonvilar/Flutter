import 'package:flutter/material.dart';

class ElevatedButtonCustomizado extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double size;

  const ElevatedButtonCustomizado({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    this.size = 0.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<CircleBorder>(CircleBorder()),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(20)),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(
            MediaQuery.of(context).size.width * size,
            MediaQuery.of(context).size.width * size,
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
  }
}
