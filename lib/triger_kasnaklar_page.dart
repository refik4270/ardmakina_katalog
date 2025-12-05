// lib/triger_kasnaklar_page.dart

import 'package:flutter/material.dart';
import 'main.dart'; 
import 'triger_detay_page.dart'; // SeriGrup için
import 'triger_seriler_page.dart'; // Dinamik seriler sayfası
import 'pilot_seriler_page.dart'; // Pilot delikli özel seriler sayfası

class TrigerKasnaklarPage extends StatelessWidget {
  const TrigerKasnaklarPage({super.key});

  // Burçlu kasnaklar için HTD ve Whitworth serilerini tanımlıyoruz.
  final List<SeriGrup> burcluSerileri = const [
    SeriGrup(baslik: 'HTD SERİSİ', seriler: ['5M', '8M', '14M'], altBaslik: '(Metrik)'),
    SeriGrup(baslik: 'WHITWORTH SERİSİ', seriler: ['L', 'H', 'XH'], altBaslik: '(İnç)'),
  ];
  
  Widget _buildProductCard(
      BuildContext context, 
      String title, 
      String imagePath, 
      Widget targetPage,
    ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath, 
              fit: BoxFit.contain,
              width: double.infinity, 
              height: 180, 
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 180,
                  color: Colors.grey[300],
                  child: Center(
                    child: Text(
                      'Görsel Yüklenemedi: $imagePath',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: kAccentColor),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => targetPage),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kAccentColor, 
              foregroundColor: kBackgroundColor, 
            ),
            child: const Text('Serileri ve Teknik Detayları Gör'),
          ),
        ),
        const SizedBox(height: 40), 
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Triger Kasnaklar', style: TextStyle(color: kBackgroundColor)),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor), 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Triger Kasnak Tipleri',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
            const SizedBox(height: 20),

            // 1. Burçlu Triger Kasnaklar
            _buildProductCard(
              context, 
              'Burçlu Triger Kasnaklar', 
              'assets/burclu_triger.png',
              TrigerSerilerPage(
                title: 'Burçlu Triger Kasnaklar',
                seriGruplari: burcluSerileri,
              ),
            ),

            // 2. Pilot Delikli Triger Kasnaklar
            _buildProductCard(
              context, 
              'Pilot Delikli Triger Kasnaklar', 
              'assets/pilot_triger.png',
              const PilotSerilerPage(title: 'Pilot Delikli Triger Kasnaklar'),
            ),
          ],
        ),
      ),
    );
  }
}
