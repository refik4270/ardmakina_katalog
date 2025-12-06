// lib/disliler_page.dart - KESİN ÇALIŞAN VERSİYON

import 'package:flutter/material.dart';
import 'main.dart'; 
import 'pinyon_modul_listesi_page.dart'; 

class DislilerPage extends StatelessWidget {
  const DislilerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PİNYON DİŞLİLER', style: TextStyle(color: kBackgroundColor)),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pinyon Dişli Tipleri',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
            const SizedBox(height: 20),

            // 1. DÜZ PİNYON BUTONU
            _buildProductCard(
              context,
              title: 'Düz Pinyon Dişliler',
              imagePath: 'assets/duz_pinyon_ana.png', 
              // Düz şifresini gönderiyoruz
              targetPage: const PinyonModulListesiPage(turKodu: 'duz'), 
            ),

            // 2. HELİS PİNYON BUTONU
            _buildProductCard(
              context,
              title: 'Helis Pinyon Dişliler',
              imagePath: 'assets/helis_pinyon_ana.png', 
              // Helis şifresini gönderiyoruz
              targetPage: const PinyonModulListesiPage(turKodu: 'helis'), 
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context, {
    required String title,
    required String imagePath,
    required Widget targetPage,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: kPrimaryColor),
        ),
        const SizedBox(height: 10),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Center(child: Text('Görsel Bekleniyor...', style: TextStyle(color: kAccentColor))),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => targetPage));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kAccentColor,
              foregroundColor: kBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text('Serileri ve Teknik Detayları Gör'),
          ),
        ),
        const SizedBox(height: 40), 
      ],
    );
  }
}