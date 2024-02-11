import 'package:docdr/custom_widget/alert_dialog.dart';
import 'package:docdr/custom_widget/ekle_baba.dart';
import 'package:docdr/custom_widget/provider.dart';
import 'package:docdr/custom_widget/temizleme_kutusu.dart';
import 'package:docdr/custom_widget/textfield_box.dart';
import 'package:docdr/custom_widget/wrap_listesi.dart';
import 'package:docdr/notlar/icon.dart';
import 'package:docdr/notlar/kaydetme.dart';
import 'package:docdr/notlar/makaleler.dart';
import 'package:docdr/notlar/sayfa_listesi.dart';
import 'package:docdr/notlar/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnuncuSayfa extends StatefulWidget {
  const OnuncuSayfa({super.key});

  @override
  State<OnuncuSayfa> createState() => _OnuncuSayfaState();
}

class _OnuncuSayfaState extends State<OnuncuSayfa> {
  TextEditingController sayiController = TextEditingController();
  final HesaplamaProvider hesaplamaProvider = HesaplamaProvider();

  int? isimsirasi = 3;

  @override
  Widget build(BuildContext context) {
    final hesaplamaProvider = Provider.of<HesaplamaProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(children: [
            TextFieldBox(
                controller: sayiController,
                decoration: ProjectStyle.textFieldInputDecoration("Kişi Sayısı")),
            Column(
              children: Makaleler.patentMak.asMap().entries.map((entry) {
                final index = entry.key;
                final makale = entry.value;

                return Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(
                            makale,
                            style: ProjectStyle.projectTextStyle,
                          ),
                          trailing: EkleBaba(
                            sayiController: sayiController,
                            makalepuani: Makaleler.patentPuan[index],
                            updateCallback: (double sonucDeger) {
                              hesaplamaProvider.updateValues(
                                  sonucDeger, SayfaListesi.onuncuSayfaIndex);
                              sayiController.clear();
                            },
                            isimsirasi: isimsirasi,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            )
          ]),
          WrapListesi(
            results: ResultList.resultList[SayfaListesi.onuncuSayfaIndex],
            removeResult: hesaplamaProvider.removeResult,
            sayfaIndex: SayfaListesi.onuncuSayfaIndex,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToplamSonuc(total: ResultList.totalList[SayfaListesi.onuncuSayfaIndex]),
              IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            sayfaIndex: SayfaListesi.onuncuSayfaIndex,
                          );
                        },
                      ),
                  icon: const Icon(MyFlutterApp.help))
            ],
          ),
          TemizlemeKutusu(
            temizle: hesaplamaProvider.temizle,
            sayfaIndex: SayfaListesi.onuncuSayfaIndex,
          )
        ],
      ),
    );
  }
}
