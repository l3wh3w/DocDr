import 'package:flutter/material.dart';

class EkleBaba extends StatefulWidget {
  const EkleBaba({
    super.key,
    required this.sayiController,
    required this.makalepuani,
    required this.updateCallback,
    required this.isimsirasi,
  });
  final Function updateCallback;

  final int makalepuani;
  final TextEditingController sayiController;
  final int? isimsirasi;

  @override
  State<EkleBaba> createState() => EkleBabaState();
}

int birinciIsimsayisi = 0;

class EkleBabaState extends State<EkleBaba> {
  void hesaplaBaba(
    int makalepuani,
    TextEditingController sayiController,
    int? isimsirasi,
  ) {
    double sonucDeger = 0;
    double yazarsayisi = double.tryParse(sayiController.text) ?? 1;
    double dergipuani = makalepuani.toDouble();

    if (yazarsayisi == 1 && isimsirasi != 1) {
      sonucDeger = dergipuani;
    } else if (isimsirasi == 1 && yazarsayisi == 1) {
      sonucDeger = dergipuani;
    } else if (isimsirasi == 1 && yazarsayisi == 2) {
      sonucDeger = dergipuani * 0.8;
    } else if (isimsirasi == 2 && yazarsayisi == 2) {
      sonucDeger = dergipuani * 0.5;
    } else if (isimsirasi == 1) {
      sonucDeger = dergipuani / 2;
    } else if (isimsirasi == 2) {
      sonucDeger = dergipuani / (yazarsayisi - 1);
    } else if (isimsirasi == 3) {
      sonucDeger = dergipuani / yazarsayisi;
    }

// burada elde edilen değeri buradan çıkarmak için bu şekilde Callback fonksiyonu kullanıyoruz.
    widget.updateCallback(sonucDeger);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          final authorCountText = widget.sayiController.text;
          if (authorCountText.isNotEmpty &&
              double.tryParse(authorCountText) != 0) {
            hesaplaBaba(
                widget.makalepuani, widget.sayiController, widget.isimsirasi);
            // makalepuani, sayi controller, isim sirasi değişkenlerini widgetin koyulduğu sayfadan alıp alıp hesapla fonksiyonuna veriyor.
          }
        },
        child: const Text("Ekle"));
  }
}
