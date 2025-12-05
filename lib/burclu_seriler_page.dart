// lib/burclu_seriler_page.dart

import 'package:flutter/material.dart';
import 'main.dart'; 

class BurcluSerilerPage extends StatelessWidget {
  final String title; 

  const BurcluSerilerPage({super.key, required this.title});

  List<Widget> _buildSeriesButtons(BuildContext context, String groupTitle, List<String> series) {
    return [
      Text(
        groupTitle,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: kPrimaryColor,
        ),
      ),
      const SizedBox(height: 10),
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: series.map((serie) {
          return ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$title - $serie serisi tıklandı. Katalog/Detay yükleniyor...')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kAccentColor,
              foregroundColor: kBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              serie,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
      ),
      const SizedBox(height: 40),
    ];
  }

  @override
  Widget build(BuildContext context) {
    const List<String> htdSeries = ['5M', '8M', '14M'];
    const List<String> whitworthSeries = ['L', 'H', 'XH'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: kBackgroundColor)),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor), 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            const Text(
              'Mevcut Seriler ve Standartlar',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
            const SizedBox(height: 20),
            ..._buildSeriesButtons(context, 'HTD SERİSİ (Metrik)', htdSeries),
            ..._buildSeriesButtons(context, 'WHITWORTH SERİSİ (İnç)', whitworthSeries),
          ],
        ),
      ),
    );
  }
}
