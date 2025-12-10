// lib/rulman_yataklari_page.dart

import 'package:flutter/material.dart';
import 'main.dart';
import 'rulman_yatak_detay_page.dart';

class RulmanYataklariPage extends StatelessWidget {
  const RulmanYataklariPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rulman Yatakları',
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
            // ÜST GENEL GÖRSEL
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
                  'assets/rulman_yatak_ana.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'rulman_yatak_ana.png bulunamadı',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Rulman yataklarımız iki ana seriden oluşmaktadır: SNA ve SN tipleri. '
              'Her seri, ilgili rulmanlar için dayanıklı gövde ve güvenilir yataklama '
              'çözümleri sunar.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            const Text(
              'Rulman Yatak Tipleri',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),

            const SizedBox(height: 12),

            // SNA kartı
            _buildYatakCard(
              context,
              title: 'SNA Rulman Yatakları',
              imagePath: 'assets/sna_ana.png',
              code: 'SNA',
            ),
            const SizedBox(height: 16),

            // SN kartı
            _buildYatakCard(
              context,
              title: 'SN Rulman Yatakları',
              imagePath: 'assets/sn_ana.png',
              code: 'SN',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYatakCard(
    BuildContext context, {
    required String title,
    required String imagePath,
    required String code,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RulmanYatakDetayPage(code: code),
            ),
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
                height: 160,
                width: double.infinity,
                color: Colors.white,
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
    );
  }
}
