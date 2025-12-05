// lib/triger_seriler_page.dart

import 'package:flutter/material.dart';
import 'main.dart';
import 'triger_detay_page.dart'; // SeriGrup ve TrigerDetayPage için

class TrigerSerilerPage extends StatelessWidget {
  final String title;                     // Örn: "Burçlu Triger Kasnaklar"
  final List<SeriGrup> seriGruplari;      // HTD, WHITWORTH vb. grup listesi

  const TrigerSerilerPage({
    super.key,
    required this.title,
    required this.seriGruplari,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: kBackgroundColor)),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title Serileri',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
            const SizedBox(height: 16),

            // Tüm Seri Gruplarını göster
            ...seriGruplari.map((grup) => _buildSeriGrup(context, grup)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSeriGrup(BuildContext context, SeriGrup grup) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${grup.baslik} ${grup.altBaslik}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(height: 8),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: grup.seriler.map((seri) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrigerDetayPage(
                      tipAdi: title,
                      seriAdi: seri,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kAccentColor,
                foregroundColor: kBackgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                seri,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 32),
      ],
    );
  }
}
