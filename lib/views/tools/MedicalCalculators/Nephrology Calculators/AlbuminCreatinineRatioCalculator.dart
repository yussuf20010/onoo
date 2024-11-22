import 'package:flutter/material.dart';

class AlbuminCreatinineRatioCalculator extends StatefulWidget {
  const AlbuminCreatinineRatioCalculator({super.key});

  @override
  _AlbuminCreatinineRatioCalculatorState createState() =>
      _AlbuminCreatinineRatioCalculatorState();
}

class _AlbuminCreatinineRatioCalculatorState
    extends State<AlbuminCreatinineRatioCalculator> {
  TextEditingController albuminController = TextEditingController();
  TextEditingController urineCreatinineController = TextEditingController();
  double acrResult = 0.0;
  String interpretation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albumin Creatinine Ratio Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: albuminController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Albumin (mg/dL)'),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: urineCreatinineController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Urine Creatinine (mg/dL)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateACR();
              },
              child: const Text('Calculate ACR (mg/g)'),
            ),
            const SizedBox(height: 20),
            Text('ACR (mg/g): $acrResult'),
            const SizedBox(height: 20),
            Text('Interpretation: $interpretation'),
          ],
        ),
      ),
    );
  }

  void calculateACR() {
    double albumin = double.tryParse(albuminController.text) ?? 0.0;
    double urineCreatinine =
        double.tryParse(urineCreatinineController.text) ?? 0.0;

    if (urineCreatinine != 0.0) {
      double acr = (albumin / urineCreatinine);
      setState(() {
        acrResult = acr;
        interpretation = getInterpretation(acr);
      });
    }
  }

  String getInterpretation(double acr) {
    if (acr < 30) {
      return 'Interpretation: A1 - Normal to mildly increased';
    } else if (acr >= 30 && acr <= 300) {
      return 'Interpretation: A2 - Moderately increased';
    } else {
      return 'Interpretation: A3 - Severely increased';
    }
  }
}
