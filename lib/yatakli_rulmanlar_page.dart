// lib/yatakli_rulmanlar_page.dart

import 'package:flutter/material.dart';
import 'main.dart';
import 'yatakli_rulman_detay_page.dart';

class YatakliRulmanlarPage extends StatelessWidget {
  const YatakliRulmanlarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> yatakliTipleri = [
      'UCP',
      'UCF',
      'UCT',
      'UCFC',
      'UCFL',
      'UCFA',
      'UCPA',
      'UCHA',
      'UCFB',
      'UCPH',
      // UCF300 ve UCP300 listeden çıkarıldı
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yataklı Rulmanlar',
          style: TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                  color: Colors.white,
                  border: Border.all(color: kAccentColor, width: 1),
                ),
                child: Image.asset(
                  'assets/yataklı_ana.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'yataklı_ana.png bulunamadı',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Üzerinde kendinden bağlantı elemanları (genellikle döküm) bulunan rulmanlardır. '
              'özellikle merdaneli sistemlerde sıkça kullanılırlar. Kullanılacağı yerde mili '
              'yataklayarak avare olarak dönüş sağlamaktadır.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            const Text(
              'Ürün Çeşitleri',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),

            const SizedBox(height: 12),

            ...yatakliTipleri.map(
              (code) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _buildYatakliButton(context, code),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYatakliButton(BuildContext context, String code) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kAccentColor,
        foregroundColor: kBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => YatakliRulmanDetayPage(code: code),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            code,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: kBackgroundColor,
            size: 18,
          ),
        ],
      ),
    );
  }
}
