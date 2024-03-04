import 'package:docdr/core/theme/color_schemes.g.dart';
import 'package:docdr/core/theme/theme.dart';
import 'package:docdr/view/pages/ana_widget.dart';
import 'package:docdr/view/pages/basvuru_sartlari.dart';
import 'package:docdr/view/pages/a_giris_sayfasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: const MaterialTheme(Typography.blackRedmond).light(),
        darkTheme: const MaterialTheme(Typography.blackRedmond).dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const GirisSayfasi(),
          '/basvuru_sartlari': (context) => const BasvuruSartlari(),
          '/ana_widget': (context) => const AnaWidget(),
        });
  }
}
