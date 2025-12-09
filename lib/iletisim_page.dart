// lib/iletisim_page.dart - İLETİŞİM SAYFASI (TIKLANABİLİR TELEFON / MAIL / WEB)

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';

class IletisimPage extends StatelessWidget {
  const IletisimPage({super.key});

  // TELEFON ARAMA
  Future<void> _callPhone(BuildContext context) async {
    final uri = Uri(
      scheme: 'tel',
      path: kPhoneNumber,
    );
    if (!await launchUrl(uri)) {
      _showError(context, 'Telefon araması başlatılamadı.');
    }
  }

  // MAİL GÖNDERME
  Future<void> _sendMail(BuildContext context) async {
    final uri = Uri(
      scheme: 'mailto',
      path: kEmailAddress,
    );
    if (!await launchUrl(uri)) {
      _showError(context, 'E-posta uygulaması açılamadı.');
    }
  }

  // WEB SİTESİ AÇMA
  Future<void> _openWebsite(BuildContext context) async {
    final uri = Uri.parse(kWebAddress);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      _showError(context, 'Web sitesi açılamadı.');
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'İLETİŞİM BİLGİLERİ',
          style: TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bize Ulaşın',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Her türlü teknik bilgi, fiyat teklifi ve siparişleriniz için bizimle iletişime geçebilirsiniz.',
              style: TextStyle(fontSize: 16, height: 1.4),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),

            // 📞 TELEFON / MAİL / WEB KUTUSU
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildContactRow(
                      context,
                      icon: Icons.phone,
                      label: 'Telefon',
                      value: kPhoneNumber,
                      onTap: () => _callPhone(context),
                    ),
                    const Divider(),
                    _buildContactRow(
                      context,
                      icon: Icons.mail,
                      label: 'E-Posta',
                      value: kEmailAddress,
                      onTap: () => _sendMail(context),
                    ),
                    const Divider(),
                    _buildContactRow(
                      context,
                      icon: Icons.language,
                      label: 'Web Sitesi',
                      value: kWebAddress,
                      onTap: () => _openWebsite(context),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 📍 ADRES BÖLÜMÜ
            _buildAddressSection(),

            const SizedBox(height: 30),

            // HARİTA YER TUTUCU (İSTERSEK SONRA GERÇEK HARİTA EKLERİZ)
            _buildMapPlaceholder(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: kAccentColor, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: kAccentColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: kTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fabrika / Ofis Adresi',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(height: 8),
        const Divider(color: kAccentColor),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on, color: kAccentColor, size: 26),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                kAddress,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMapPlaceholder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Konum / Harita',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kAccentColor, width: 1),
            color: Colors.grey[200],
          ),
          child: const Center(
            child: Text(
              'Buraya ileride Google Maps\nveya harita görüntüsü eklenebilir.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kAccentColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
