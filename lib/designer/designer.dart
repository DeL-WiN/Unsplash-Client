import 'package:flutter/material.dart';

class Bold extends StatelessWidget {
  final String text;
  const Bold({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class Usual extends StatelessWidget {
  final String text;
  const Usual({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}
