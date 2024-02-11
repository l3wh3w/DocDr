import 'package:docdr/pages/ana_widget.dart';
import 'package:docdr/pages/basvuru_sartlari.dart';
import 'package:docdr/pages/a_giris_sayfasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              foregroundColor: Colors.indigo[800],
              backgroundColor: Colors.grey[100], // Buton metin rengi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Butonun kenar yuvarlaklığı
              ),
            )),
            bottomAppBarTheme: const BottomAppBarTheme(color: Color.fromARGB(255, 232, 236, 236)),
            appBarTheme: const AppBarTheme(
              color: Color(0xff00a896),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
            )),
        darkTheme: ThemeData.dark().copyWith(
            appBarTheme: AppBarTheme(
          color: Theme.of(context).hintColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        )),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const GirisSayfasi(),
          '/basvuru_sartlari': (context) => const BasvuruSartlari(),
          '/ana_widget': (context) => const AnaWidget(),
        });
  }
}
