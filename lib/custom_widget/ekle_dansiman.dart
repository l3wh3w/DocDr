import 'package:flutter/material.dart';

class EkleDanisman extends StatefulWidget {
  const EkleDanisman({
    super.key,
    required this.makalepuani,
    required this.updateCallback,
    required this.isimsirasi,
  });
  final Function updateCallback;
  final int makalepuani;
  final int? isimsirasi;

  @override
  State<EkleDanisman> createState() => EkleDanismanState();
}

int birinciIsimsayisi = 0;

class EkleDanismanState extends State<EkleDanisman> {
  void hesaplaBaba(
    int makalepuani,
    int? isimsirasi,
  ) {
    double sonucDeger = 0;
    double dergipuani = makalepuani.toDouble();

    isimsirasi == 1 ? sonucDeger = dergipuani : sonucDeger = dergipuani / 2;

    widget.updateCallback(sonucDeger);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          {
            hesaplaBaba(widget.makalepuani, widget.isimsirasi);
          }
        },
        child: const Text("Ekle"));
  }
}
