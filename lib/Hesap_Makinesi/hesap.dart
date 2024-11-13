import 'dart:core';
import 'package:flutter/material.dart';

class hesap extends StatefulWidget {
  const hesap({super.key});

  @override
  State<hesap> createState() => _hesapState();
}

class _hesapState extends State<hesap> {
  String Veri1 = "";
  String Veri2 = "";
  String Sonuc = "";
  bool veri1aktifmi = true; // Aktif olan veri alanını belirler
  bool ilkveri = false; // İlk veri girilip girilmediğini kontrol eder
  String? currentOperator;
  bool isDecimalAddedVeri1 = false; // Nokta işareti eklenip eklenmediğini kontrol eder
  bool isDecimalAddedVeri2 = false; // Nokta işareti eklenip eklenmediğini kontrol eder

  List<String> _gecmisIslemler = []; // Geçmiş işlemler listesi

  void _appendNumber(String number) {
    setState(() {
      if (veri1aktifmi && Veri1.length < 11) {
        if (number == "." && !isDecimalAddedVeri1) {
          Veri1 += number;
          isDecimalAddedVeri1 = true;
        } else if (number != ".") {
          Veri1 += number;
        }
      } else if (!veri1aktifmi && Veri2.length < 11) {
        if (number == "." && !isDecimalAddedVeri2) {
          Veri2 += number;
          isDecimalAddedVeri2 = true;
        } else if (number != ".") {
          Veri2 += number;
        }
      }
      // Yeni sayı girildiğinde Sonuç'u temizle
      Sonuc = "";
    });
  }

  void _clearData() {
    setState(() {
      Veri1 = "";
      Veri2 = "";
      Sonuc = "";
      veri1aktifmi = true;
      ilkveri = false;
      currentOperator = null;
      isDecimalAddedVeri1 = false;
      isDecimalAddedVeri2 = false;
    });
  }

  void _toggleActiveField() {
    setState(() {
      veri1aktifmi = !veri1aktifmi;
    });
  }

  void _changeData() {
    if (veri1aktifmi && Veri1.isNotEmpty) {
      setState(() {
        veri1aktifmi = false;
        ilkveri = true;
      });
    }
  }

  void _setOperator(String operator) {
    if (veri1aktifmi && Veri1.isNotEmpty) {
      setState(() {
        currentOperator = operator;
        veri1aktifmi = false;
        ilkveri = true;
      });
    }
  }

  void _calculate() {
    if (ilkveri && !veri1aktifmi && Veri2.isNotEmpty && currentOperator != null) {
      double num1 = double.tryParse(Veri1) ?? 0;
      double num2 = double.tryParse(Veri2) ?? 0;
      double result;

      switch (currentOperator) {
        case "+":
          result = num1 + num2;
          break;
        case "-":
          result = num1 - num2;
          break;
        case "x":
          result = num1 * num2;
          break;
        case "/":
          result = num1 / num2;
          break;
        case "%":
          result = num1 % num2;
          break;
        default:
          result = 0;
      }

      setState(() {
        Sonuc = result.toString();
        _gecmisIslemler.add('$Veri1 $currentOperator $Veri2 = $Sonuc'); // İşlemi geçmişe ekle

        // İkinci veri kaydedildiği zaman gösterim için temizleme
        Veri1 = "";
        Veri2 = "";
        veri1aktifmi = true;
        ilkveri = false;
        currentOperator = null;
        isDecimalAddedVeri1 = false;
        isDecimalAddedVeri2 = false;
      });
    }
  }

  void _showGecmis() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Geçmiş İşlemler"),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: ListView.builder(
              itemCount: _gecmisIslemler.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_gecmisIslemler[index]),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      veri1aktifmi ? Veri1 : "",
                      style: const TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      veri1aktifmi ? "" : Veri2,
                      style: const TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          Sonuc,
                          style: const TextStyle(color: Colors.green, fontSize: 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _appendNumber("7");
                    },
                    child: const Text("7", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _appendNumber("8");
                    },
                    child: const Text("8", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _appendNumber("9");
                    },
                    child: const Text("9", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _appendNumber("4");
                    },
                    child: const Text("4", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _appendNumber("5");
                    },
                    child: const Text("5", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _appendNumber("6");
                    },
                    child: const Text("6", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _appendNumber("1");
                    },
                    child: const Text("1", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _appendNumber("2");
                    },
                    child: const Text("2", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _appendNumber("3");
                    },
                    child: const Text("3", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _appendNumber("0");
                    },
                    child: const Text("0", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _appendNumber(".");
                    },
                    child: const Text(".", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (Veri2.isNotEmpty) {
                        _calculate(); // Sonucu hesapla
                      } else {
                        _changeData(); // İlk basışta veri 2'ye geçiş yap
                      }
                    },
                    onLongPress: _showGecmis, // Uzun basıldığında geçmişi göster
                    child: const Text("=", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _setOperator("+");
                    },
                    child: const Text("+", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _setOperator("-");
                    },
                    child: const Text("-", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _setOperator("x");
                    },
                    child: const Text("x", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _setOperator("/");
                    },
                    child: const Text("/", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _setOperator("%");
                    },
                    child: const Text("%", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _clearData();
                    },
                    child: const Text("Sil", style: TextStyle(fontSize: 50, fontFamily: 'Courgette')),
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
