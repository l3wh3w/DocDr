import 'package:docdr/notlar/kaydetme.dart';
import 'package:docdr/notlar/sayfa_listesi.dart';

class SonucSayfaNotlari {
  static List<String> getSonucSayilari() {
    int sciMakSayisi = ResultList.isSCIBirinciIsim.length;
    int birinciIsimToplam =
        (ResultList.birinciIsimList[SayfaListesi.birinciSayfaIndex].where((x) => x == 1).length +
            ResultList.birinciIsimList[SayfaListesi.ikinciSayfaIndex].where((x) => x == 1).length);
    int toplamMakaleSayisi = ResultList.resultList[SayfaListesi.birinciSayfaIndex].length +
        ResultList.resultList[SayfaListesi.ikinciSayfaIndex].length +
        ResultList.indexList[SayfaListesi.ucuncuSayfaIndex].where((x) => x < 4).length;
    int toplamKitapSayisi =
        ResultList.indexList[SayfaListesi.ucuncuSayfaIndex].where((x) => x > 3).length +
            ResultList.resultList[SayfaListesi.dorduncuSayfaIndex].length;

    List<String> sonucSayilari = [
      toplamMakaleSayisi.toString(),
      birinciIsimToplam.toString(),
      sciMakSayisi.toString(),
      toplamKitapSayisi.toString(),
      ...ResultList.totalList.map((double eleman) => eleman.toStringAsFixed(2)).toList(),
    ];

    return sonucSayilari;
  }
}
