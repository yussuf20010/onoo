import 'package:flutter/material.dart';
import 'dart:math';

class GFRCalculator extends StatefulWidget {
  const GFRCalculator({super.key});

  @override
  _GFRCalculatorState createState() => _GFRCalculatorState();
}

class _GFRCalculatorState extends State<GFRCalculator> {
  TextEditingController scrController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool isFemale = false;
  bool isBlack = false;
  double gfrResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GFR Calculator')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Add padding here
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0), // Add padding here
                child: TextField(
                  controller: scrController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Serum Creatinine'),
                ),
              ),
              const SizedBox(height: 5), // Add more space between elements
              Padding(
                padding: const EdgeInsets.all(8.0), // Add padding here
                child: TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
              ),
              const SizedBox(height: 5), // Add more space between elements
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0), // Add padding here
                    child: Text('Female:'),
                  ),
                  Switch(
                    value: isFemale,
                    onChanged: (value) {
                      setState(() {
                        isFemale = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 5), // Add more space between elements
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0), // Add padding here
                    child: Text('Black:'),
                  ),
                  Switch(
                    value: isBlack,
                    onChanged: (value) {
                      setState(() {
                        isBlack = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 5), // Add more space between elements
              ElevatedButton(
                onPressed: calculateGFR,
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 10), // Add more space between elements
              Text('Estimated GFR: $gfrResult'),
            ],
          ),
        ),
      ),
    );
  }

  void calculateGFR() {
    double scr = double.tryParse(scrController.text) ?? 0.0;
    int age = int.tryParse(ageController.text) ?? 0;
    double genderFactor = isFemale ? 0.742 : 1.0;
    double raceFactor = isBlack ? 1.212 : 1.0;

    double gfr = 175 *
        (pow(scr, -1.154)) *
        (pow(age, -0.203)) *
        genderFactor *
        raceFactor;

    setState(() {
      gfrResult = gfr;
    });
  }
}
