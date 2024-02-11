import 'package:docdr/custom_widget/alert_dialog.dart';
import 'package:docdr/custom_widget/ekle_dansiman.dart';
import 'package:docdr/notlar/kaydetme.dart';
import 'package:docdr/notlar/makaleler.dart';
import 'package:docdr/custom_widget/temizleme_kutusu.dart';
import 'package:docdr/custom_widget/textfield_box.dart';
import 'package:docdr/custom_widget/wrap_listesi.dart';
import 'package:docdr/notlar/icon.dart';
import 'package:docdr/notlar/sayfa_listesi.dart';
import 'package:docdr/notlar/style.dart';
import 'package:docdr/custom_widget/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnikinciSayfa extends StatefulWidget {
  const OnikinciSayfa({super.key});

  @override
  State<OnikinciSayfa> createState() => _OnikinciSayfaState();
}

class _OnikinciSayfaState extends State<OnikinciSayfa> {
  final HesaplamaProvider hesaplamaProvider = HesaplamaProvider();

  int? isimsirasi = 1;

  @override
  Widget build(BuildContext context) {
    final hesaplamaProvider = Provider.of<HesaplamaProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Column(
                  children: Makaleler.editorlukMak.asMap().entries.map((entry) {
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
                              trailing: EkleDanisman(
                                makalepuani: Makaleler.editorlukPuan[index],
                                updateCallback: (double sonucDeger) {
                                  hesaplamaProvider.updateValues(
                                      sonucDeger, SayfaListesi.onikinciSayfaIndex);
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
            ],
          ),
          WrapListesi(
            results: ResultList.resultList[SayfaListesi.onikinciSayfaIndex],
            removeResult: hesaplamaProvider.removeResult,
            sayfaIndex: SayfaListesi.onikinciSayfaIndex,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToplamSonuc(total: ResultList.totalList[SayfaListesi.onikinciSayfaIndex]),
              IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            sayfaIndex: SayfaListesi.onikinciSayfaIndex,
                          );
                        },
                      ),
                  icon: const Icon(MyFlutterApp.help))
            ],
          ),
          TemizlemeKutusu(
            temizle: hesaplamaProvider.temizle,
            sayfaIndex: SayfaListesi.onikinciSayfaIndex,
          )
        ],
      ),
    );
  }
}
