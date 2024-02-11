// introduction_page.dart

import 'package:docdr/product/custom_widget/text_box.dart';
import 'package:docdr/core/constant/static/kaydetme.dart';
import 'package:docdr/core/constant/static/makaleler.dart';
import 'package:docdr/core/constant/static/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({
    super.key,
  });

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  @override
  void initState() {
    super.initState();

    _loadData();
  }

  Future<void> _loadData() async {
    ResultList.load();
  }

  Future<void> _launchInBrowser(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Adres bulunamadı');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: Style.all8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(Yazilar.girisYazisi,
                        textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 20),
                    //
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ana_widget');
                      },
                      child: const Text('Hesaplama Sayfasına Git'),
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/basvuru_sartlari');
                      },
                      child: const Text('Başvuru Şartları'),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton.icon(
                icon: Image.asset(
                  "lib/assets/icons/sai.png",
                  width: 35, // Adjust the width as needed
                  height: 35, // Adjust the height as needed
                ),
                onPressed: () {
                  _launchInBrowser("www.saibilisim.com");
                },
                label: Text("Bilişim", style: ProjectStyle.projectTextStyle.copyWith(color: Colors.blue)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text("Copyright © 2023"),
            )
          ],
        ));
  }
}
