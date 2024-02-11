import 'package:docdr/notlar/makaleler.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.sayfaIndex,
  });
  final int sayfaIndex;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(Basliklar.sartlar),
        content: Container(
          padding: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Text(
            Sartlar.sCISart[sayfaIndex],
          ),
        ));
  }
}
