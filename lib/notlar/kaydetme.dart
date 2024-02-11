import 'package:docdr/notlar/sayfa_listesi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ResultList {
  static List<List<double>> resultList = List.generate(SayfaListesi.stringSayfa.length, (_) => []);

  static List<double> totalList = List.generate(SayfaListesi.stringSayfa.length, (_) => 0.0);

  static List<List<int>> birinciIsimList =
      List.generate(SayfaListesi.ikinciSayfaIndex + 1, (_) => []);

  static List<List<int>> indexList = List.generate(SayfaListesi.dorduncuSayfaIndex + 1, (_) => []);

  static List<int> isSCIBirinciIsim = [];

  static save() async {
    final prefs = await SharedPreferences.getInstance();

    // ResultList class lists are converted to JSON strings and saved
    prefs.setString('resultList', json.encode(resultList));
    prefs.setString('totalList', json.encode(totalList));
    prefs.setString('birinciIsimList', json.encode(birinciIsimList));
    prefs.setString('indexList', json.encode(indexList));

    for (int i = 0; i < isSCIBirinciIsim.length; i++) {
      prefs.setInt('isSCIBirinciIsim$i', isSCIBirinciIsim[i]);
    }
  }

  static load() async {
    final prefs = await SharedPreferences.getInstance();

    final resultString = prefs.getString('resultList');
    final totalString = prefs.getString('totalList');
    final birinciIsimString = prefs.getString('birinciIsimList');
    final indexString = prefs.getString('indexList');

    if (resultString != null) {
      var decodedResult = json.decode(resultString);
      if (decodedResult is List) {
        // Eğer JSON bir liste ise
        resultList = decodedResult.map((list) {
          if (list is List) {
            return list.map((value) {
              if (value is num) {
                return value.toDouble();
              } else {
                return 0.0; // Varsayılan değer veya hata işleme
              }
            }).toList();
          } else {
            return <double>[]; // Varsayılan değer veya hata işleme
          }
        }).toList();
      } else {
        resultList = <List<double>>[]; // Varsayılan değer veya hata işleme
      }
    }
    if (totalString != null) {
      var decodedTotal = json.decode(totalString);
      if (decodedTotal is List) {
        totalList = decodedTotal.cast<num>().map((value) => value.toDouble()).toList();
      } else {
        totalList = <double>[]; // Varsayılan değeri veya hata işleme
      }
    }
    if (birinciIsimString != null) {
      var decodedBirinciIsim = json.decode(birinciIsimString);
      if (decodedBirinciIsim is List) {
        birinciIsimList = decodedBirinciIsim.map((list) {
          if (list is List) {
            return list.cast<int>().toList();
          } else {
            return <int>[];
          }
        }).toList();
      } else {
        birinciIsimList = List.generate(SayfaListesi.ikinciSayfaIndex + 1, (_) => []);
      }
    }

    if (indexString != null) {
      var decodedIndex = json.decode(indexString);
      if (decodedIndex is List) {
        indexList = decodedIndex.map((list) {
          if (list is List) {
            return list.cast<int>().toList();
          } else {
            return <int>[];
          }
        }).toList();
      } else {
        indexList = List.generate(SayfaListesi.dorduncuSayfaIndex + 1, (_) => []);
      }
    }

    for (int i = 0; i < isSCIBirinciIsim.length; i++) {
      final isSCIBirinciIsimValue = prefs.getInt('isSCIBirinciIsim$i');
      if (isSCIBirinciIsimValue != null) {
        isSCIBirinciIsim.add(isSCIBirinciIsimValue);
      }
    }
  }
}
