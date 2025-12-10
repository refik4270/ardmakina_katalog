// lib/zincir_detay_page.dart

import 'package:flutter/material.dart';
import 'main.dart';

class ZincirDetayPage extends StatelessWidget {
  final String code; // Örn: 06B, 08B, 10B...

  const ZincirDetayPage({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zincirler - $code',
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
            // ÜST GÖRSEL
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
                  'assets/zncr1.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'zncr1.png bulunamadı',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Bu zincirler, zorlu çalışma koşullarında bile üstün dayanıklılık ve güvenilirlik '
              'sunarak tahrik ve konveyör uygulamalarınızın verimliliğini en üst düzeye çıkarır. '
              'Projeleriniz için ideal, uzun ömürlü çözümlerimizle tanışın.',
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
                        'Zincir kataloğu PDF bağlantısı henüz eklenmedi.',
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
