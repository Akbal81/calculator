import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart'; // Sensörler için package

class terazi extends StatefulWidget {
  const terazi({super.key});

  @override
  State<terazi> createState() => _terazi();
}

class _terazi extends State<terazi> {
  double yatayaci = 0.0;
  double dikeyaci = 0.0;
  String sonaci = "";
  List<String> _savedValues = [];
  late StreamSubscription<AccelerometerEvent> _subscription;
  bool _isMeasuring = false;

  @override
  void initState() {
    super.initState();
  }

  void _startListening() {
    _subscription = accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        // Hesaplama mantığı
        yatayaci = (event.x / 9.81) * 90; // Yerçekimi ile normalize
        dikeyaci = (event.y / 9.81) * 90; // Yerçekimi ile normalize

        // Yatay açının hesaplanması
        if (yatayaci.abs() < 1 && dikeyaci.abs() < 1) {
          sonaci = "0";
        } else if (yatayaci.abs() > 89 && dikeyaci.abs() > 89) {
          sonaci = "90";
        } else {
          sonaci = (yatayaci.abs() > dikeyaci.abs()
              ? yatayaci
              : dikeyaci).toStringAsFixed(1);
        }

        // Eğer 0 dereceye ters hareket ediliyorsa negatif değer göster
        if (yatayaci < 0) {
          sonaci = "-${yatayaci.abs().toStringAsFixed(1)}";
        } else if (dikeyaci < 0) {
          sonaci = "-${dikeyaci.abs().toStringAsFixed(1)}";
        }
      });
    });
  }

  void _stopListening() {
    _subscription.cancel();
  }

  void _measure() {
    setState(() {
      _isMeasuring = true;
    });
    _startListening();
  }

  void _stopMeasurement() {
    setState(() {
      _isMeasuring = false;
    });
    _stopListening();
  }

  void _saveCurrentValue() {
    if (_savedValues.length < 5) {
      setState(() {
        _savedValues.add(sonaci);
      });
    }
  }

  void _clearSavedValues() {
    setState(() {
      _savedValues.clear();
    });
  }

  void _removeFirstSavedValue() {
    if (_savedValues.length > 4) {
      setState(() {
        _savedValues.removeAt(4);
      });
    } else if (_savedValues.length > 3) {
      setState(() {
        _savedValues.removeAt(3);
      });
    } else if (_savedValues.length > 2) {
      setState(() {
        _savedValues.removeAt(2);
      });
    }else if (_savedValues.length > 1) {
      setState(() {
        _savedValues.removeAt(1);
      });
    }else if (_savedValues.length > 0) {
      setState(() {
        _savedValues.removeAt(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ÖLÇÜM", style: TextStyle(fontFamily: 'Nabla', fontSize: 80),
              ),
              // Ölçüm Değeri yazısını kaldırdık
              Text(sonaci, style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: sonaci.startsWith('-') ? Colors.red : Colors.black,
                  fontSize: 100, // Yazı boyutunu büyüttük
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: _isMeasuring ? null : _measure,
                    child: const Text('Başla', style: TextStyle(fontSize: 50)),
                  ),
                  const SizedBox(height: 50), // Boşluk eklemek için
                  ElevatedButton(
                    onPressed: _isMeasuring ? _stopMeasurement : null,
                    child: const Text('Durdur', style: TextStyle(fontSize: 50)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: _saveCurrentValue,
                    child: const Text('Kaydet', style: TextStyle(fontSize: 50)),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: _removeFirstSavedValue,
                    child: const Text('K. Sil', style: TextStyle(fontSize: 50)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _clearSavedValues,
                    child: const Text('Değerler:', style: TextStyle(fontSize: 50, fontFamily: 'Nabla')),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: _savedValues.map((value) => Text(
                      value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 50, fontFamily: 'Courgette',
                        fontWeight: FontWeight.bold,
                      ),
                    )).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
