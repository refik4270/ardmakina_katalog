// lib/standart_kamalar_page.dart

import 'package:flutter/material.dart';
import 'main.dart';

class StandartKamalarPage extends StatelessWidget {
  const StandartKamalarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Standart Kamalar',
          style: TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: kAccentColor, width: 1),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/kam2.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'kam2.png bulunamadı',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Mil kamaları mile bağlanacak kasnak, dişli vb. hareket aktarma "
              "elemanlarının tam olarak mile sabitlenmesinde kullanılır. "
              "Aktarma elemanlarının en önemli parçalarından biridir.\n\n"
              "Malzeme CK45 ithal malzemedir. Kamalar standart olarak "
              "imal edilmesinin yanı sıra özel imalat da yapılmaktadır.\n\n"
              "Mil kamaları A-B-AB ve BOY olarak imal edilmektedir. "
              "Teknik ölçüler için kataloğumuzu inceleyebilirsiniz.",
              style: TextStyle(fontSize: 16, height: 1.4),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                'KATALOG',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 8),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: kBackgroundColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 2,
              ),
              onPressed: () {},
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text(
                "Katalog (PDF) - Yakında",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
