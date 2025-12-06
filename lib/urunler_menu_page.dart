// lib/urunler_menu_page.dart - SON VE KESİN BAĞLANTI VERSİYONU

import 'package:flutter/material.dart';
import 'main.dart'; 
import 'kaplinler_page.dart';
import 'disliler_page.dart'; 
// KRİTİK BAĞLANTI NOKTASI: Bu dosyanın adı doğru olmalı.
import 'motor_gergi_raylari_page.dart'; 

class UrunlerMenuPage extends StatelessWidget {
  const UrunlerMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ÜRÜN KATEGORİLERİ', style: TextStyle(color: kBackgroundColor)),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Tüm Ürün Grupları',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kAccentColor),
            ),
            const Divider(color: kPrimaryColor, thickness: 2, height: 30),

            _buildMenuButton(
              context,
              title: 'KAPLİNLER',
              imagePath: 'assets/kaplin_ana.png',
              targetPage: const KaplinlerPage(),
            ),
            
            _buildMenuButton(
              context,
              title: 'PİNYON DİŞLİLER',
              imagePath: 'assets/pinyon_ana.png',
              targetPage: const DislilerPage(),
            ),

            _buildMenuButton(
              context,
              title: 'TRİGER KASNAKLAR',
              imagePath: 'assets/triger_kasnaklar_ana.png',
              targetPage: const KaplinlerPage(), 
            ),

            // 4. MOTOR GERGİ RAYLARI - KRİTİK BUTON
            _buildMenuButton(
              context,
              title: 'MOTOR GERGİ RAYLARI',
              // KRİTİK ÇAĞRI: 'ı' yerine 'i' kullanılmalı.
              imagePath: 'assets/motor_gergi_rayi.png', 
              targetPage: const MotorGergiRaylariPage(), 
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context, {
    required String title,
    required String imagePath,
    required Widget targetPage,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          // BUTON TIKLAMASI BURADA GERÇEKLEŞİR
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Görsel Alanı (Bu kısım hatayı tetikleyebilir)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Text(
                        'Resim Eksik: ${title}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
              
              // Başlık Alanı
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: kAccentColor, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}