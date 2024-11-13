import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class kronometre extends StatefulWidget {
  const kronometre({super.key});

  @override
  _kronometreState createState() => _kronometreState();
}

class _kronometreState extends State<kronometre> {
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _formattedTime = "00:00:0";
  List<String> _savedTimes = [];
  String? _highlightedTime;


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 100), _updateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime(Timer timer) {
    if (_stopwatch.isRunning) {
      final int elapsedMilliseconds = _stopwatch.elapsedMilliseconds;
      final int totalSalise = elapsedMilliseconds ~/ 10; // Total salise
      final int seconds = totalSalise ~/ 100; // Saniye hesaplamak için
      final int minutes = seconds ~/ 60; // Dakika hesaplamak için
      final int remainingSeconds = seconds % 60; // Kalan saniye
      final int salise = totalSalise % 100; // Salise değeri

      if (minutes >= 99) {
        _stop();
      } else {
        setState(() {
          _formattedTime = "${_twoDigit(minutes)}:${_twoDigit(remainingSeconds)}:${_oneDigit(salise ~/ 10)}";
        });
      }
    }
  }

  String _twoDigit(int n) => n.toString().padLeft(2, '0');
  String _oneDigit(int n) => n.toString().padLeft(1, '0');

  void _start() {
    setState(() {
      _stopwatch.start();
    });
  }

  void _stop() {
    setState(() {
      _stopwatch.stop();
    });
  }

  void _reset() {
    setState(() {
      _stopwatch.reset();
      _formattedTime = "00:00:0";
    });
  }

  void _saveTime() {
    setState(() {
      if (_savedTimes.length < 10) {
        _savedTimes.add(_formattedTime);
      }
    });
  }

  void _deleteTime() {
    setState(() {
      if (_savedTimes.isNotEmpty) {
        _savedTimes.removeLast();
        _highlightedTime = null;
      }
    });
  }

  void _resetAndClear() {
    setState(() {
      _stopwatch.reset();
      _formattedTime = "00:00:00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: PageStorageBucket(), // Sayfa değişiminde durumu saklamak için PageStorageBucket kullanıyoruz.
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "",
                    style: TextStyle(fontFamily: 'Nabla', fontSize: 50),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                _formattedTime,
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: !_stopwatch.isRunning ? _start : null,
                    child: const Text('Başla', style: TextStyle(fontSize: 24)),
                  ),
                  ElevatedButton(
                    onPressed: _stopwatch.isRunning ? _stop : null,
                    child: const Text('Durdur', style: TextStyle(fontSize: 24)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _resetAndClear();
                      _stop();
                    },
                    child: const Text('Sıfırla', style: TextStyle(fontSize: 24)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _saveTime,
                    child: const Text('Kaydet', style: TextStyle(fontSize: 24)),
                  ),
                  ElevatedButton(
                    onPressed: _deleteTime,
                    child: const Text('Sil', style: TextStyle(fontSize: 24)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: _savedTimes.isEmpty
                      ? [Center(child: Text("Kayıtlı zaman yok", style: TextStyle(fontSize: 24, fontFamily: 'BadScript')))]
                      : _savedTimes.map((time) {
                    final isHighlighted = time == _highlightedTime;
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _highlightedTime = isHighlighted ? null : time;
                          });
                        },
                        child: Text(
                          time,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Courgette',
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
