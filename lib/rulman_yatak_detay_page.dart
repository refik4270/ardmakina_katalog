// lib/rulman_yatak_detay_page.dart

import 'package:flutter/material.dart';
import 'main.dart';

class RulmanYatakDetayPage extends StatelessWidget {
  final String code; // "SNA" veya "SN"

  const RulmanYatakDetayPage({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    // SNA için sna1.png, SN için sn1.png
    final String imagePath =
        code.toUpperCase() == 'SNA' ? 'assets/sna1.png' : 'assets/sn1.png';

    final String description =
        code.toUpperCase() == 'SNA'
            ? 'SNA Rulman yatakları için kataloğumuzu inceleyebilirsiniz.'
            : 'SN Rulman yatakları için kataloğumuzu inceleyebilirsiniz.';

    final String titleText =
        code.toUpperCase() == 'SNA'
            ? 'SNA Rulman Yatakları'
            : 'SN Rulman Yatakları';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleText,
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
            // ÜST GÖRSEL (SNA veya SN)
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
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        '${imagePath.split('/').last} bulunamadı',
                        style: const TextStyle(color: kPrimaryColor),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              description,
              style: const TextStyle(fontSize: 16, height: 1.5),
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
                    SnackBar(
                      content: Text(
                        '$titleText kataloğu PDF bağlantısı henüz eklenmedi.',
                      ),
                      duration: const Duration(seconds: 2),
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
