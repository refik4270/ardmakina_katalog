// lib/urunler_menu_page.dart

import 'package:flutter/material.dart';
import 'main.dart';

// Ürün grup sayfaları
import 'triger_kasnaklar_page.dart';
import 'kaplinler_page.dart';
import 'disliler_page.dart';
import 'motor_gergi_raylari_page.dart';
import 'konik_kilitler_page.dart';
import 'konik_burclar_page.dart'; // KONİK BURÇLAR SAYFASI

class UrunlerMenuPage extends StatelessWidget {
  const UrunlerMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ÜRÜN KATEGORİLERİMİZ',
          style: TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Text(
              'ÜRÜN KATEGORİLERİMİZ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 20),

            // TRİGER KASNAKLAR
            _buildMenuButton(
              context,
              title: 'Triger Kasnaklar',
              imagePath: 'assets/triger_kasnaklar_ana.png',
              targetPage: const TrigerKasnaklarPage(),
            ),

            // KAPLİNLER
            _buildMenuButton(
              context,
              title: 'Kaplinler',
              imagePath: 'assets/kaplin_ana.png',
              targetPage: const KaplinlerPage(),
            ),

            // PİNYON DİŞLİLER
            _buildMenuButton(
              context,
              title: 'Pinyon Dişliler',
              imagePath: 'assets/pinyon_ana.png',
              targetPage: const DislilerPage(),
            ),

            // MOTOR GERGİ RAYLARI
            _buildMenuButton(
              context,
              title: 'Motor Gergi Rayları',
              imagePath: 'assets/motor_gergi_rayi.png',
              targetPage: const MotorGergiRaylariPage(),
            ),

            // KONİK KİLİTLER
            _buildMenuButton(
              context,
              title: 'Konik Kilitler',
              imagePath: 'assets/konik_kilit.png',
              targetPage: const KonikKilitlerPage(),
            ),

            // KONİK BURÇLAR
            _buildMenuButton(
              context,
              title: 'Konik Burçlar',
              imagePath: 'assets/kbr1.png',
              targetPage: const KonikBurclarPage(),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => targetPage),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Üst görsel
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Alt başlık
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
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: kAccentColor,
                      size: 18,
                    ),
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
