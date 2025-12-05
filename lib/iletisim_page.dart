// lib/iletisim_page.dart - İLETİŞİM SAYFASI (Adres ve Harita Yer Tutucu ile)

import 'package:flutter/material.dart';
import 'main.dart'; 

class IletisimPage extends StatelessWidget {
  const IletisimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İLETİŞİM BİLGİLERİ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildContactCard(context),
            const SizedBox(height: 30),
            _buildAddressSection(),
            const SizedBox(height: 30),
            _buildMapPlaceholder(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bize Ulaşın',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const Divider(color: kAccentColor),
            _buildContactRow(
              icon: Icons.phone,
              label: 'Telefon',
              value: kPhoneNumber,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Telefon Aranıyor: $kPhoneNumber')),
                );
              },
            ),
            _buildContactRow(
              icon: Icons.mail,
              label: 'E-Posta',
              value: kEmailAddress,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('E-posta Ekranı Açılıyor: $kEmailAddress')),
                );
              },
            ),
            _buildContactRow(
              icon: Icons.language,
              label: 'Web Adresi',
              value: kWebAddress.replaceAll('http://', ''),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Web Sitesi Açılıyor: $kWebAddress')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: kPrimaryColor),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value, style: const TextStyle(color: kTextColor)),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fabrika/Ofis Adresi',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        const Divider(color: kAccentColor),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Icon(Icons.location_on, color: kAccentColor, size: 24),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                kAddress,
                style: const TextStyle(fontSize: 16, height: 1.5, color: kTextColor),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMapPlaceholder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Konum',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        const Divider(color: kAccentColor),
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kAccentColor),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.map, size: 50, color: Colors.blueGrey),
                const SizedBox(height: 10),
                const Text(
                  'Harita Görünümü (Yer Tutucu)',
                  style: TextStyle(color: kAccentColor),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.directions),
                  label: const Text('Haritada Aç'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Konum Haritada Açılıyor...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: kBackgroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
