import 'package:docdr/notlar/kaydetme.dart';

import 'package:flutter/material.dart';

class HesaplamaProvider extends ChangeNotifier {
  double total = 0.0;
  List<String> results = [];
  String sonuc = "";

  void removeResult(int indexToRemove, double valueToRemove, sayfaIndex) {
    ResultList.resultList[sayfaIndex].removeAt(indexToRemove);
    ResultList.totalList[sayfaIndex] -= valueToRemove;
    notifyListeners();
  }

  void removeBirinciIsim(int indexToRemove, sayfaIndex) {
    ResultList.birinciIsimList[sayfaIndex].removeAt(indexToRemove);
    notifyListeners();
  }

  void removeIndex(int indexToRemove, sayfaIndex) {
    ResultList.indexList[sayfaIndex].removeAt(indexToRemove);
    notifyListeners();
  }

  void removeisSCI(indexToRemove) {
    ResultList.isSCIBirinciIsim.removeAt(indexToRemove);
  }

  void updateValues(double sonucDeger, int sayfaIndex) {
    ResultList.resultList[sayfaIndex].add(sonucDeger);
    ResultList.totalList[sayfaIndex] += sonucDeger;
    notifyListeners();
  }

  void updateIndex(sayfaIndex, index) {
    ResultList.indexList[sayfaIndex].add(index);
    notifyListeners();
  }

  void updateBirinciIsim(isimsirasi, index, int sayfaIndex) {
    isimsirasi == 1
        ? ResultList.birinciIsimList[sayfaIndex].add(1)
        : ResultList.birinciIsimList[sayfaIndex].add(0);
    notifyListeners();
  }

  void updateSCIBirinciIsim(isimsirasi, index) {
    isimsirasi == 1 && index <= 3
        ? ResultList.isSCIBirinciIsim.add(1)
        : ResultList.isSCIBirinciIsim.add(0);
    notifyListeners();
  }

  void temizle(sayfaIndex) {
    ResultList.resultList[sayfaIndex].clear();
    ResultList.totalList[sayfaIndex] = 0.0;
    notifyListeners();
  }

  void temizleBirinciIsim(sayfaIndex) {
    ResultList.birinciIsimList[sayfaIndex].clear();
    notifyListeners();
  }

  void temizleIndex(sayfaIndex) {
    ResultList.indexList[sayfaIndex].clear();
    notifyListeners();
  }

  void temizleisSCI() {
    ResultList.birinciIsimList.clear();
    notifyListeners();
  }

  void tumunuTemizle() {
    List<List> listeler = [ResultList.indexList, ResultList.resultList, ResultList.birinciIsimList];
    for (var list in listeler) {
      for (int i = 0; i < list.length; i++) {
        list[i].clear();
        ResultList.totalList[i] = 0.0;
      }
    }
    ResultList.isSCIBirinciIsim.clear();
    notifyListeners();
  }
}
