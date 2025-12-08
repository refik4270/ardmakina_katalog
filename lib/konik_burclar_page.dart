// lib/konik_burclar_page.dart

import 'package:flutter/material.dart';
import 'main.dart';

const String kKonikBurcAciklama = '''
Konik burçlar hareket aktarma elemanlarında kullanılacak olan kasnak veya dişli sistemlerinin
mile salgısız ve seri bir şekilde takılmasını sağlar. Boyutlarına göre değişik mil çaplarında
ve standart kama ölçülerinde imal edilir. Böylece dişli veya kasnakları ayrıca delik içi işleme,
kama kanalı açımı gibi işlemlerden kurtarır. Teknik özelliklerini kataloğumuzda bulabilirsiniz.
''';

class KonikBurclarPage extends StatelessWidget {
  const KonikBurclarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'KONİK BURÇLAR',
          style: TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Üstte konik burç görseli (kbr1.png)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: kAccentColor, width: 1),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/kbr1.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'kbr1.png bulunamadı',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Açıklama',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              kKonikBurcAciklama,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                'KATALOG',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 8),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // İleride PDF linki buraya eklenecek.
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Katalog (PDF) - Yakında'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: kBackgroundColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
