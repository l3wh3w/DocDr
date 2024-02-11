class Makaleler {
  static List<String> sCImak = [
    "Q1",
    "Q2",
    "Q3",
    "Q4",
    "b) AHCI kapsamındaki dergide yayımlanmış makale",
    "c) ESCI veya Scopus kapsamındaki dergide yayımlanmış makale",
    "d) Diğer uluslararası indekslerde taranan dergide yayımlanınış makale",
    "e) Bu maddenin a, b, c veya d bentleri kapsamındaki dergide yayımlanmış \n editöre mektup, araştırma notu, özet veya kitap kritiği",
    "f) a bendi kapsamındaki dergilerde yayımlanmış vakta takdimi"
  ];
  static List<int> sCIpuan = [30, 20, 15, 10, 20, 10, 3, 5, 3];

  static List<String> ulusalMak = [
    "a) TR Dizin kapsamındaki dergide yayımlanmış makale(editöre mektup, araştırma notu, özet veya kitap kritiği hariç)",
    "b) Diğer hakemli dergide yayımlanmış makale (editör mektup, araştırma notu, özet veya kitap kritiği hariç)",
    "c) Diğer hakemli dergide yayımlanmış editöre mektup, araştırma notu, özet veya kitap kritiği"
  ];
  static List<int> ulusalPuan = [20, 10, 3, 5, 3];

  static List<String> tezMak = [
    "a) SCIE, SSCI veya AHCI kapsamındaki dergide yayımlanmış makale",
    "b) ESCİ veya Scopus kapsamındaki dergide yayımlanmış makale",
    "c) Diğer uluslararası indekslerde taranan dergide yayımlanmış makale",
    "d) TR Dizin kapsamındaki dergide yayımlanmış makale",
    "e) BKCI kapsamındaki kitap",
    "f) BKCI kapsamındaki kitapta bölüm",
    "g) Diğer uluslararası/ulusal kitap",
    "h) Diğer uluslararası/ulusal kitapta bölüm",
    "ı) Uluslararası bilimsel toplantıda sunulan tam metni/özeti CPCI'da basılı/elektronik olarak yayımlanmış çalışma",
    "i) Diğer uluslararası/ulusal bilimsel toplantıda sunulan tam metni/özeti, basılı/elektronik olarak yayımlanmış çalışma"
  ];
  static List<int> tezPuan = [20, 10, 5, 8, 20, 10, 5, 3, 3, 2];

  static List<String> kitapMak = [
    "a) BKCI kapsamındaki kitap",
    "b) BKCI kapsammdaki kitapta bölüm",
    "c) Diğer uluslararası/ulusal kitap",
    "d) Diğer uluslararası/ulusal kitapta bölüm",
  ];
  static List<int> kitapPuan = [20, 10, 5, 3];

  static List<String> atifMak = [
    "a) SCIE, SSCJ, AHCI, ESCİ veya Scopus kapsamında yapılan atıf",
    "b) BKCI kapsamındaki kitapta yapılan atıf",
    "c) TR Dizin kapsamındaki dergide yapılan atıf",
    "d) Diğer uluslararası/ulusal kitap veya dergide yapılan atıf"
  ];
  static List<int> atifPuan = [3, 2, 2, 1];

  static List<String> danismanlikMak = ["a) Doktora tezi", "b) Yüksek lisans tezi"];
  static List<int> danismanlikPuan = [5, 3];

  static List<String> bapMak = [
    "Koordinatör/yürütücü olmak",
    "Araştırmacı olmak",
    "Danışman olmak",
    "b) Başarı ile tamamlanmış uluslararası destekli bilimsel araştırma projesinde (derleme ve rapor hazırlama çalışmaları hariç) yürütücü/araştırmacı danışman olmak",
    "c) Üniversiteler dışındaki kamu kurumu/özel kuruluşla yapılan başarı ile tamamlanmış Ar-Ge/Ür-Ge'ye dayalı bilimsel araştırma projesinde yürütücü/araştırmacı/danışman olmak",
    "d) Başarı ile tamamlanmış üniversitedeki BAP projesinde (tez ve uzmanlık projeleri hariç) yürütücü olmak"
  ];
  static List<int> bapPuan = [15, 10, 5, 10, 5, 3];
  static List<String> toplantiMak = [
    "a) Uluslararası bilimsel toplantıda sunulan tam metni/özeti CPCI'da basılı/elektronik olarak yayımlanmış çalışma",
    "b) Diğer uluslararası/ulusal bilimsel toplantıda sunulan tam metni/özeti, basılı/elektronik olarak yayımlanmış çalışma(Diğer uluslararası/ulusal bilimsel toplantının düzenleme komitesinde, kurum/tüzel kişilik/karar organı tarafindan resmi olarak görevlendirilmiş  üniversite/enstitü/bilimsel kurum/branş derneği akademisyen temsilcisi bulunması zorunludur.)"
  ];
  static List<int> toplantiPuan = [5, 3];

  static List<String> egitimMak = [
    "a) Dönemlik programlarda dört farklı yarıyılda lisans/lisansüstü ders vermiş olmak",
    "b) Yıllık programlarda iki farklı yılda lisans/lisansüstü ders vermiş olmak"
  ];
  static List<int> egitimPuan = [1, 1];

  static List<String> patentMak = [
    "a) Tescil edilmiş uluslararası patent",
    "b) Tescil edilmiş ulusal patent",
    "c) Tescil edilmiş faydalı model",
    "d) Kişisel patent başvurusunda bulunmuş olmak"
  ];
  static List<int> patentPuan = [20, 10, 5, 2];

  static List<String> odulMak = [
    "a) YÖK Yılın Doktora Tezi ödülü",
    "b) YÖK Üstün Başarı ödülü",
    "c) TÜBİTAK Bilim ödülü",
    "d) TÜBİTAK Teşvik ödülü (UBYT ödülü hariç)",
    "e) TÜBA GEBİP ödülü",
    "f) TÜBA TESEP ödülü"
  ];

  static List<int> odulPuan = [25, 25, 25, 15, 5, 3];

  static List<String> editorlukMak = [
    " a) SCIE, SSCI, AHCI, ESCİ veya Scopus kapsamındaki dergide editörlük",
    "b) BKCI veya Scopus kapsamındaki kitapta editörlük",
    "c) TR Dizin kapsamındaki dergide editörlük"
  ];

  static List<int> editorlukPuan = [2, 1, 1];

  static List<String> digerMak = [
    "a) Web of Science'a göre h-indeksi en az 5 olmak",
    "b) YÖK'ün kabul ettiği sıralama kuruluşlarının herhangi birinde yer alan ilk 300 üniversitede kesintisiz en az altı ay yurt dışı araştırma veya öğretim faaliyetinde bulunmuş olmak"
  ];

  static List<int> digerPuan = [5, 5];
}

class Yazilar {
  static String sCIMak = "a) SCIE veya SSCI kapsamındaki dergide yayımlanmış makale";
  static String ulusalMak = "Adayın hazırladığı lisansüstü tezlerden üretilmemiş olmak kaydıyla;";
  static String tezMak = "Adayın hazırladığı lisansüstü tezleriyle ilgili olmak kaydıyla,";
  static String kitapMak = "Adayın hazırladığı lisansüstü tezlerden üretilmemiş olmak kaydıyla;";
  static String atifMak = "Adayın eserlerinde;";
  static String danismanlikMak = "Adayın danışmanlığını yürüttüğü tamamlanmış;";
  static String bapMak =
      "a) Başarı ile tamamlanmış AB Çerçeve Programı/ TÜBİTAK (öğrenci projesi hariç) bilimsel araştırma projesinde";
  static String toplantiMak = "Adayın hazırladığı lisansüstü tezlerden üretilmemiş olmak kaydıyla;";
  static String egitimMak = "Doktora veya uzmanlık eğitimini tamamladıktan sonra,";
  static String girisYazisi =
      'Bu uygulama, Sağlık Bilimleri alanında doçentlik başvurusu yaparken kullanılan puan hesaplama işlemini kolaylaştırmak için tasarlanmıştır.';
}

class Basliklar {
  static String sartlar = "Şartlar";

  static List<String> basliklarList = [
    "1. Uluslararası Makale",
    "2. Ulusal Makale",
    "3. Tezlerden Üretilmiş Yayın",
    "4. Kitap",
    "5. Atıf",
    "6. Lisansüstü Tez Danışmanlığı ",
    "7. Bilimsel Araştırma Projesi",
    "8. Bilimsel Toplantı",
    "9. Eğitim-Öğretim",
    "10. Patent/Faydalı Model",
    "11. Ödül",
    "12. Editörlük",
    "13. Diğer",
    "Sonuç Sayfası"
  ];

  static List<String> sonucBasliklar = [
    "Toplam makale sayısı",
    "Birinci isim olunan makale sayısı",
    "SCI makale sayısı",
    "Toplam kitap sayısı",
    ...basliklarList.where((item) => item != "Sonuç Sayfası").toList()
  ];
}

class Sartlar {
  static List<String> sCISart = [
    "- Bu madde kapsamında, doktora unvanının alınmasından sonra, a bendinden en az üç makalede başlıca yazar olmak kaydıyla en az 40 puan almak zorunludur.\n- Q: Web of Science Journal Impact Factor (JIF) Quartile",
    "- Doktora unvanının alınmasından sonra, ikisi bu maddenin a bendinden olmak üzere en az üç yayın yapmak ve bu yayınlardan en az ikisinde başlıca yazar olmak zorunludur. \n- Yabancı uyruklu adaylar ve yurtdışı doçentlik denkliği başvurusu yapan adaylar, TR Dizin tarafından taranan uluslararası hakemli dergilerde yayımlanmış makale koşulunu sağlayamamaları durumunda, bunun yerine aynı sayıdaki yayını, bu maddenin a, b veya c bentleri kapsamında yapmış olmaları şartı aranacaktır.",
    "- Bu maddenin a-h bentleri kapsamında en az bir yayın zorunludur. \n- Bu maddeden en fazla 20 puan alınabilir. \n- Bu maddenin g veya h bentlerinden toplamda en fazla 5 puan alınabilir.\n- Bu maddenin h bendi kapsamında YÖKSİS veri tabanına kayıtlı olan ve editörlük için üniversitesinden resmi izin almış Profesör unvanlı öğretim üyelerinin editör olduğu kitap kabul edilir.",
    "- Bu maddeden en fazla 20 puan alınabilir. \n- Bu maddenin c veya d bentlerinden toplamda en fazla 5 puan alınabilir.\n- Bu maddenin d bendi kapsamında YÖKSİS veri tabanına kayıt olan ve editörlük için üniversitesinden resmi izin almış Profesör unvanlı öğretim üyelerinin editör olduğu kitap kabul edilir. \n- Bu madde kapsamında, sadece ders kitabı dışındaki özgün bilimsel kitaplar ve aynı kitaptaki bölümlerden sadece biri puanlanabilir. Yayınlanan kitabın tüm bölümleri başvurulan doçentlik bilim alanı ile ilgili olmak zorundadır.",
    "- Bu madde kapsamında, doktora unvanının alınmasından sonra yapılmış yayınlardan en az 5 puan almak zorunludur. \n- Bu maddeden en fazla 10 puan alınabilir.\n- Bu madde kapsamında adayın kendi eserlerine yaptığı atıflar değerlendirmeye alınmaz.\n- Adayın bir eserine aynı yayında yapılan birden fazla atıf tek atıf sayılır.",
    "- Bu maddeden en fazla 10 puan alınabilir. \n- İkinci/eş danışman olması durumunda; asıl danışman a ve b bentleri için öngörülen puanların tamamını, ikinci danışman ise yarısını alır.",
    "- Bu maddeden en fazla 20 puan alınabilir.",
    "- Bu madde kapsamında, doktora unvanının alınmasından sonra yapılmış çalışmalardan en az 5 puan almak zorunludur. \n- Bu maddeden en fazla 10 puan alınabilir. \n- Aynı bilimsel toplantıda sunulan en fazla bir çalışma puanlanabilir.",
    "- Bu madde kapsamında en az 2 puan almak zorunludur. \n- Bu maddeden en fazla 6 puan alınabilir. \n- Doktora veya eşdeğeri uzmanlık unvanının alınmasından sonra, yükseköğretim kurumlarında en az 2 yıl kadrolu öğretim elemanı olarak görev yapanlar 2 puan almış sayılır.",
    "- Patentlerde puan kişi sayısına bölünür.",
    "- Bu maddeden en fazla 25 puan alınabilir.",
    "- Bu maddeden en fazla 4 puan alınabilir.",
    "- Bu maddeden en fazla 10 puan alınabilir.\n- YÖK'ün kabul ettiği sıralama kuruluşları: Academic Ranking of World Universities (AR W U), Centre for Science and Technology Studies (CWTS) Leiden Ranking, Quacquarelli Symonds (QS) World University Rankings, Times Higher Education (THE) World University Rankings, University Ranking by Academic Performance (URAP)",
  ];
}

class Isimler {
  static String birinciIsim = '1. İsim benim';
  static String icinciIsim = '1. İsim başkası';
  static String ucuncuIsim = 'Makalede 1. isim belirtilmemiş';
  static String asilDanisman = "Asıl Danışman";
  static String yardimciDanisman = "Yardımcı Danışman";
}
