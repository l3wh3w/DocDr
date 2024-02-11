import 'package:docdr/custom_widget/alert_dialog.dart';
import 'package:docdr/custom_widget/ekle_baba.dart';
import 'package:docdr/custom_widget/new_radio_button.dart';
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

class IkinciSayfa extends StatefulWidget {
  const IkinciSayfa({super.key});

  @override
  State<IkinciSayfa> createState() => _IkinciSayfaState();
}

class _IkinciSayfaState extends State<IkinciSayfa> {
  TextEditingController sayiController = TextEditingController();
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
          Column(children: [
            Padding(
                padding: ProjectStyle.yazilarPadding(),
                child: Text(Yazilar.ulusalMak,
                    textAlign: ProjectStyle.yazilarAlign(), style: ProjectStyle.projectTextStyle)),
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
            Column(
              children: Makaleler.ulusalMak.asMap().entries.map((entry) {
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
                            makalepuani: Makaleler.ulusalPuan[index],
                            updateCallback: (double sonucDeger) {
                              hesaplamaProvider.updateValues(
                                  sonucDeger, SayfaListesi.ikinciSayfaIndex);
                              hesaplamaProvider.updateIndex(SayfaListesi.ikinciSayfaIndex, index);
                              hesaplamaProvider.updateBirinciIsim(
                                  isimsirasi, index, SayfaListesi.ikinciSayfaIndex);
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
            results: ResultList.resultList[SayfaListesi.ikinciSayfaIndex],
            removeResult: (indexToRemove, valueToRemove, sayfaIndex) {
              hesaplamaProvider.removeResult(
                  indexToRemove, valueToRemove, SayfaListesi.ikinciSayfaIndex);
              hesaplamaProvider.removeBirinciIsim(indexToRemove, SayfaListesi.ikinciSayfaIndex);
              hesaplamaProvider.removeIndex(indexToRemove, SayfaListesi.ikinciSayfaIndex);
            },
            sayfaIndex: SayfaListesi.ikinciSayfaIndex,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToplamSonuc(total: ResultList.totalList[SayfaListesi.ikinciSayfaIndex]),
              if (ResultList.birinciIsimList[SayfaListesi.ikinciSayfaIndex]
                          .where((x) => x == 1)
                          .length >
                      1 &&
                  ResultList.indexList[SayfaListesi.ikinciSayfaIndex].where((x) => x == 0).length >
                      1 &&
                  ResultList.resultList[SayfaListesi.ikinciSayfaIndex].length > 2)
                const MedalIcon(),
              IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            sayfaIndex: SayfaListesi.ikinciSayfaIndex,
                          );
                        },
                      ),
                  icon: const Icon(MyFlutterApp.help))
            ],
          ),
          TemizlemeKutusu(
            temizle: (sayfaIndex) {
              hesaplamaProvider.temizle(SayfaListesi.ikinciSayfaIndex);
              hesaplamaProvider.temizleBirinciIsim(SayfaListesi.ikinciSayfaIndex);
              hesaplamaProvider.temizleIndex(SayfaListesi.ikinciSayfaIndex);
            },
            sayfaIndex: SayfaListesi.ikinciSayfaIndex,
          ),
        ],
      ),
    );
  }
}
