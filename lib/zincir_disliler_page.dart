// lib/zincir_disliler_page.dart

import 'package:flutter/material.dart';
import 'main.dart';
import 'zincir_disli_detay_page.dart';

class ZincirDislilerPage extends StatelessWidget {
  const ZincirDislilerPage({super.key});

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
      '32B',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Zincir Dişliler',
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

            const Text(
              'Eksenler arası mesafenin uzun olduğu ve aynı düzlemde dönme hareketin '
              'aktarılması gereken yerlerde zincir dişliler kullanılır.\n\n'
              'Zincir dişlilere yüksek tork uygulanabilir ancak yüksek devirlerde '
              'kullanılamazlar ve çok gürültülüdürler. Bunların bir diğer dezavantajı '
              'gevşek tarafta zincirin sarkmasıdır. Sarkmayı gidermek için genellikle '
              'gerdirme dişlileri kullanılır.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 30),

            const Text(
              'Zincir Dişli Tipleri',
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
                child: _buildTypeButton(context, code),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeButton(BuildContext context, String code) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ZincirDisliDetayPage(code: code),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: kAccentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$code Zincir Dişliler',
                style: const TextStyle(
                  color: kBackgroundColor,
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
        ),
      ),
    );
  }
}
