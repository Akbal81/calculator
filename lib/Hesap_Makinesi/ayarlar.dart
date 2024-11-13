import 'package:flutter/material.dart';

class ayarlar extends StatefulWidget {
  const ayarlar({super.key});

  @override
  State<ayarlar> createState() => ayarlarState();
}

class ayarlarState extends State<ayarlar> {


  void ksozlesme(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Kullanıcı Sözleşmesi"),
          content: Container(
            width: double.maxFinite,
            height: 480,
            child: SingleChildScrollView(
              child: Center(
                child: Text(
                  'Bu sözleşme, Multiple Jobs uygulamasının kullanım şartlarını belirler.                                                                         '
                      'Uygulamayı kullanarak, aşağıda belirtilen şartları kabul etmiş sayılırsınız.                                                               '
                      'Uygulama, herhangi bir dış kaynağa, servise veya sisteme erişim sağlamaz.                                                                  '
                      'Uygulama, yalnızca kullanıcıya hesaplama işlevi sunar ve başka bir hizmet veya veriye erişim hakkı vermez.                                 '
                      'Multiple Jobs uygulaması, kullanım sırasında meydana gelebilecek herhangi bir veri kaybı, bilgi sızıntısı veya zarardan sorumlu tutulamaz. '
                      'Uygulama, kullanıcı verilerini veya kişisel bilgileri toplamaz, saklamaz veya üçüncü şahıslarla paylaşmaz.                                 '
                      'Uygulamanın işleyişi ve işlevleri, yalnızca uygulama içindedir ve başka bir platformla veya hizmetle ilgili değildir.                      '
                      'Multiple Jobs uygulaması, bu sözleşmeyi zaman zaman güncelleyebilir.                                                                       '
                      'Güncellenmiş sözleşmeler kullanıcıların güncellemeleri kabul etmelerini kapsar.                                                            '
                      '                      Tüm Hakları saklıdr                                                                                                  '
                  ,style: TextStyle(fontFamily: 'Hand', fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void uhakkinda(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Kullanıcı Sözleşmesi"),
          content: Container(
            width: double.maxFinite,
            height: 480,
            child: SingleChildScrollView(
              child: Center(
                child: Text(
                  "Bu yaz tatilinde, Lise 2'yi bitirip 3. sınıfa geçmeye hazırlanan bir öğrenci olarak, kendinizi deneme amaçlı geliştirdiğiniz Multiple Jobs uygulamasını tanıtmaktan mutluluk duyuyorum. "
                      "Bu uygulama, çeşitli işlevleri bir araya getirerek kullanıcıların farklı ihtiyaçlarına cevap vermeyi amaçlıyor."
                      "Multiple Jobs uygulaması, şu an için dört ana bileşeni içeriyor:"
                      "• Terazi: Hassas ölçüm yapabilen bir terazi işlevi sunar. "
                      "Bu bileşen, yatayda 0, dikeyde 90 derece ve çaprazda uygun değerlerle hassas ölçüm yapmanızı sağlar."
                      "• Kronometre: Basit bir kronometre işlevi sunar. Kullanıcılar, zamanı ölçebilir, kayıt yapabilir ve bu kayıtları görüntüleyebilirler. "
                      "• Hesap Makinesi: Temel matematiksel işlemleri yapabileceğiniz bir hesap makinesi içerir. "
                      "Toplama, çıkarma, çarpma, bölme ve yüzde işlemleri desteklenir. Hesaplama geçmişini görüntüleyebilir ve temizleyebilirsiniz."
                      "• Özelleştirme Sayfası: Uygulamanın farklı bölümlerini kişiselleştirmenizi sağlar. "
                      "Kullanıcı arayüzünü ihtiyaçlarınıza göre ayarlayabilir ve çeşitli tercihlerinizi yapabilirsiniz."
                      "Bu uygulama, sadece hesaplama, ölçüm ve zaman yönetimi gibi işlevleri bir araya getirmekle kalmaz, "
                      "aynı zamanda kullanıcı deneyimini kişiselleştirme ve özelleştirme olanağı da sunar. "
                      "Deneme amaçlı geliştirdiğim bu uygulama, çeşitli işlevleri bir arada sunarak günlük yaşamı daha düzenli ve pratik hale getirmeyi hedefliyor.",
                  style: TextStyle(fontSize: 20, fontFamily: 'Hand'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void egecenler(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Emeği Geçenler",
            style: TextStyle(fontFamily: 'Courgette', fontSize: 25),
            textAlign: TextAlign.center,
          ),
          content: Container(
            width: double.maxFinite,
            height: 480,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Yazılım - Dizayn Tasarım",
                      style: TextStyle(fontFamily: 'Courgette', fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text("M. Vehbi Akbal",
                      style: TextStyle(fontFamily: 'Courgette', fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text("Yazılım Danışmanlığı",
                      style: TextStyle(fontFamily: 'Courgette', fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Chat GPT 3.0 - Google ",
                      style: TextStyle(fontFamily: 'Courgette', fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text("Yönetim Destek Ekibi",
                      style: TextStyle(fontFamily: 'Courgette', fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text("Ramazan Gökmen ",
                      style: TextStyle(fontFamily: 'Courgette', fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text("Yusuf Metin",
                      style: TextStyle(fontFamily: 'Courgette', fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void sirketimiz(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Firma Hakkında",
            style: TextStyle(fontFamily: 'Courgette', fontSize: 25),
            textAlign: TextAlign.center,
          ),
          content: Container(
            width: double.maxFinite,
            height: 480,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Misyonumuz : ",
                    style: TextStyle(fontFamily: 'Hand', fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Lideatech, finansal tecrübeleri ve teknolojik deneyimleri kullanarak finansal kuruluşlara fayda sağlamak, "
                        "müşteri deneyimlerini iyileştirmek, finansal okuryazarlığı artırmak ve kaynakların verimli kullanımını sağlamayı hedefler. "
                        "Ayrıca, yeni regülasyonlarla karşılaşan kurumlara ortak çözümler sunarak iş maliyetlerini düşürmeyi amaçlar.",
                    style: TextStyle(fontFamily: 'Courgette', fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Vizyon :",
                    style: TextStyle(fontFamily: 'Hand', fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Finans sektörünün dijital dönüşümünde aktif rol oynayan ekipler ile güncel teknolojileri birleştirerek, "
                        "finansal kuruluşların ihtiyaçlarına yönelik verimli ve kullanışlı çözümler üretmeyi hedefler. "
                        "Bu süreçte müşteri taleplerini ve beklentilerini dikkate alır.",
                    style: TextStyle(fontFamily: 'Courgette', fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Orta Vadeli Hedefler :",
                    style: TextStyle(fontFamily: 'Hand', fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Finansal kuruluşlar ve müşteri taleplerine uygun çözümler geliştirmek, "
                        "kullanışlı ve interaktif bir platform yaratmak, "
                        "tekrarlı iş maliyetlerini azaltmak ve finans kuruluşlarına hizmet sunan bir platform olmak.",
                    style: TextStyle(fontFamily: 'Courgette', fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  egecenler(context);
                },
                child: const Text('Emeği Geçenler', style: TextStyle(fontSize: 45)),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  sirketimiz(context);
                },
                child: const Text('Firma Hakkında', style: TextStyle(fontSize: 45)),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  ksozlesme(context);
                },
                child: const Text('K. Sözleşme', style: TextStyle(fontSize: 50)),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  uhakkinda(context);
                },
                child: const Text('Hakkında', style: TextStyle(fontSize: 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
