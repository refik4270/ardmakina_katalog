// lib/kaplinler_page.dart - GARANTİ YÖNTEM (Resim Yolları Elle Girildi)

import 'package:flutter/material.dart';
import 'main.dart';
import 'kaplin_detay_page.dart';

const String kKaplinGenelAciklama = """
Kaplinler, güç iletiminde yüksek performans ve güvenilirlik sağlayan mekanik bağlantı elemanlarıdır. 
Endüstriyel uygulamalarda motor–redüktör–makine arasında titreşimi azaltmak, hizalama toleranslarını 
karşılamak ve verimli güç aktarımı sağlamak için tercih edilir.

Standart ölçülerde üretilebildiği gibi özel taleplere göre imalat da yapılmaktadır. 
Detaylı teknik bilgiler için kataloğumuza göz atabilirsiniz.
""";

// BURASI ARTIK RESİM YOLLARINI DA İÇERİYOR
const List<Map<String, String>> kKaplinTipleri = [
  {
    'title': 'Pernolu Kaplinler',
    'image': 'assets/pernolu_kaplinler.png', // Elle yazdık
    'description': '''
Pernolu kaplinler çok büyük güç aktaran kaplin çeşitlerindendir. Genellikle ağır sanayi, şeker fabrikaları, çimento fabrikaları, vinç vb. gibi sektörlerde kullanılmaktadır. Demontaj yapılmadan pim ve elastik kısımlar değiştirilebilmektedir.
''',
  },
  {
    'title': 'HRC Yıldız Kaplinler',
    'image': 'assets/hrc_yildiz_kaplinler.png', // Elle yazdık (İngilizce karakter)
    'description': '''
HRC yıldız kaplinler 2 adet döküm ve 1 adet elastik parçadan oluşmaktadır. Elastik parçalar kauçuk ve polüretan olarak takılabilmektedir. Çok büyük güç iletebilme özelliğine sahiptir.
''',
  },
  {
    'title': 'Yıldız Kaplinler',
    'image': 'assets/yildiz_kaplinler.png', // Elle yazdık (İngilizce karakter)
    'description': '''
Yıldız kaplinler 2 adet döküm erkek parçadan ve 1 adet kauçuk lastikten oluşurlar. Kauçuk kısım kaplinin dışından da gözüktüğü için deforme olup olmadığı hemen tespit edilebilmektedir.
''',
  },
  {
    'title': 'Alüminyum Kaplinler',
    'image': 'assets/aluminyum_kaplinler.png', // Elle yazdık (İngilizce karakter)
    'description': '''
Alüminyum kaplinler genellikle hassas aktarım yapılması gereken yerlerde kullanılır. Çoğunlukla DC–servo motor tiplerinde kullanılmaktadır. Boşluksuz çalıştıklarından dolayı aldığı hareketi birebir karşı tarafa iletebilmektedir.
''',
  },
  {
    'title': 'DK Kaplinler',
    'image': 'assets/dk_kaplinler.png', // Elle yazdık
    'description': '''
İki adet aynı yapıda çelik dişli ve bir adet poliamid kovandan oluşur. Hidrolik pompalarda en sık kullanılan kaplin çeşitlerindendir. Sık dişleri sayesinde büyük montaj kolaylığı sağlar.
''',
  },
  {
    'title': 'Teker Kaplinler',
    'image': 'assets/teker_kaplinler.png', // Elle yazdık
    'description': '''
Teker kaplinler emniyet amaçlı kullanılmaktadır. Doğrusal kaçıklıkları alır. Toplamda 4 parça çelik malzemeden ve 1 adet elastikten oluşmaktadır.
''',
  },
  {
    'title': 'Disk Kaplinler',
    'image': 'assets/disk_kaplinler.png', // Elle yazdık
    'description': '''
Disk kaplinler 2 adet çelik parçadan ve 1 takım krom nikel sactan oluşmaktadır. Çok zor bakım yapılan yerlerde kullanılmaktadır. Disk kaplin motor gücü ve devire göre kullanıldığı takdirde makine ömrüne eşit bir kaplin çeşididir.
''',
  },
];

class KaplinlerPage extends StatelessWidget {
  const KaplinlerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'KAPLİNLER',
          style: TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kaplinler Hakkında',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              kKaplinGenelAciklama,
              style: TextStyle(fontSize: 15, height: 1.4, color: kTextColor),
            ),
            const SizedBox(height: 24),

            const Text(
              'Kaplin Çeşitlerimiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 12),

            // Kaplin tipleri listesi
            ...kKaplinTipleri.map((item) {
              final title = item['title']!;
              final description = item['description']!;
              final imagePath = item['image']!; // Resim yolunu buradan alıyoruz

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccentColor,
                    foregroundColor: kBackgroundColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => KaplinDetayPage(
                          title: title,
                          description: description,
                          imagePath: imagePath, // Resmi karşı tarafa gönderiyoruz
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}