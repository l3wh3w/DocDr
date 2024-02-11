import 'package:flutter/material.dart';

class TextFieldBox extends StatelessWidget {
  const TextFieldBox({super.key, required this.controller, required this.decoration});

  final TextEditingController controller;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: decoration,
        ));
  }
}

class ToplamSonuc extends StatelessWidget {
  const ToplamSonuc({
    super.key,
    required this.total,
  });

  final double total;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Toplam Sonuç: ${total.toStringAsFixed(2)}',
      style: const TextStyle(fontSize: 18),
    );
  }
}
