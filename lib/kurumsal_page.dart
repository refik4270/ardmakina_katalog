// lib/kurumsal_page.dart

import 'package:flutter/material.dart';
import 'main.dart'; 

const String kHakkimizda = """
ARDMAK, hareket aktarma elemanlarının imalat ve satışında 20 yılı aşkın tecrübeyle faaliyet gösteren köklü bir firmadır. Alanında uzman ve teknik bilgiye sahip personelimizle sektörde pek çok başarılı projeye imza attık.

Temel hedefimiz; kaliteden asla ödün vermeden, çalışanlarımızla birlikte üretim ve hizmet çıtasını sürekli yükseltmektir. Hareket aktarma elemanları alanındaki 15 yılı aşkın deneyimimizi güçlü imalat altyapımızla birleştiriyoruz. Müşterilerimizin ihtiyaç duyduğu ürünleri, sağladığımız birebir teknik destekle en doğru şekilde belirlemekteyiz. Standart aktarma elemanlarının yanı sıra, müşterilerimizin özel talepleri doğrultusunda özel imalat çözümleri de sunmaktayız.

Firmamız, yurt içinde üretimi bulunmayan bazı kritik ürünlerin üretimine ağırlık vererek AR-GE ve tasarım çalışmalarına aralıksız devam etmektedir. Kurulduğumuz günden bu yana müşterilerimize tecrübe, geçerlilik ve güvenilirliğin garantisini sunmayı ilke edindik. Yüksek otomasyon ve esneklik kavramlarını benimseyerek ürün ve hizmet kalitemizi sürekli geliştirmekteyiz.
""";

const String kVizyonumuz = """
Hareket aktarma ürünleri üretim sektöründe, sunduğumuz teknik destek, üstün işçilik ve malzeme kalitesi ile "ARDMAK" isminin sadece aranan değil, sektörde lider ve anılan bir marka olmasını sağlamaktır.
""";

const String kMisyonumuz = """
Modern yönetim sistemlerini etkin bir şekilde uygulayarak, sürekli değişen ve büyüyen iş ortaklarımızın ihtiyaçlarını profesyonel kadromuzla eksiksiz, hızlı ve çözüm odaklı bir şekilde karşılamaktır. Sektörde öncü bir firma olarak HAREKET AKTARMA ELEMANLARI üretiminde yenilikleri takip etmek, müşterilerimize daima en yüksek kalitede hizmeti sunmak, müşteri memnuniyetini en üst düzeyde tutmak ve çevreye karşı sorumluluk bilinciyle hareket etmektir.
""";

class KurumsalPage extends StatelessWidget {
  const KurumsalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KURUMSAL'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildKurumsalButton(context, 'HAKKIMIZDA', kHakkimizda),
            const SizedBox(height: 15),
            _buildKurumsalButton(context, 'VİZYONUMUZ', kVizyonumuz),
            const SizedBox(height: 15),
            _buildKurumsalButton(context, 'MİSYONUMUZ', kMisyonumuz),
          ],
        ),
      ),
    );
  }

  Widget _buildKurumsalButton(BuildContext context, String title, String content) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: kBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 6,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KurumsalDetailPage(
              title: title, 
              content: content,
            ),
          ),
        );
      },
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class KurumsalDetailPage extends StatelessWidget {
  final String title;
  final String content;

  const KurumsalDetailPage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
            const Divider(color: kPrimaryColor, thickness: 2, height: 30),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 30),
            if (title == 'VİZYONUMUZ')
              const Center(
                child: Icon(Icons.star, color: kPrimaryColor, size: 50),
              ),
            if (title == 'MİSYONUMUZ')
              const Center(
                child: Icon(Icons.engineering, color: kPrimaryColor, size: 50),
              ),
          ],
        ),
      ),
    );
  }
}
