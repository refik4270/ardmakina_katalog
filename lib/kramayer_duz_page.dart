// lib/kramayer_duz_page.dart

import 'package:flutter/material.dart';
import 'main.dart';

class KramayerDuzPage extends StatelessWidget {
  const KramayerDuzPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Düz Kramayer Dişliler",
          style: TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Ürün görseli
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/krm2.png",
                height: 240,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "Düz kramayer dişliler, dişlerin paralel olması sayesinde daha düşük "
              "sürtünme, daha sessiz çalışma ve daha hassas pozisyonlama sağlar. "
              "Genel makine uygulamalarında en çok tercih edilen kramayer tipidir.",
              style: TextStyle(fontSize: 16, height: 1.4),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // PDF Butonu
            _pdfButton(),
          ],
        ),
      ),
    );
  }

  Widget _pdfButton() {
    return Column(
      children: [
        const Text(
          "KATALOG",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            foregroundColor: kBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: () {},
          icon: const Icon(Icons.picture_as_pdf),
          label: const Text(
            "Katalog (PDF) - Yakında",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
