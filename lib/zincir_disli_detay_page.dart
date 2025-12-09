// lib/zincir_disli_detay_page.dart

import 'package:flutter/material.dart';
import 'main.dart';

class ZincirDisliDetayPage extends StatelessWidget {
  final String code; // Örn: 06B, 08B, 10B...

  const ZincirDisliDetayPage({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zincir Dişliler - $code',
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
                  'assets/znc1.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'znc1.png bulunamadı',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Zincir dişlilere yüksek tork uygulanabilir ancak yüksek devirlerde '
              'kullanılamazlar ve çok gürültülüdürler. Bunların bir diğer dezavantajı '
              'gevşek tarafta zincirin sarkmasıdır. Sarkmayı gidermek için genellikle '
              'gerdirme dişlileri kullanılır.',
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
                  // İleride PDF açma işlemi eklenecek
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: Text('Katalog (PDF) - $code'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: kBackgroundColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
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
