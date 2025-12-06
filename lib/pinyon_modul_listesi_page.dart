// lib/pinyon_modul_listesi_page.dart - KESİN ÇÖZÜM: ÖZEL METİNLER

import 'package:flutter/material.dart';
import 'main.dart';
import 'pinyon_disli_detay_page.dart';

class PinyonModulListesiPage extends StatelessWidget {
  final String turKodu; // 'duz' veya 'helis'

  const PinyonModulListesiPage({super.key, required this.turKodu});

  @override
  Widget build(BuildContext context) {
    // Başlıkları belirliyoruz
    String ekranBasligi = (turKodu == 'duz') ? 'Düz Pinyon Modülleri' : 'Helis Pinyon Modülleri';
    
    // Modül listesi
    final List<String> moduller = [
      '1', '1,5', '2', '2,5', '3', '4', '5', '6', '7', '8', '9', '10'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(ekranBasligi, style: const TextStyle(color: kBackgroundColor)),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              '$ekranBasligi Serisi',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
            const SizedBox(height: 20),
            
            // Kutucuklar
            Wrap(
              spacing: 12, 
              runSpacing: 12, 
              children: moduller.map((modul) {
                return _buildModulButton(context, modul);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModulButton(BuildContext context, String modul) {
    String imagePath;
    String description;
    String detayBasligi;

    // --- BURASI SİZİN YAZILARINIZI SEÇİYOR ---
    if (turKodu == 'duz') {
      // DÜZ PİNYON İSE
      imagePath = 'assets/duz_pinyon_detay.png';
      detayBasligi = 'Düz Pinyon Dişli (Modül $modul)';
      
      // SİZİN YAZDIĞINIZ METİN (HARFİ HARFİNE)
      description = "Düz pinyon dişliler, en yaygın kullanılan dişli tipidir ve düz diş profili sayesinde yüksek verimlilik, düşük sürtünme ve kolay montaj imkânı sunar. Modül, diş sayısı, malzeme ve yüzey işlemleri müşteri talebine göre tamamen özelleştirilebilir.";

    } else {
      // HELİS PİNYON İSE
      imagePath = 'assets/helis_pinyon_detay.png';
      detayBasligi = 'Helis Pinyon Dişli (Modül $modul)';
      
      // SİZİN YAZDIĞINIZ METİN (HARFİ HARFİNE)
      description = "Helis pinyon dişliler, açılı diş profili sayesinde yüksek hızlarda daha sessiz, daha titreşimsiz ve daha verimli güç aktarımı sağlar. Eğik diş yapısı, dişlerin kademeli olarak kavuşmasını sağlayarak yük dağılımını optimize eder ve uzun ömürlü çalışma imkânı sunar.";
    }

    return SizedBox(
      width: 100, 
      height: 60, 
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kAccentColor,
          foregroundColor: kBackgroundColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
        ),
        onPressed: () {
          // Detay sayfasına git ve yazıyı götür
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PinyonDisliDetayPage(
                title: detayBasligi,
                description: description, // GÜNCEL YAZI BURADAN GİDİYOR
                imagePath: imagePath, 
              ),
            ),
          );
        },
        child: Text(
          '$modul Modül', 
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}