// lib/disliler_page.dart - KONTROL EDİLMİŞ VE TAMAMLANMIŞ KOD

import 'package:flutter/material.dart';
import 'main.dart'; 

class GearModel {
  final String title;
  final String material;
  final String module;
  final String standard;
  final List<Map<String, String>> specs;

  const GearModel({
    required this.title,
    required this.material,
    required this.module,
    required this.standard,
    required this.specs,
  });
}

const List<GearModel> dummyGears = [
  GearModel(
    title: 'DÜZ DİŞLİ (MODÜL 2)',
    material: 'CK45 Çelik',
    module: '2',
    standard: 'DIN 3962',
    specs: [
      {'Diş Sayısı': '20', 'Dış Çap (mm)': '44', 'Genişlik (mm)': '20', 'Kama': '6 mm'},
      {'Diş Sayısı': '30', 'Dış Çap (mm)': '64', 'Genişlik (mm)': '20', 'Kama': '8 mm'},
      {'Diş Sayısı': '40', 'Dış Çap (mm)': '84', 'Genişlik (mm)': '25', 'Kama': '10 mm'},
    ],
  ),
  GearModel(
    title: 'KONİK DİŞLİ (HELİS)',
    material: '18NiCrMo5',
    module: '3',
    standard: 'ISO 1328',
    specs: [
      {'Oran': '1:1', 'Diş Sayısı': '25', 'Eğiklik': '15°'},
      {'Oran': '1:2', 'Diş Sayısı': '30', 'Eğiklik': '20°'},
    ],
  ),
];

class DislilerPage extends StatelessWidget {
  const DislilerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DİŞLİLER'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: dummyGears.length,
        itemBuilder: (context, index) {
          final gear = dummyGears[index];
          return _buildGearCard(context, gear);
        },
      ),
    );
  }

  Widget _buildGearCard(BuildContext context, GearModel gear) {
    return Card(
      elevation: 4,
      color: kBackgroundColor, 
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GearDetailPage(gear: gear),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                gear.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[200], 
                child: Center(
                  child: Text(
                    '[${gear.title} Görseli]',
                    style: const TextStyle(color: kAccentColor),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _detailRow('Malzeme', gear.material),
              _detailRow('Modül', gear.module),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold, color: kAccentColor)),
          Flexible(child: Text(value, style: const TextStyle(color: kTextColor))),
        ],
      ),
    );
  }
}

class GearDetailPage extends StatelessWidget {
  final GearModel gear;
  const GearDetailPage({super.key, required this.gear});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(gear.title),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'GENEL'),
              Tab(text: 'ÖLÇÜLER'),
              Tab(text: 'ÇİZİM'),
            ],
            indicatorColor: kBackgroundColor, 
            labelColor: kBackgroundColor,
            unselectedLabelColor: Colors.white70,
          ),
        ),
        body: TabBarView(
          children: [
            _buildGeneralTab(),
            _buildSpecsTab(),
            _buildDrawingTab(),
          ],
        ),
      ),
    );
  }
  
  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold, color: kAccentColor)),
          Flexible(child: Text(value, style: const TextStyle(color: kTextColor))),
        ],
      ),
    );
  }

  Widget _buildGeneralTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _detailRow('Malzeme', gear.material),
          _detailRow('Modül', gear.module),
          _detailRow('Standart', gear.standard),
          const Divider(color: kAccentColor),
          const SizedBox(height: 10),
          const Text(
            '**Kullanım Alanları ve Özellikler**',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
          const SizedBox(height: 10),
          const Text(
            'Dişli çarklarımız, yüksek dayanıklılık ve hassas diş profilleri sayesinde, endüstriyel redüktörler ve ağır sanayi makineleri için idealdir. Titreşimsiz ve sessiz çalışma performansı sunar.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kPrimaryColor, width: 2),
            ),
            child: const Center(child: Text('[Yüksek Çözünürlüklü Dişli Görseli]')),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecsTab() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ölçü Tablosu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),
            const SizedBox(height: 10),
            DataTable(
              headingRowColor: MaterialStateProperty.all(kAccentColor), 
              columns: gear.specs.first.keys.map((key) {
                return DataColumn(
                  label: Text(
                    key, 
                    style: const TextStyle(fontWeight: FontWeight.bold, color: kBackgroundColor),
                  ),
                );
              }).toList(),
              rows: gear.specs.map((spec) {
                return DataRow(
                  cells: spec.values.map((value) {
                    return DataCell(Text(value, style: const TextStyle(color: kTextColor)));
                  }).toList(),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawingTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            const Text(
              'Teknik Çizim ve Diş Profili',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: kAccentColor, width: 2), 
                  color: Colors.grey[100],
                ),
                child: const Center(
                  child: Text(
                    '[Teknik Çizim Görseli Buraya Gelecek]',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kAccentColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
