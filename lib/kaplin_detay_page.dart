// lib/kaplin_detay_page.dart - GARANTİ YÖNTEM (Hazır Resim Yolunu Kullanır)

import 'package:flutter/material.dart';
import 'main.dart'; // Renkler için

class KaplinDetayPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath; // Artık resim yolunu dışarıdan alıyoruz

  const KaplinDetayPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath, // Zorunlu alan
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ GÖRSEL ALANI
            _buildProductImage(context),
            const SizedBox(height: 20),

            // 📑 BAŞLIK
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
            const Divider(color: kPrimaryColor, thickness: 2, height: 20),
            
            // 📝 AÇIKLAMA METNİ
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 30),

            // 🔗 KATALOG BUTONU
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$title katalog (PDF) yakında eklenecektir.'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Katalog (PDF)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: kBackgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: kAccentColor, width: 1),
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Image.asset(
          imagePath, // Doğrudan gelen adresi kullanıyoruz
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200], 
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.broken_image, size: 50, color: kPrimaryColor),
                      const SizedBox(height: 8),
                      const Text(
                        'Görsel Yüklenemedi!',
                        style: TextStyle(color: kAccentColor, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Aranan: ${imagePath.split('/').last}',
                        style: const TextStyle(color: kTextColor, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}