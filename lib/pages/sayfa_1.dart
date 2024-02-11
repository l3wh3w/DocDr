import 'package:docdr/custom_widget/alert_dialog.dart';
import 'package:docdr/notlar/kaydetme.dart';
import 'package:docdr/notlar/makaleler.dart';
import 'package:docdr/custom_widget/new_radio_button.dart';
import 'package:docdr/custom_widget/temizleme_kutusu.dart';
import 'package:docdr/custom_widget/text_box.dart';
import 'package:docdr/custom_widget/textfield_box.dart';
import 'package:docdr/custom_widget/ekle_baba.dart';
import 'package:docdr/custom_widget/wrap_listesi.dart';
import 'package:docdr/notlar/icon.dart';
import 'package:docdr/notlar/sayfa_listesi.dart';
import 'package:docdr/notlar/style.dart';
import 'package:docdr/custom_widget/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirinciSayfa extends StatefulWidget {
  const BirinciSayfa({super.key});

  @override
  State<BirinciSayfa> createState() => _BirinciSayfaState();
}

class _BirinciSayfaState extends State<BirinciSayfa> {
  TextEditingController sayiController = TextEditingController();
  final HesaplamaProvider hesaplamaProvider = HesaplamaProvider();

  int isimsirasi = 1;

  void _handleRadioValueChange([value]) {
    setState(() {
      isimsirasi = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hesaplamaProvider = Provider.of<HesaplamaProvider>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: ProjectStyle.yazilarPadding(),
                  child: Text(Yazilar.ulusalMak,
                      textAlign: ProjectStyle.yazilarAlign(),
                      style: ProjectStyle.projectTextStyle)),
              Column(children: [
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioButton(
                          icerik: Isimler.birinciIsim,
                          value: 1,
                          isimsirasi: isimsirasi,
                          onChanged: _handleRadioValueChange),
                      RadioButton(
                          icerik: Isimler.icinciIsim,
                          value: 2,
                          isimsirasi: isimsirasi,
                          onChanged: _handleRadioValueChange),
                    ],
                  ),
                  RadioButton(
                      icerik: Isimler.ucuncuIsim,
                      value: 3,
                      isimsirasi: isimsirasi,
                      onChanged: _handleRadioValueChange)
                ]),
                TextFieldBox(
                    controller: sayiController,
                    decoration: ProjectStyle.textFieldInputDecoration("Yazar Sayısı")),
                Column(children: [
                  Card(
                    elevation: 4,
                    margin: ProjectStyle.cardMargin(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(Yazilar.sCIMak, style: ProjectStyle.projectTextStyle),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int index = 0; index < Makaleler.sCImak.length; index++)
                              if (index < 2)
                                Row(
                                  children: [
                                    QTextBox(
                                      index: index,
                                      makale: Makaleler.sCImak,
                                      width: 60,
                                    ),
                                    EkleBaba(
                                      sayiController: sayiController,
                                      makalepuani: Makaleler.sCIpuan[index],
                                      updateCallback: (
                                        double sonucDeger,
                                      ) {
                                        hesaplamaProvider.updateValues(
                                            sonucDeger, SayfaListesi.birinciSayfaIndex);
                                        sayiController.clear();
                                        hesaplamaProvider.updateBirinciIsim(
                                            isimsirasi, index, SayfaListesi.birinciSayfaIndex);
                                        hesaplamaProvider.updateSCIBirinciIsim(isimsirasi, index);
                                      },
                                      isimsirasi: isimsirasi,
                                    ),
                                  ],
                                ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int index = 0; index < Makaleler.sCImak.length; index++)
                              if (index >= 2 && index < 4)
                                Row(
                                  children: [
                                    QTextBox(
                                      index: index,
                                      makale: Makaleler.sCImak,
                                      width: 60,
                                    ),
                                    EkleBaba(
                                      sayiController: sayiController,
                                      makalepuani: Makaleler.sCIpuan[index],
                                      updateCallback: (double sonucDeger) {
                                        hesaplamaProvider.updateValues(
                                            sonucDeger, SayfaListesi.birinciSayfaIndex);
                                        hesaplamaProvider.updateBirinciIsim(
                                            isimsirasi, index, SayfaListesi.birinciSayfaIndex);
                                        hesaplamaProvider.updateSCIBirinciIsim(isimsirasi, index);
                                        sayiController.clear();
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
                    children: Makaleler.sCImak.asMap().entries.skip(4).map((entry) {
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
                                  makalepuani: Makaleler.sCIpuan[index],
                                  updateCallback: (double sonucDeger) {
                                    hesaplamaProvider.updateValues(
                                      sonucDeger,
                                      SayfaListesi.birinciSayfaIndex,
                                    );
                                    hesaplamaProvider.updateBirinciIsim(
                                        isimsirasi, index, SayfaListesi.birinciSayfaIndex);
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
                ])
              ]),
            ],
          ),
          WrapListesi(
            results: ResultList.resultList[SayfaListesi.birinciSayfaIndex],
            removeResult: (indexToRemove, valueToRemove, sayfaIndex) {
              hesaplamaProvider.removeResult(
                  indexToRemove, valueToRemove, SayfaListesi.birinciSayfaIndex);
              hesaplamaProvider.removeBirinciIsim(indexToRemove, SayfaListesi.birinciSayfaIndex);
              hesaplamaProvider.removeisSCI(indexToRemove);
            },
            sayfaIndex: SayfaListesi.birinciSayfaIndex,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToplamSonuc(total: ResultList.totalList[SayfaListesi.birinciSayfaIndex]),
              if (ResultList.isSCIBirinciIsim.where((x) => x == 1).length > 2 &&
                  ResultList.totalList[SayfaListesi.birinciSayfaIndex] >= 40)
                const MedalIcon(),
              IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            sayfaIndex: SayfaListesi.birinciSayfaIndex,
                          );
                        },
                      ),
                  icon: const Icon(MyFlutterApp.help)),
            ],
          ),
          TemizlemeKutusu(
            temizle: (sayfaIndex) {
              hesaplamaProvider.temizle(SayfaListesi.birinciSayfaIndex);
              hesaplamaProvider.temizleBirinciIsim(SayfaListesi.birinciSayfaIndex);
              hesaplamaProvider.temizleisSCI;
            },
            sayfaIndex: SayfaListesi.birinciSayfaIndex,
          )
        ],
      ),
    );
  }
}
