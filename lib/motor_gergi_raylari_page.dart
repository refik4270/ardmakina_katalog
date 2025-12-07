// lib/motor_gergi_raylari_page.dart

import 'package:flutter/material.dart';
import 'main.dart';
import 'motor_gergi_detay_page.dart';

// Genel açıklama
const String kMGRGenelAciklama = """
Motor gergi rayları; elektrik motoru, redüktörlü motor ve şanzımanların
şaseye montajında ve kayış gerginliğinin ayarlanmasında kullanılan ayarlı
sac raylardır.

Standart ölçüler stoktan temin edilebilir. Özel boy, delik ve sac kalınlığı
talepleriniz için lütfen bizimle iletişime geçin.
""";

// Model & kalınlık listesi
const List<Map<String, dynamic>> kMGRTipleri = [
  {'model': 'MGR-210', 'kalinliklar': ['3 mm']},
  {'model': 'MGR-260', 'kalinliklar': ['3 mm']},
  {'model': 'MGR-280', 'kalinliklar': ['3 mm', '4 mm']},
  {'model': 'MGR-330', 'kalinliklar': ['4 mm', '5 mm']},
  {'model': 'MGR-380', 'kalinliklar': ['4 mm', '5 mm']},
  {'model': 'MGR-430', 'kalinliklar': ['4 mm', '6 mm']},
  {'model': 'MGR-500', 'kalinliklar': ['5 mm', '8 mm']},
  {'model': 'MGR-650', 'kalinliklar': ['6 mm', '8 mm']},
  {'model': 'MGR-750', 'kalinliklar': ['8 mm', '10 mm']},
  {'model': 'MGR-900', 'kalinliklar': ['12 mm']},
];

class MotorGergiRaylariPage extends StatelessWidget {
  const MotorGergiRaylariPage({super.key});

  String _buildDescription(List<String> kalinliklar) {
    if (kalinliklar.length == 1) {
      return "$kMGRGenelAciklama\n\nBu model ${kalinliklar[0]} sac kalınlığında üretilmektedir.";
    } else {
      return "$kMGRGenelAciklama\n\nMevcut sac kalınlıkları: ${kalinliklar.join(', ')}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MOTOR GERGİ RAYLARI',
          style: TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),

      body: Column(
        children: [
          // 🔥 Üstte büyük görsel
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/motor_gergi_rayi.png',
              height: 180,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 10),

          // 🔥 Liste alanı (kaydırılabilir)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: kMGRTipleri.length,
              itemBuilder: (context, index) {
                final item = kMGRTipleri[index];
                final model = item['model'] as String;
                final kalinliklar = item['kalinliklar'] as List<String>;
                final description = _buildDescription(kalinliklar);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MotorGergiDetayPage(
                            title: model,
                            description: description,
                            imagePath: 'assets/motor_gergi_rayi_detay.png',
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
