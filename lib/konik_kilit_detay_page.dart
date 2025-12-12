// lib/konik_kilit_detay_page.dart

import 'package:flutter/material.dart';
import 'main.dart';
import 'pdf_viewer_page.dart';

class KonikKilitDetayPage extends StatelessWidget {
  final String title;       // Örn: KB-100
  final String description; // Ürün açıklaması
  final String imagePath;   // Örn: assets/kb_100.png

  const KonikKilitDetayPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasPdf = title == 'KB-100'; // Şimdilik sadece KB-100 için PDF var

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konik Kilit - $title',
          style: const TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
                  border: Border.all(color: kAccentColor, width: 1),
                  color: Colors.white,
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 60,
                        color: kPrimaryColor,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            // BAŞLIK
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),

            const SizedBox(height: 16),

            // AÇIKLAMA METNİ
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),

            const SizedBox(height: 24),

            // SADECE KB-100 İÇİN PDF KATALOĞU BUTONU
            if (hasPdf) ...[
              const Divider(
                height: 32,
                color: kAccentColor,
              ),
              const Text(
                'KATALOG',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PdfViewerPage(
                          assetPath: 'assets/KB-100.pdf',
                          appBarTitle: 'KB-100 Kataloğu',
                          productTitle: title,
                          imagePath: imagePath,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text('KB-100 PDF KATALOĞU'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: kBackgroundColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 14,
                    ),
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
            ],
          ],
        ),
      ),
    );
  }
}
