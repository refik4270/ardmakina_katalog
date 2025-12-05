// lib/triger_detay_page.dart

import 'package:flutter/material.dart';
import 'main.dart';

/// Diğer sayfalarda da kullanılan seri grup modeli
class SeriGrup {
  final String baslik;
  final List<String> seriler;
  final String altBaslik;

  const SeriGrup({
    required this.baslik,
    required this.seriler,
    required this.altBaslik,
  });
}

/// Burçlu triger kasnaklar için ortak açıklama metni
const String kBurcluAciklama = '''
Burçlu triger dişliler HTD ve STD çeşitlerinde imal edilmektedir.
İçerisine takılan konik burçla istenilen mil çapına göre kolayca monte 
ve demonte edilebilir. Ayrıca delik işleme, kama kanalı açma gibi 
işlemler yapılmaz. Salgısız ve balanssız olarak monte edilebilir.

Standart olarak aşağıdaki genişliklerde imal edilmektedir.
''';

/// Pilot / Plot delikli kasnaklar için,
// seriye göre dinamik açıklama metni üreten fonksiyon
String pilotAciklama(String seriAdi) => '''
${seriAdi.toUpperCase()} hatveli plot delikli triger dişliler flanşlı ve flanşsız olarak imal edilmektedir.
Alüminyum ve çelik malzemeden imal edilebilir. 
Çok küçük çaplarda imal edilebildiği için servo motor, step motorlarda yoğun olarak kullanılmaktadır.
Standart üretimin yanında özel imalat da yapılabilmektedir. 
Detaylı bilgi için teknik kataloğumuzu inceleyebilirsiniz.

Standart olarak kayış genişliğine göre imal edilen başlıca ölçüler:
''';

class TrigerDetayPage extends StatelessWidget {
  final String tipAdi;  // "Burçlu Triger Kasnaklar" veya "Pilot Delikli Triger Kasnaklar"
  final String seriAdi; // "3M", "5M", "XL", "T10" vb.

  const TrigerDetayPage({
    super.key,
    required this.tipAdi,
    required this.seriAdi,
  });

  bool get _isBurclu => tipAdi == 'Burçlu Triger Kasnaklar';
  bool get _isPilot  => tipAdi == 'Pilot Delikli Triger Kasnaklar';

  /// Ekranda kullanılacak büyük başlık
  String get _baslik {
    if (_isBurclu) {
      return '$seriAdi BURÇLU TRİGER KASNAKLAR';
    } else if (_isPilot) {
      return '$seriAdi PLOT DELİKLİ TRİGER KASNAKLAR';
    } else {
      return '$seriAdi Serisi';
    }
  }

  /// Gösterilecek açıklama metni
  String get _aciklamaMetni {
    if (_isPilot) {
      return pilotAciklama(seriAdi);
    } else {
      // Varsayılan olarak burçlu açıklaması
      return kBurcluAciklama;
    }
  }

  @override
  Widget build(BuildContext context) {
    // İleride PDF eklerken referans olması için
    final String katalogDosyaAdi =
        '${tipAdi.toLowerCase().replaceAll(' ', '_')}_${seriAdi.toLowerCase().replaceAll('.', '')}_teknik_detay.pdf';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _baslik,
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
            // Üst başlık
            Text(
              _baslik,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
            const SizedBox(height: 20),

            // Açıklama metni
            Text(
              _aciklamaMetni,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: kTextColor,
              ),
            ),

            const SizedBox(height: 30),

            // KATALOG bölümü
            Center(
              child: Column(
                children: [
                  const Text(
                    'KATALOG',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '$seriAdi katalog PDF\'i uygulama tamamlandığında eklenecektir.',
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
                        vertical: 15,
                      ),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Referans dosya adı: $katalogDosyaAdi',
              style: const TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
