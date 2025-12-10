// lib/zincirler_page.dart

import 'package:flutter/material.dart';
import 'main.dart';
import 'zincir_detay_page.dart';

class ZincirlerPage extends StatelessWidget {
  const ZincirlerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> zincirTipleri = [
      '06B',
      '08B',
      '10B',
      '12B',
      '16B',
      '20B',
      '24B',
      '28B',
      '32B',
      '40B',
      '48B',
      '56B',
      '64B',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Zincirler',
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
                  'assets/zincir_ana.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'zincir_ana.png bulunamadı',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // AÇIKLAMA METNİ
            const Text(
              'Endüstriyel alanda kullanılan zincirler 5 parçadan oluşmaktadır. Makara, pim, '
              'makara bağlantı plakası, pim bağlantı plakası ve burçtur. Kullanılacak zincir '
              'çekeceği yüke göre tercih edilmelidir. Zincirler tek sıra, çift sıra ve üç sıra '
              'olarak kullanılabilmektedir. Bunların dışında özel amaçlı zincirlerde mevcuttur. '
              '(Pimli zincir, kulaklı zincir vb.) ',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            const Text(
              'Zincir Tipleri',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),

            const SizedBox(height: 12),

            // ÇEŞİTLER LİSTESİ
            ...zincirTipleri.map(
              (code) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _buildZincirButton(context, code),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildZincirButton(BuildContext context, String code) {
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
            builder: (_) => ZincirDetayPage(code: code),
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
