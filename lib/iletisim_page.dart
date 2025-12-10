// lib/iletisim_page.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';

class IletisimPage extends StatelessWidget {
  const IletisimPage({super.key});

  // Ortak URL açma fonksiyonu
  Future<void> _launchCustomUrl(String type, String target) async {
    Uri uri;

    if (type == 'Telefon') {
      uri = Uri(scheme: 'tel', path: target);
    } else if (type == 'Mail') {
      uri = Uri(scheme: 'mailto', path: target);
    } else {
      uri = Uri.parse(target);
    }

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Bağlantı açılamadı: $uri');
    }
  }

  // Google Haritalar URL’in (senin gönderdiğin link)
  static const String _kGoogleMapsUrl =
      'https://www.google.com.tr/search?sca_esv=d878df9cdf7e300a&sxsrf=AE3TifNbK1dehQD36eYXLvgfbvieFK0WzQ:1765375058833&kgmid=/g/1hm3cr760&q=ARD+MAK%C4%B0NA&shndl=30&shem=damc,lcuae,ptotple,uaasie,shrtn&source=sh/x/loc/uni/m1/1&kgs=0ee8682b9be95c7a&utm_source=damc,lcuae,ptotple,uaasie,shrtn,sh/x/loc/uni/m1/1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'İLETİŞİM',
          style: TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            _buildContactCard(context),
            const SizedBox(height: 30),
            _buildMapCard(context),
          ],
        ),
      ),
    );
  }

  // 📌 İLETİŞİM BİLGİLERİ (TIKLANABİLİR)
  Widget _buildContactCard(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'İLETİŞİM BİLGİLERİ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 16),

            // Adres (tıklanmaz, sadece bilgi)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, color: kAccentColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    kAddress,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Telefon (TIKLANABİLİR)
            InkWell(
              onTap: () => _launchCustomUrl('Telefon', kPhoneNumber),
              child: Row(
                children: [
                  const Icon(Icons.phone, color: kAccentColor),
                  const SizedBox(width: 8),
                  Text(
                    kPhoneNumber,
                    style: const TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Mail (TIKLANABİLİR)
            InkWell(
              onTap: () => _launchCustomUrl('Mail', kEmailAddress),
              child: Row(
                children: [
                  const Icon(Icons.mail, color: kAccentColor),
                  const SizedBox(width: 8),
                  Text(
                    kEmailAddress,
                    style: const TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Web (TIKLANABİLİR)
            InkWell(
              onTap: () => _launchCustomUrl('Web', kWebAddress),
              child: Row(
                children: [
                  const Icon(Icons.language, color: kAccentColor),
                  const SizedBox(width: 8),
                  Text(
                    kWebAddress,
                    style: const TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🗺 HARİTA BÖLÜMÜ (GOOGLE HARİTALAR’A AÇILIR)
  Widget _buildMapCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'KONUM / HARİTA',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () => _launchCustomUrl('Web', _kGoogleMapsUrl),
            borderRadius: BorderRadius.circular(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: kAccentColor, width: 1),
                  color: Colors.grey[200],
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // İstersen buraya sonra harita_ana.png ekleyebiliriz.
                    // Şimdilik sade arka plan + ikon + yazı:
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.map,
                            size: 48,
                            color: kPrimaryColor,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Google Haritalar\'da Görüntüle',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kAccentColor,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Dokunarak açabilirsiniz',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
