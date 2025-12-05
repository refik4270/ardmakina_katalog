// lib/urunler_menu_page.dart - GÜNCEL KOD

import 'package:flutter/material.dart';
import 'main.dart';
import 'triger_kasnaklar_page.dart';
import 'disliler_page.dart';
import 'kaplinler_page.dart';

// ------------------------------------------------------------------
// 📋 ÜRÜN LİSTESİ (TİCARİ ÖNCELİK SIRALAMASI)
// ------------------------------------------------------------------
const List<String> kUrunlerListesi = [
  'Triger Kasnaklar',
  'Kaplinler',
  'Pinyon Dişliler',
  'Motor Gergi Rayları',
  'Konik Kilitler',
  'Burçlu V Kasnaklar',
  'V Kasnaklar',
  'Konik Burçlar',
  'Mil Kamaları',
  'Kramayer Dişliler',
  'Zincir Dişliler',
  'Zincirler',
  'Rulman Yatakları',
  'Yataklı Rulmanlar',
];

// ------------------------------------------------------------------
// ⚙️ YÖNLENDİRME MANTIK (main.dart ile senkronize)
// ------------------------------------------------------------------

void _handleNavigation(BuildContext context, String title) {
  if (title == 'Triger Kasnaklar' ||
      title == 'Burçlu V Kasnaklar' ||
      title == 'V Kasnaklar') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TrigerKasnaklarPage()),
    );
  } else if (title == 'Pinyon Dişliler' ||
      title == 'Kramayer Dişliler' ||
      title == 'Zincir Dişliler') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DislilerPage()),
    );
  } else if (title == 'Kaplinler') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KaplinlerPage()),
    );
  } else {
    _showUnderConstruction(context, title);
  }
}

void _showUnderConstruction(BuildContext context, String category) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$category sayfası yapım aşamasındadır.'),
      backgroundColor: kPrimaryColor,
      duration: const Duration(seconds: 1),
    ),
  );
}

// ------------------------------------------------------------------
// 🛍️ ÜRÜNLER MENÜ SAYFASI
// ------------------------------------------------------------------

class UrunlerMenuPage extends StatelessWidget {
  const UrunlerMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TÜM ÜRÜN GRUPLARI',
            style: TextStyle(color: kBackgroundColor)),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: kUrunlerListesi.map((title) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: _buildCategoryButton(context, title),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String title) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kAccentColor,
        foregroundColor: kBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
      ),
      onPressed: () {
        _handleNavigation(context, title);
      },
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
