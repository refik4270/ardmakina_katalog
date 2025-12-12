// lib/pdf_viewer_page.dart

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'main.dart';

class PdfViewerPage extends StatefulWidget {
  final String assetPath;      // assets/KB-100.pdf
  final String appBarTitle;    // AppBar başlığı (örn: KB-100 Kataloğu)
  final String productTitle;   // Ürün adı / kodu (örn: KB-100)
  final String imagePath;      // Ürün görseli (örn: assets/kb_100.png)

  const PdfViewerPage({
    super.key,
    required this.assetPath,
    required this.appBarTitle,
    required this.productTitle,
    required this.imagePath,
  });

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late PdfControllerPinch _pdfController;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset(widget.assetPath),
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appBarTitle,
          style: const TextStyle(color: kBackgroundColor),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kBackgroundColor),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ÜSTTE ÜRÜN GÖRSELİ
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: kAccentColor, width: 1),
                  color: Colors.white,
                ),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                        color: kPrimaryColor,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // ÜRÜN ADI / KODU
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.productTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kAccentColor,
              ),
            ),
          ),

          const SizedBox(height: 8),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Ürün kataloğunu aşağıdan inceleyebilirsiniz.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),

          const SizedBox(height: 8),

          const Divider(height: 1, color: kAccentColor),

          // ALTA GENİŞLEYEN PDF ALANI
          Expanded(
            child: PdfViewPinch(
              controller: _pdfController,
            ),
          ),
        ],
      ),
    );
  }
}
