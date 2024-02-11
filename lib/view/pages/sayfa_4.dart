import 'package:docdr/product/custom_widget/alert_dialog.dart';
import 'package:docdr/product/custom_widget/ekle_dansiman.dart';
import 'package:docdr/core/constant/static/kaydetme.dart';
import 'package:docdr/core/constant/static/makaleler.dart';
import 'package:docdr/product/custom_widget/temizleme_kutusu.dart';
import 'package:docdr/product/custom_widget/textfield_box.dart';
import 'package:docdr/product/custom_widget/wrap_listesi.dart';
import 'package:docdr/core/constant/static/icon.dart';
import 'package:docdr/core/constant/static/sayfa_listesi.dart';
import 'package:docdr/core/constant/static/style.dart';
import 'package:docdr/product/custom_widget/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DorduncuSayfa extends StatefulWidget {
  const DorduncuSayfa({super.key});

  @override
  State<DorduncuSayfa> createState() => _DorduncuSayfaState();
}

class _DorduncuSayfaState extends State<DorduncuSayfa> {
  TextEditingController sayiController = TextEditingController();
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
                Padding(
                    padding: ProjectStyle.yazilarPadding(),
                    child: Text(Yazilar.kitapMak,
                        textAlign: ProjectStyle.yazilarAlign(), style: ProjectStyle.projectTextStyle)),
                Column(
                  children: Makaleler.kitapMak.asMap().entries.map((entry) {
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
                                style: const TextStyle(fontSize: 16),
                              ),
                              trailing: EkleDanisman(
                                makalepuani: Makaleler.kitapPuan[index],
                                updateCallback: (double sonucDeger) {
                                  hesaplamaProvider.updateValues(sonucDeger, SayfaListesi.dorduncuSayfaIndex);
                                  hesaplamaProvider.updateIndex(SayfaListesi.dorduncuSayfaIndex, index);
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
            results: ResultList.resultList[SayfaListesi.dorduncuSayfaIndex],
            removeResult: (indexToRemove, valueToRemove, sayfaIndex) {
              hesaplamaProvider.removeResult(indexToRemove, valueToRemove, SayfaListesi.dorduncuSayfaIndex);
              hesaplamaProvider.removeIndex(indexToRemove, SayfaListesi.dorduncuSayfaIndex);
            },
            sayfaIndex: SayfaListesi.dorduncuSayfaIndex,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToplamSonuc(total: ResultList.totalList[SayfaListesi.dorduncuSayfaIndex]),
              if (ResultList.resultList[SayfaListesi.dorduncuSayfaIndex].isNotEmpty) const MedalIcon(),
              IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            sayfaIndex: SayfaListesi.dorduncuSayfaIndex,
                          );
                        },
                      ),
                  icon: const Icon(MyFlutterApp.help))
            ],
          ),
          TemizlemeKutusu(
            temizle: (sayfaIndex) {
              hesaplamaProvider.temizle(SayfaListesi.dorduncuSayfaIndex);
              hesaplamaProvider.temizleIndex(SayfaListesi.dorduncuSayfaIndex);
            },
            sayfaIndex: SayfaListesi.dorduncuSayfaIndex,
          )
        ],
      ),
    );
  }
}
