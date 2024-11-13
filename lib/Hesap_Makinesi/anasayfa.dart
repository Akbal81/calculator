import 'package:flutter/material.dart';
import 'package:hesap_makinesi/Hesap_Makinesi/ayarlar.dart';
import 'package:hesap_makinesi/Hesap_Makinesi/kronometre.dart';
import 'package:hesap_makinesi/Hesap_Makinesi/özelleştir.dart';
import 'package:hesap_makinesi/Hesap_Makinesi/hesap.dart';
import 'package:hesap_makinesi/Hesap_Makinesi/su_terazisi.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  // Sayfalar
  var sayfalar = [const kronometre(), const hesap(), const terazi(), const ozellik(), const ayarlar()];

  // Sayfa isimleri
  final List<String> sayfaIsimleri = ['Kronometre', 'Hesap', 'Terazi', 'Özellik','Ayarlar'];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          sayfaIsimleri[_selectedIndex],
          style: const TextStyle(fontFamily: "Nabla"),
        ),
        backgroundColor: Colors.black,
      ),
      body: sayfalar[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.screen_rotation_alt), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit_sharp), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        backgroundColor: Colors.black,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.cyan[500],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
