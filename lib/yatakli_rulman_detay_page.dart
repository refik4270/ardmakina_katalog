// lib/yatakli_rulman_detay_page.dart

import 'package:flutter/material.dart';
import 'main.dart';

class YatakliRulmanDetayPage extends StatelessWidget {
  final String code;

  const YatakliRulmanDetayPage({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    // Her ürün için kendi adına göre görsel:
    // Örn: UCP -> assets/ucp.png, UCF -> assets/ucf.png, UCPA -> assets/ucpa.png
    final String specificImagePath = 'assets/${code.toLowerCase()}.png';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yataklı Rulmanlar - $code',
          style: const TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // SADECE ÜRÜNE ÖZEL GÖRSEL
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: kAccentColor, width: 1),
                ),
                child: Image.asset(
                  specificImagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        '${specificImagePath.split('/').last} bulunamadı',
                        style: const TextStyle(color: kPrimaryColor),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Yataklı Rulmanlar, montaj kolaylığı ve sağlam gövde yapısıyla zorlu çalışma '
              'ortamlarında dahi mükemmel hizalama ve uzun ömür sunar. Bu entegre çözümler, '
              'şaft desteği ve korumayı birleştirerek makine ve konveyör sistemlerinizde hızlı '
              've güvenilir performans sağlar. İşletme kesintilerini en aza indiren, dayanıklı '
              'yatak çözümleri için kataloğumuzu inceleyin.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                'KATALOG',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Yataklı rulman kataloğu PDF bağlantısı henüz eklenmedi.',
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('PDF KATALOG'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: kBackgroundColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
