import 'package:docdr/product/custom_widget/alert_dialog.dart';
import 'package:docdr/product/custom_widget/ekle_dansiman.dart';
import 'package:docdr/core/constant/static/kaydetme.dart';
import 'package:docdr/core/constant/static/makaleler.dart';
import 'package:docdr/product/custom_widget/temizleme_kutusu.dart';
import 'package:docdr/product/custom_widget/text_box.dart';
import 'package:docdr/product/custom_widget/textfield_box.dart';
import 'package:docdr/product/custom_widget/wrap_listesi.dart';
import 'package:docdr/core/constant/static/icon.dart';
import 'package:docdr/core/constant/static/sayfa_listesi.dart';
import 'package:docdr/core/constant/static/style.dart';
import 'package:docdr/product/custom_widget/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YedinciSayfa extends StatefulWidget {
  const YedinciSayfa({super.key});

  @override
  State<YedinciSayfa> createState() => _YedinciSayfaState();
}

class _YedinciSayfaState extends State<YedinciSayfa> {
  final HesaplamaProvider hesaplamaProvider = HesaplamaProvider();

  int isimsirasi = 1;

  @override
  Widget build(BuildContext context) {
    final hesaplamaProvider = Provider.of<HesaplamaProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Card(
                  elevation: 4,
                  margin: ProjectStyle.cardMargin(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(Yazilar.bapMak, style: ProjectStyle.projectTextStyle),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          for (int i = 0; i < Makaleler.bapMak.length; i++)
                            if (i < 3)
                              Row(
                                children: [
                                  QTextBox(
                                    index: i,
                                    makale: Makaleler.bapMak,
                                    width: screenWidth * 3 / 4,
                                  ),
                                  EkleDanisman(
                                    makalepuani: Makaleler.bapPuan[i],
                                    updateCallback: (double sonucDeger) {
                                      hesaplamaProvider.updateValues(sonucDeger, SayfaListesi.yedinciSayfaIndex);
                                    },
                                    isimsirasi: isimsirasi,
                                  ),
                                ],
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: Makaleler.bapMak.asMap().entries.skip(3).map((entry) {
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
                                makalepuani: Makaleler.bapPuan[index],
                                updateCallback: (double sonucDeger) {
                                  hesaplamaProvider.updateValues(sonucDeger, SayfaListesi.yedinciSayfaIndex);
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
            results: ResultList.resultList[SayfaListesi.yedinciSayfaIndex],
            removeResult: hesaplamaProvider.removeResult,
            sayfaIndex: SayfaListesi.yedinciSayfaIndex,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToplamSonuc(total: ResultList.totalList[SayfaListesi.yedinciSayfaIndex]),
              IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            sayfaIndex: SayfaListesi.yedinciSayfaIndex,
                          );
                        },
                      ),
                  icon: const Icon(MyFlutterApp.help))
            ],
          ),
          TemizlemeKutusu(
            temizle: hesaplamaProvider.temizle,
            sayfaIndex: SayfaListesi.yedinciSayfaIndex,
          )
        ],
      ),
    );
  }
}
