// lib/burclu_v_kasnaklar_page.dart

import 'package:flutter/material.dart';
import 'main.dart';
import 'burclu_v_kasnak_detay_page.dart';

const List<String> kBurcluVSerileri = ['SPZ', 'SPA', 'SPB', 'SPC'];

String buildBurcluVAciklama(String seri) {
  String kayis;

  switch (seri) {
    case 'SPZ':
      kayis = '9,5 mm';
      break;
    case 'SPA':
      kayis = '13 mm';
      break;
    case 'SPB':
      kayis = '17 mm';
      break;
    case 'SPC':
      kayis = '22 mm';
      break;
    default:
      kayis = '13 mm';
  }

  return "$seri burçlu v kasnaklarda $kayis genişliğinde V kayışı kullanılmaktadır. "
      "Burçlu v kasnakları diğer v kasnaklardan ayıran başlıca özellikleri şunlardır: "
      "Salgı ve balanslarının alınması, konik burç sayesinde kasnağın mile kolayca montaj ve demontaj edilebilmesi, "
      "kanal açılarının dünya standartlarında açılması ve fosfat kaplama yapılmasıdır. "
      "Burçlu v kasnaklar 50 mm çaptan 1250 mm çapa kadar imal edilmektedir. "
      "Standart imalat yapıldığı gibi özel olarak da üretim yapılabilir. "
      "Teknik özellikler için kataloğumuzu inceleyebilirsiniz.";
}

class BurcluVKasnaklarPage extends StatelessWidget {
  const BurcluVKasnaklarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BURÇLU V KASNAKLAR',
          style: TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/bvk1.png',
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Burçlu V kasnak serilerimizi aşağıdan seçerek detaylarını inceleyebilirsiniz.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: kBurcluVSerileri.length,
              itemBuilder: (context, index) {
                final seri = kBurcluVSerileri[index];
                final aciklama = buildBurcluVAciklama(seri);

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
                          builder: (_) => BurcluVKasnakDetayPage(
                            title: '$seri Burçlu V Kasnaklar',
                            description: aciklama,
                            imagePath: 'assets/bvk2.png',
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          seri,
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
