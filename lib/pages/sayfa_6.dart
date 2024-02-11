import 'package:docdr/custom_widget/alert_dialog.dart';
import 'package:docdr/custom_widget/ekle_dansiman.dart';
import 'package:docdr/notlar/kaydetme.dart';
import 'package:docdr/notlar/makaleler.dart';
import 'package:docdr/custom_widget/new_radio_button.dart';
import 'package:docdr/custom_widget/temizleme_kutusu.dart';
import 'package:docdr/custom_widget/textfield_box.dart';
import 'package:docdr/custom_widget/wrap_listesi.dart';
import 'package:docdr/notlar/icon.dart';
import 'package:docdr/notlar/sayfa_listesi.dart';
import 'package:docdr/notlar/style.dart';
import 'package:docdr/custom_widget/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AltinciSayfa extends StatefulWidget {
  const AltinciSayfa({super.key});

  @override
  State<AltinciSayfa> createState() => _AltinciSayfaState();
}

class _AltinciSayfaState extends State<AltinciSayfa> {
  final HesaplamaProvider hesaplamaProvider = HesaplamaProvider();

  int? isimsirasi = 1;

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
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Padding(
                    padding: ProjectStyle.yazilarPadding(),
                    child: Text(Yazilar.danismanlikMak,
                        textAlign: ProjectStyle.yazilarAlign(),
                        style: ProjectStyle.projectTextStyle)),
                Column(
                  children: Makaleler.danismanlikMak.asMap().entries.map((entry) {
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
                                makalepuani: Makaleler.danismanlikPuan[index],
                                updateCallback: (double sonucDeger) {
                                  hesaplamaProvider.updateValues(
                                      sonucDeger, SayfaListesi.altinciSayfaIndex);
                                },
                                isimsirasi: isimsirasi,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioButton(
                          icerik: Isimler.asilDanisman,
                          value: 1,
                          isimsirasi: isimsirasi,
                          onChanged: _handleRadioValueChange),
                      RadioButton(
                          icerik: Isimler.yardimciDanisman,
                          value: 2,
                          isimsirasi: isimsirasi,
                          onChanged: _handleRadioValueChange),
                    ],
                  ),
                ])
              ]),
            ],
          ),
          WrapListesi(
            results: ResultList.resultList[SayfaListesi.altinciSayfaIndex],
            removeResult: hesaplamaProvider.removeResult,
            sayfaIndex: SayfaListesi.altinciSayfaIndex,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToplamSonuc(total: ResultList.totalList[SayfaListesi.altinciSayfaIndex]),
              IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            sayfaIndex: SayfaListesi.altinciSayfaIndex,
                          );
                        },
                      ),
                  icon: const Icon(MyFlutterApp.help))
            ],
          ),
          TemizlemeKutusu(
            temizle: hesaplamaProvider.temizle,
            sayfaIndex: SayfaListesi.altinciSayfaIndex,
          )
        ],
      ),
    );
  }
}
