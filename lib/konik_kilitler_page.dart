// lib/konik_kilitler_page.dart

import 'package:flutter/material.dart';
import 'main.dart';
import 'konik_kilit_detay_page.dart';

// Konik kilitlerin genel açıklaması
const String kKonikKilitGenelAciklama = """
Konik kilitler, mil ve göbek bağlantılarında kama ve kanal açmaya gerek
kalmadan, boşluksuz ve yüksek tork iletimi sağlayan mekanik sıkma
elemanlarıdır.

Montaj ve sökme işlemleri pratiktir; hassas konumlama gerektiren
uygulamalarda güvenilir ve tekrarlanabilir bir çözüm sunar.
Standart ölçüler stoktan temin edilebilir, özel talepler için lütfen
firmamızla iletişime geçiniz.
""";

// Model listesi
const List<String> kKonikKilitModelleri = [
  'KB-100',
  'KB-150',
  'KB-200',
  'KB-210',
  'KB-250',
  'KB-300',
  'KB-301',
  'KB-310',
  'KB-330',
  'KB-350',
  'KB-351',
  'KB-400',
  'KB-401',
  'KB-450',
  'KB-500',
  'KB-501',
  'KB-600',
  'KB-601',
  'KB-651',
  'ML-A',
  'ML-B',
];

class KonikKilitlerPage extends StatelessWidget {
  const KonikKilitlerPage({super.key});

  String _buildDescription(String model) {
    return "$kKonikKilitGenelAciklama\n"
        "\nBu ürün, ARD Makina'nın $model kodlu konik kilit modelidir. "
        "Mil ve göbek bağlantılarında boşluksuz sıkma sağlayarak, yüksek tork "
        "aktarımında güvenli bir çözümdür.";
  }

  // 🔴 Model adına göre görsel dosya adını üret
  // Örn: "KB-100" -> "assets/kb_100.png"
  String _imagePathForModel(String model) {
    final normalized = model.toLowerCase().replaceAll('-', '_');
    return 'assets/$normalized.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'KONİK KİLİTLER',
          style: TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: Column(
        children: [
          // Üstte genel ürün görseli (istersen bunu da kaldırabiliriz)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/konik_kilit.png', // Genel tanıtım görseli
              height: 180,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox.shrink();
              },
            ),
          ),
          const SizedBox(height: 8),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Standart konik kilit serilerimiz aşağıda listelenmiştir. '
              'Detay görmek istediğiniz kodu seçebilirsiniz.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Liste alanı
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: kKonikKilitModelleri.length,
              itemBuilder: (context, index) {
                final model = kKonikKilitModelleri[index];
                final description = _buildDescription(model);
                final imagePath = _imagePathForModel(model); // 👈 model -> görsel

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kAccentColor,
                      foregroundColor: kBackgroundColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => KonikKilitDetayPage(
                            title: model,
                            description: description,
                            imagePath: imagePath, // 👈 her modele özel görsel
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
