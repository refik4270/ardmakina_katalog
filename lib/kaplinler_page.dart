// lib/kaplinler_page.dart

import 'package:flutter/material.dart';
import 'main.dart';

const String kKaplinGenelAciklama = '''
Kaplinler, güç iletiminde yüksek performans ve güvenilirlik sağlayan bir mekanik bağlantı elemanıdır. Endüstriyel uygulamalarda motor–redüktör–makine arasında titreşimi azaltmak, hizalama toleranslarını karşılamak ve verimli güç aktarımı sağlamak için tercih edilir.
Standart ölçülerde üretilebildiği gibi özel taleplere göre imalat da yapılabilmektedir. Detaylı teknik bilgiler için kataloğumuza göz atabilirsiniz.
''';

const List<String> kKaplinCesitleri = [
  'Pernolu Kaplinler',
  'HRC Yıldız Kaplinler',
  'Yıldız Kaplinler',
  'Alüminyum Kaplinler',
  'DK Kaplinler',
  'Teker Kaplinler',
  'Disk Kaplinler',
];

class KaplinlerPage extends StatelessWidget {
  const KaplinlerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'KAPLINLER',
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
            const SizedBox(height: 10),
            Text(
              kKaplinGenelAciklama,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Kaplin Çeşitlerimiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 12),

            Column(
              children: kKaplinCesitleri.map((adi) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kAccentColor,
                        foregroundColor: kBackgroundColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                KaplinDetayPage(kaplinAdi: adi),
                          ),
                        );
                      },
                      child: Text(
                        adi,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Her kaplin tipi için özel açıklama metnini döndürür
String _getKaplinAciklama(String kaplinAdi) {
  switch (kaplinAdi) {
    case 'Yıldız Kaplinler':
      return '''
Yıldız kaplinler 2 adet döküm erkek parçadan ve 1 adet kauçuk lastikten oluşurlar. Kauçuk kısım kaplinin dışından da gözüktüğü için deforme olup olmadığı hemen tespit edilebilmektedir. Ayaklar tam olarak kauçuk lastiklere göre işlendiğinden dolayı boşluk yapmaz. Fiyat olarak diğer kaplinlerden daha ucuz ve yaygın olması sebebi ile makine imalatçılarının sık kullandığı bir kaplin tipidir.
''';

    case 'HRC Yıldız Kaplinler':
      return '''
HRC yıldız kaplinler 2 adet döküm ve 1 adet elastik parçadan oluşmaktadır. Elastik parçalar kauçuk ve poliüretan olarak takılabilmektedir. Çok büyük güç iletebilme özelliğine sahiptir. Konik burçlu olarak ve dolu göbekli olarak imal edilebilmektedir.
''';

    case 'Pernolu Kaplinler':
      return '''
Pernolu kaplinler çok büyük güç aktaran kaplin çeşitlerindendir. Genellikle ağır sanayi, şeker fabrikaları, çimento fabrikaları, vinç vb. gibi sektörlerde kullanılmaktadır. Demontaj yapılmadan pim ve elastik kısımlar değiştirilebilmektedir. Demontaj yapılmadan pim ve elastik kısımdaki deformasyonlar görülebilmektedir. Elastik kısımlar kauçuk ve poliüretan olarak takılabilir.
''';

    case 'Disk Kaplinler':
      return '''
Disk kaplinler 2 adet çelik parçadan ve 1 takım krom nikel sacdan oluşmaktadır. Çok zor bakım yapılan yerlerde kullanılmaktadır. Disk kaplin motor gücü ve devire göre kullanıldığı takdirde makine ömrüne eşit bir kaplin çeşididir. Kaplinden dolayı makineye arıza vermez. Krom nikel sac takımı ile paslanma olmaz, işlevini yitirmez.
''';

    case 'Teker Kaplinler':
      return '''
Teker kaplinler emniyet amaçlı kullanılmaktadır. Doğrusal kaçıklıkları alır. Toplamda 4 parça çelik malzemeden ve 1 adet elastikten oluşmaktadır. Herhangi bir sıkışma veya arıza durumunda elastik parça parçalanarak diğer hareket aktarma elemanlarına zarar vermez.
''';

    case 'Alüminyum Kaplinler':
      return '''
Alüminyum kaplinler genellikle hassas aktarım yapılması gereken yerlerde kullanılır. Çoğunlukla DC–servo motor tiplerinde kullanılmaktadır. Boşluksuz çalıştıklarından dolayı aldığı hareketi birebir karşı tarafa iletebilmektedir. Küçük çaplarda, küçük mil çaplarına göre üretilmektedir.
''';

    case 'DK Kaplinler':
      return '''
İki adet aynı yapıda çelik dişli ve bir adet poliamid kovandan oluşur. Hidrolik pompalarda en sık kullanılan kaplin çeşitlerindendir. Sık dişleri sayesinde büyük montaj kolaylığı sağlar. Çalışma esnasında oluşabilecek bir arıza ve sıkışma durumunda elastik parça kırılarak sigorta görevi yapar, sistem durur. Kaplinin diğer parçalarına zarar gelmez. Vibrasyona uygun değildir, poliamid kovan sert yapıdadır ve vibrasyonu motora iletir.
''';

    default:
      // Her ihtimale karşı, tanımsız bir durum olursa genel açıklamaya düşer
      return kKaplinGenelAciklama;
  }
}

class KaplinDetayPage extends StatelessWidget {
  final String kaplinAdi;

  const KaplinDetayPage({super.key, required this.kaplinAdi});

  @override
  Widget build(BuildContext context) {
    final String aciklamaMetni = _getKaplinAciklama(kaplinAdi);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          kaplinAdi.toUpperCase(),
          style: const TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kaplinAdi,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
            const SizedBox(height: 16),

            // Teknik çizim / görsel alanı (ileride gerçek görsel eklenebilir)
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  '$kaplinAdi ile ilgili teknik çizim / görsel burada gösterilecektir.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Teknik Özellikler',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              aciklamaMetni,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: kTextColor,
              ),
            ),

            const SizedBox(height: 24),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '$kaplinAdi katalog PDF\'i uygulama tamamlandığında eklenecektir.',
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Katalog (PDF) - Yakında'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: kBackgroundColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 14,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
