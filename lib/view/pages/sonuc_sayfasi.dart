import 'package:docdr/product/custom_widget/provider.dart';
import 'package:docdr/core/constant/static/kaydetme.dart';
import 'package:docdr/core/constant/static/makaleler.dart';
import 'package:docdr/core/constant/static/sonuc_sayfa.dart';
import 'package:docdr/core/constant/static/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SonucSayfasi extends StatefulWidget {
  const SonucSayfasi({super.key});

  @override
  State<SonucSayfasi> createState() => _SonucSayfasiState();
}

class _SonucSayfasiState extends State<SonucSayfasi> {
  final HesaplamaProvider hesaplamaProvider = HesaplamaProvider();

  @override
  Widget build(BuildContext context) {
    final hesaplamaProvider = Provider.of<HesaplamaProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              for (int i = 0; i < Basliklar.sonucBasliklar.length; i++)
                Card(
                  margin: ProjectStyle.cardMargin(),
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      Basliklar.sonucBasliklar[i],
                      style: ProjectStyle.projectTextStyle,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          SonucSayfaNotlari.getSonucSayilari()[i],
                          style: ProjectStyle.projectTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ElevatedButton(
                  onPressed: () async {
                    hesaplamaProvider.tumunuTemizle();
                    await ResultList.save();
                  },
                  child: const Text("Tümünü Temizle")),
              ElevatedButton(
                  onPressed: () async {
                    await ResultList.save();
                  },
                  child: const Text("Kaydet")),
            ],
          )
        ],
      ),
    );
  }
}
