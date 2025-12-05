import 'package:flutter/material.dart';
import 'main.dart'; // Renkler (kPrimaryColor, kAccentColor, kBackgroundColor)
import 'triger_detay_page.dart'; // Detay sayfasına yönlendirme için.

class PilotSerilerPage extends StatelessWidget {
  final String title; // "Pilot Delikli Triger Kasnaklar"

  const PilotSerilerPage({super.key, required this.title});

  // HTD Serileri
  final List<String> htdSerileri = const [
    '3M',
    '5M',
    '8M',
    '14M',
  ];

  // Metrik Seriler
  final List<String> metrikSerileri = const [
    'T2,5',
    'AT5',
    'T5',
    'AT10',
    'T10',
  ];

  // Whitworth Serileri
  final List<String> whitworthSerileri = const [
    'XL',
    'L',
    'H',
    'XH',
  ];

  @override
  Widget build(BuildContext context) {
    final String tipAdi = title; // "Pilot Delikli Triger Kasnaklar"

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilot Delikli Triger Kasnak Serileri',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
            const SizedBox(height: 16),

            // HTD SERİLERİ
            _buildGroupTitle('HTD SERİLERİ'),
            _buildSeriesWrap(context, tipAdi, htdSerileri),

            const SizedBox(height: 24),

            // METRİK SERİLERİ
            _buildGroupTitle('METRİK SERİLERİ'),
            _buildSeriesWrap(context, tipAdi, metrikSerileri),

            const SizedBox(height: 24),

            // WHITWORTH SERİLERİ
            _buildGroupTitle('WHITWORTH SERİLERİ'),
            _buildSeriesWrap(context, tipAdi, whitworthSerileri),

            const SizedBox(height: 30),

            const Text(
              'Pilot delikli kasnaklar, merkezdeki standart pilot delik sayesinde '
              'müşteri talebine göre yeniden işlenerek farklı mil çaplarına uyarlanabilir. '
              'Bu sayede stok yönetimi kolaylaşır ve montajda esneklik sağlar.',
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: kTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Grup başlığı
  Widget _buildGroupTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: kPrimaryColor,
      ),
    );
  }

  // Verilen seri listesi için butonları saran Wrap
  Widget _buildSeriesWrap(
    BuildContext context,
    String tipAdi,
    List<String> seriler,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: seriler.map((seriAdi) {
          return ElevatedButton(
            onPressed: () {
              // Her seriye tıklandığında TrigerDetayPage'e git
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrigerDetayPage(
                    tipAdi: tipAdi,
                    seriAdi: seriAdi,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kAccentColor,
              foregroundColor: kBackgroundColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              seriAdi,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
