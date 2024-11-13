import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hesap_makinesi/Hesap_Makinesi/anasayfa.dart';

void main() {
  runApp(BaslangicEkrani());
}

class BaslangicEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emin Züccaciye',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AcilisEkrani(),
      routes: {
        '/AltBar': (context) => Anasayfa(),
      },
    );
  }
}

class AcilisEkrani extends StatefulWidget {
  @override
  _AcilisEkraniState createState() => _AcilisEkraniState();
}

class _AcilisEkraniState extends State<AcilisEkrani> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/Anasayfa');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Center(
        child: Image.asset('',width: 100,height: 100,),
      ),
    );
  }
}
