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

class OnbirinciSayfa extends StatefulWidget {
  const OnbirinciSayfa({super.key});

  @override
  State<OnbirinciSayfa> createState() => _OnbirinciSayfaState();
}

class _OnbirinciSayfaState extends State<OnbirinciSayfa> {
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
                const Row(mainAxisAlignment: MainAxisAlignment.center, children: []),
                Column(
                  children: Makaleler.odulMak.asMap().entries.map((entry) {
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
                                makalepuani: Makaleler.odulPuan[index],
                                updateCallback: (double sonucDeger) {
                                  hesaplamaProvider.updateValues(
                                      sonucDeger, SayfaListesi.onbirinciSayfaIndex);
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
            results: ResultList.resultList[SayfaListesi.onbirinciSayfaIndex],
            removeResult: hesaplamaProvider.removeResult,
            sayfaIndex: SayfaListesi.onbirinciSayfaIndex,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToplamSonuc(total: ResultList.totalList[SayfaListesi.onbirinciSayfaIndex]),
              IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            sayfaIndex: SayfaListesi.onbirinciSayfaIndex,
                          );
                        },
                      ),
                  icon: const Icon(MyFlutterApp.help))
            ],
          ),
          TemizlemeKutusu(
            temizle: hesaplamaProvider.temizle,
            sayfaIndex: SayfaListesi.onbirinciSayfaIndex,
          )
        ],
      ),
    );
  }
}
