// lib/motor_gergi_raylari_page.dart - KESİNLEŞMİŞ METİN VE DATA

import 'package:flutter/material.dart';
import 'main.dart';
import 'motor_gergi_detay_page.dart';

// GÜNCEL GENEL AÇIKLAMA METNİ (İstediğiniz gibi kısaltıldı)
const String kMGRGenelAciklama = """
Motor gergi rayları Elektrikli motor, redüktörlü motor ve şanzımanlarda kullanılan zincir ve kayış sistemlerinin rahat ve dengeli bir şekilde gerdirilmesini ve sabitlenmesi sağlar. Motor gergi rayları Motor güç ve devirine göre seçim yapılmaktadır. Detaylı teknik ölçüleri katalog bölümünden ulaşabilirsiniz.
""";

// Kalınlık verilerini ve ürün isimlerini içeren ana liste
const List<Map<String, dynamic>> kMGRTipleri = [
  // Tek Kalınlık
  {'model': 'MGR-210', 'kalinliklar': ['3mm']},
  {'model': 'MGR-260', 'kalinliklar': ['3mm']},
  
  // İki Kalınlık
  {'model': 'MGR-280', 'kalinliklar': ['3mm', '4mm']}, 
  {'model': 'MGR-330', 'kalinliklar': ['4mm', '5mm']},
  {'model': 'MGR-380', 'kalinliklar': ['4mm', '5mm']},
  {'model': 'MGR-430', 'kalinliklar': ['4mm', '6mm']},
  {'model': 'MGR-500', 'kalinliklar': ['5mm', '8mm']},
  {'model': 'MGR-650', 'kalinliklar': ['6mm', '8mm']},
  {'model': 'MGR-750', 'kalinliklar': ['8mm', '10mm']},
  
  // Tek Kalınlık
  {'model': 'MGR-900', 'kalinliklar': ['12mm']},
];

class MotorGergiRaylariPage extends StatelessWidget {
  const MotorGergiRaylariPage({super.key});

  // Modelin açıklama metnini kalınlık bilgisiyle birlikte oluşturan fonksiyon
  String _buildDescription(List<String> kalinliklar) {
    String kalinlikMetni;
    
    // Kalınlık bilgisini belirleyen kısım
    if (kalinliklar.length == 1) {
      kalinlikMetni = "Bu model standart olarak **${kalinliklar[0]}** kalınlığında üretilmektedir.";
    } else if (kalinliklar.length == 2) {
      kalinlikMetni = "Bu model standart olarak **${kalinliklar[0]}** ve **${kalinliklar[1]}** kalınlık seçenekleri ile üretilmektedir.";
    } else {
      kalinlikMetni = "Kalınlık bilgisi mevcut değildir.";
    }

    // Genel açıklama ile kalınlık bilgisini birleştiriyoruz
    return "$kMGRGenelAciklama\n\n--- Kalınlık Bilgisi ---\n$kalinlikMetni";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MOTOR GERGİ RAYLARI', style: TextStyle(color: kBackgroundColor)),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: ListView.builder(
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
                backgroundColor: kAccentColor,
                foregroundColor: kBackgroundColor,
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 5,
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
                  Expanded(
                    child: Text(
                      model,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}