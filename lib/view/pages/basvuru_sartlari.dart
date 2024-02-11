// introduction_page.dart

import 'package:flutter/material.dart';

class BasvuruSartlari extends StatelessWidget {
  const BasvuruSartlari({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> basvuruSart = [
      "- Sağlık Bilimleri temel alanından doçentliğe müracaat için; beyan edilen eserlerin ve akademik faaliyetlerin başvurulan bilim alanı ile ilgili olması ve bu çalışmaların en az doksan (90) puanın doktora unvanının alınmasından sonra gerçekleştirilen çalışmalardan Lisansüstü Tezlerden \"Üretilmiş Yayın\" başlığından alınan puanlar hariç elde edilmiş olması kaydıyla asgari iki yüz (200) puanın sağlanmış olması gerekir.",
      "- Yan dal uzmanlığından yapılan müracaatta, ana dal uzmanlığının alınmasından sonra yapılan çalışmalar esas alınır.",
      "- Her çalışma, Tablo 10'da sadece bir bölümde puanlandırılır.",
      "- Tek yazarlı makalelerde yazar tam puan alır. İki yazarlı makalelerde baş yazar tam puanın %80'ini, ikinci yazar ise %50'sini alır. Üç ve daha fazla yazarlı makalelerde ise baş yazar toplam puanın yarısını alır, diğer yazarlar ise diğer yarısını eşit paylaşır. Baş yazar belirtilmediği iki veya daha fazla yazarlı makalelerde toplam puan yazarlar arasında eşit olarak bölünür. Diğer yayınlarda ise toplam puan yazarlar arasında eşit olarak bölünür",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Başvuru Şartları'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 400,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: basvuruSart.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        child: ListTile(
                          title: Text(basvuruSart[index],
                              style: const TextStyle(fontSize: 15), textAlign: TextAlign.justify),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
