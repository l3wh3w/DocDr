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

class BesinciSayfa extends StatefulWidget {
  const BesinciSayfa({super.key});

  @override
  State<BesinciSayfa> createState() => _BesinciSayfaState();
}

class _BesinciSayfaState extends State<BesinciSayfa> {
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
                    child: Text(Yazilar.atifMak,
                        textAlign: ProjectStyle.yazilarAlign(), style: ProjectStyle.projectTextStyle)),
                Column(
                  children: Makaleler.atifMak.asMap().entries.map((entry) {
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
                                makalepuani: Makaleler.atifPuan[index],
                                updateCallback: (double sonucDeger) {
                                  hesaplamaProvider.updateValues(sonucDeger, SayfaListesi.besinciSayfaIndex);
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
            results: ResultList.resultList[SayfaListesi.besinciSayfaIndex],
            removeResult: hesaplamaProvider.removeResult,
            sayfaIndex: SayfaListesi.besinciSayfaIndex,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToplamSonuc(total: ResultList.totalList[SayfaListesi.besinciSayfaIndex]),
              if (ResultList.totalList[SayfaListesi.besinciSayfaIndex] > 4) const MedalIcon(),
              IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            sayfaIndex: SayfaListesi.besinciSayfaIndex,
                          );
                        },
                      ),
                  icon: const Icon(MyFlutterApp.help))
            ],
          ),
          TemizlemeKutusu(
            temizle: hesaplamaProvider.temizle,
            sayfaIndex: SayfaListesi.besinciSayfaIndex,
          )
        ],
      ),
    );
  }
}
