// lib/kramayer_disli_page.dart

import 'package:flutter/material.dart';
import 'main.dart';
import 'kramayer_duz_page.dart';
import 'kramayer_helis_page.dart';

class KramayerDisliPage extends StatelessWidget {
  const KramayerDisliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kramayer Dişliler',
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
            // Üst görsel
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/kramayer_ana.png",
                height: 230,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Dairesel hareketi çizgisel harekete çevirmek için en yaygın kullanılan "
              "mekanizmalar kramiyer dişlilerdir. Bunlarda dişli genellikle düz dişli "
              "olmakla birlikte helisel dişli olarak da imal edilmektedir.\n\n"
              "Dişli normal dişli prensiplerine göre dizayn edilir, kramiyer ise "
              "dişlinin modulune uygun olarak istenen boyda imal edilirler.",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),

            const SizedBox(height: 30),

            const Text(
              "Kramayer Dişli Tipleri",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),

            const SizedBox(height: 15),

            // 🔘 Düz Kramayer
            _buildButton(
              context,
              title: "Düz Kramayer Dişliler",
              page: const KramayerDuzPage(),
            ),

            const SizedBox(height: 12),

            // 🔘 Helis Kramayer
            _buildButton(
              context,
              title: "Helis Kramayer Dişliler",
              page: const KramayerHelisPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String title, required Widget page}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
          decoration: BoxDecoration(
            color: kAccentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: kBackgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: kBackgroundColor, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
