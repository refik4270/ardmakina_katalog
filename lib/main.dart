// lib/main.dart

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

import 'triger_kasnaklar_page.dart';
import 'disliler_page.dart';
import 'kurumsal_page.dart';
import 'urunler_menu_page.dart';
import 'iletisim_page.dart';
import 'kaplinler_page.dart';
import 'motor_gergi_raylari_page.dart';
import 'konik_kilitler_page.dart';
import 'burclu_v_kasnaklar_page.dart';
import 'konik_burclar_page.dart';
import 'mil_kamalari_page.dart';
import 'kramayer_disli_page.dart';
import 'zincir_disliler_page.dart';
import 'zincirler_page.dart';

// ------------------------------------------------------------------
// RENK PALETİ VE SABİT DEĞERLER
// ------------------------------------------------------------------
const Color kPrimaryColor = Color(0xFFC62828); // Koyu Kırmızı (Vurgu)
const Color kAccentColor = Color(0xFF424242); // Koyu Gri / Siyah
const Color kBackgroundColor = Colors.white; // Beyaz
const Color kTextColor = Colors.black; // Siyah Metin Rengi

// 📞 KESİNLEŞMİŞ İLETİŞİM BİLGİLERİ
const String kWebAddress = 'http://www.ardmakina.com';
const String kPhoneNumber = '+903322486460';
const String kEmailAddress = 'ard@ardmakina.com';
const String kAddress =
    'Fevzi Çakmak Mahallesi 10674. Sokak No:53 Karatay/Konya TÜRKİYE';

// 📢 DUYURU İÇERİĞİ (Popup için)
const String kCurrentAnnouncementTitle = 'YENİ ÜRÜN SERİSİ PİYASADA!';
const String kCurrentAnnouncementContent =
    '8M Triger Kasnakların tam set Burçlu ve Pilot Delikli modelleri stoğumuza eklenmiştir. Detaylı bilgi için ürünlerimizi inceleyin!';

// ------------------------------------------------------------------
// BAŞLANGIÇ NOKTASI
// ------------------------------------------------------------------
void main() {
  runApp(const ArdMakinaApp());
}

class ArdMakinaApp extends StatelessWidget {
  const ArdMakinaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ard Makina Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        colorScheme: const ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kAccentColor,
          background: kBackgroundColor,
          onPrimary: kBackgroundColor,
        ),
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
          foregroundColor: kBackgroundColor,
          elevation: 4,
          iconTheme: IconThemeData(color: kBackgroundColor),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kTextColor),
          bodyMedium: TextStyle(color: kTextColor),
          titleLarge: TextStyle(color: kTextColor),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// ------------------------------------------------------------------
// 🏡 Ana Ekran (Home Screen)
// ------------------------------------------------------------------

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> productCategories = const [
    'Triger Kasnaklar',
    'Kaplinler',
    'Pinyon Dişliler',
    'Motor Gergi Rayları',
    'Konik Kilitler',
    'Burçlu V Kasnaklar',
    'V Kasnaklar',
    'Konik Burçlar',
    'Mil Kamaları',
    'Kramayer Dişliler',
    'Zincir Dişliler',
    'Zincirler',
    'Rulman Yatakları',
    'Yataklı Rulmanlar',
  ];

  static const String kLogoPath = 'assets/ardmakina_logo.png';

  final List<String> sliderImages = const [
    'assets/slider_1.png',
    'assets/slider_2.png',
    'assets/slider_3.png',
    'assets/slider_4.png',
    'assets/slider_5.png',
    'assets/slider_6.png',
    'assets/slider_7.png',
    'assets/slider_8.png',
    'assets/slider_9.png',
    'assets/slider_10.png',
    'assets/slider_11.png',
    'assets/slider_12.png',
    'assets/slider_13.png',
  ];

  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);

    Future.delayed(Duration.zero, () {
      _showAnnouncementPopup(context);
    });

    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < sliderImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _showAnnouncementPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Row(
            children: [
              const Icon(Icons.campaign, color: kPrimaryColor),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  kCurrentAnnouncementTitle,
                  style: const TextStyle(color: kAccentColor),
                ),
              ),
            ],
          ),
          content: const Text(
            kCurrentAnnouncementContent,
            style: TextStyle(fontSize: 16),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'KAPAT',
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  // 📲 Telefon / Mail / Web için gerçek yönlendirme
  Future<void> _launchUrl(
      BuildContext context, String actionType, String target) async {
    Uri uri;

    if (actionType == 'Telefon') {
      uri = Uri(scheme: 'tel', path: target);
    } else if (actionType == 'Mail') {
      uri = Uri(scheme: 'mailto', path: target);
    } else {
      uri = Uri.parse(target);
    }

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Bağlantı açılamadı.'),
          backgroundColor: kPrimaryColor,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildMainMenu(context),
            _buildImageSlider(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'ÜRÜN KATEGORİLERİMİZ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: kAccentColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: productCategories.map((title) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: _buildCategoryButton(context, title),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: sliderImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                sliderImages[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text(
                        'Resim Yüklenemedi. Uzantıyı ve dosya adını kontrol edin.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildCustomAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.asset(
              kLogoPath,
              height: 35,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Text(
                  'ARD',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.language, color: kBackgroundColor),
            onPressed: () => _launchUrl(context, 'Web', kWebAddress),
            tooltip: 'Web Sitesi: $kWebAddress',
          ),
          IconButton(
            icon: const Icon(Icons.mail, color: kBackgroundColor),
            onPressed: () => _launchUrl(context, 'Mail', kEmailAddress),
            tooltip: 'E-Posta: $kEmailAddress',
          ),
          IconButton(
            icon: const Icon(Icons.phone, color: kBackgroundColor),
            onPressed: () => _launchUrl(context, 'Telefon', kPhoneNumber),
            tooltip: 'Telefon: $kPhoneNumber',
          ),
        ],
      ),
    );
  }

  Widget _buildMainMenu(BuildContext context) {
    return Container(
      color: kAccentColor,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _MenuTitle(title: 'KURUMSAL'),
          _MenuTitle(title: 'ÜRÜNLER'),
          _MenuTitle(title: 'İLETİŞİM'),
        ],
      ),
    );
  }

  // --- NAVİGASYON YÖNETİMİ ---
  void _handleNavigation(BuildContext context, String title) {
    // KASNAK GRUBU (Triger + düz V)
    if (title == 'Triger Kasnaklar' || title == 'V Kasnaklar') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TrigerKasnaklarPage()),
      );
    }
    // KAPLİNLER
    else if (title == 'Kaplinler') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const KaplinlerPage()),
      );
    }
    // PİNYON DİŞLİLER
    else if (title == 'Pinyon Dişliler') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DislilerPage()),
      );
    }
    // ZİNCİR DİŞLİLER
    else if (title == 'Zincir Dişliler') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ZincirDislilerPage()),
      );
    }
    // ZİNCİRLER
    else if (title == 'Zincirler') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ZincirlerPage()),
      );
    }
    // KRAMAYER DİŞLİLER
    else if (title == 'Kramayer Dişliler') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const KramayerDisliPage()),
      );
    }
    // MOTOR GERGİ RAYLARI
    else if (title == 'Motor Gergi Rayları') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MotorGergiRaylariPage()),
      );
    }
    // KONİK KİLİTLER
    else if (title == 'Konik Kilitler') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const KonikKilitlerPage()),
      );
    }
    // BURÇLU V KASNAKLAR
    else if (title == 'Burçlu V Kasnaklar') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BurcluVKasnaklarPage()),
      );
    }
    // KONİK BURÇLAR
    else if (title == 'Konik Burçlar') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const KonikBurclarPage()),
      );
    }
    // MİL KAMALARI
    else if (title == 'Mil Kamaları') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MilKamalariPage()),
      );
    }
    // Diğer tüm ürünler (Henüz yapılmamış olanlar veya Rulman vb.)
    else {
      _showUnderConstruction(context, title);
    }
  }

  Widget _buildCategoryButton(BuildContext context, String title) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kAccentColor,
        foregroundColor: kBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
      ),
      onPressed: () {
        _handleNavigation(context, title);
      },
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showAction(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$action için yönlendirme henüz aktif değil.'),
        backgroundColor: kPrimaryColor,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _showUnderConstruction(BuildContext context, String category) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$category sayfası yapım aşamasındadır.'),
        backgroundColor: kPrimaryColor,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  final String title;

  const _MenuTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final _HomeScreenState homeState =
        context.findAncestorStateOfType<_HomeScreenState>()!;

    return GestureDetector(
      onTap: () {
        if (title == 'KURUMSAL') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const KurumsalPage()),
          );
        } else if (title == 'ÜRÜNLER') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UrunlerMenuPage()),
          );
        } else if (title == 'İLETİŞİM') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const IletisimPage()),
          );
        } else {
          homeState._showAction(context, '$title Sayfasına Git');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: kBackgroundColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
