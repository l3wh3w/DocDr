import 'package:docdr/view/pages/sayfa_1.dart';
import 'package:docdr/view/pages/sayfa_2.dart';
import 'package:docdr/view/pages/sayfa_3.dart';
import 'package:docdr/view/pages/sayfa_4.dart';
import 'package:docdr/view/pages/sayfa_5.dart';
import 'package:docdr/view/pages/sayfa_6.dart';
import 'package:docdr/view/pages/sayfa_7.dart';
import 'package:docdr/view/pages/sayfa_8.dart';
import 'package:docdr/view/pages/sayfa_9.dart';
import 'package:docdr/view/pages/sayfa_10.dart';
import 'package:docdr/view/pages/sayfa_11.dart';
import 'package:docdr/view/pages/sayfa_12.dart';
import 'package:docdr/view/pages/sayfa_13.dart';
import 'package:docdr/view/pages/sonuc_sayfasi.dart';
import 'package:flutter/material.dart';

class SayfaListesi {
  static int birinciSayfaIndex = SayfaListesi.stringSayfa.indexOf("BirinciSayfa");
  static int ikinciSayfaIndex = SayfaListesi.stringSayfa.indexOf("IkinciSayfa");
  static int ucuncuSayfaIndex = SayfaListesi.stringSayfa.indexOf("UcuncuSayfa");
  static int dorduncuSayfaIndex = SayfaListesi.stringSayfa.indexOf("DorduncuSayfa");
  static int besinciSayfaIndex = SayfaListesi.stringSayfa.indexOf("BesinciSayfa");
  static int altinciSayfaIndex = SayfaListesi.stringSayfa.indexOf("AltinciSayfa");
  static int yedinciSayfaIndex = SayfaListesi.stringSayfa.indexOf("YedinciSayfa");
  static int sekizinciSayfaIndex = SayfaListesi.stringSayfa.indexOf("SekizinciSayfa");
  static int dokuzuncuSayfaIndex = SayfaListesi.stringSayfa.indexOf("DokuzuncuSayfa");
  static int onuncuSayfaIndex = SayfaListesi.stringSayfa.indexOf("OnuncuSayfa");
  static int onbirinciSayfaIndex = SayfaListesi.stringSayfa.indexOf("OnbirinciSayfa");
  static int onikinciSayfaIndex = SayfaListesi.stringSayfa.indexOf("OnikinciSayfa");
  static int onucuncuSayfaIndex = SayfaListesi.stringSayfa.indexOf("OnucuncuSayfa");

  static List<Widget> widgetSayfa = [
    const BirinciSayfa(),
    const IkinciSayfa(),
    const UcuncuSayfa(),
    const DorduncuSayfa(),
    const BesinciSayfa(),
    const AltinciSayfa(),
    const YedinciSayfa(),
    const SekizinciSayfa(),
    const DokuzuncuSayfa(),
    const OnuncuSayfa(),
    const OnbirinciSayfa(),
    const OnikinciSayfa(),
    const OnucuncuSayfa(),
    const SonucSayfasi()
  ];

  static final List<String> stringSayfa = [
    "BirinciSayfa",
    "IkinciSayfa",
    "UcuncuSayfa",
    "DorduncuSayfa",
    "BesinciSayfa",
    "AltinciSayfa",
    "YedinciSayfa",
    "SekizinciSayfa",
    "DokuzuncuSayfa",
    "OnuncuSayfa",
    "OnbirinciSayfa",
    "OnikinciSayfa",
    "OnucuncuSayfa",
    "SonucSayfasi"
  ];
}
