import 'package:flutter/material.dart';

class BUNCreatinineRatioCalculator extends StatefulWidget {
  const BUNCreatinineRatioCalculator({super.key});

  @override
  _BUNCreatinineRatioCalculatorState createState() =>
      _BUNCreatinineRatioCalculatorState();
}

class _BUNCreatinineRatioCalculatorState
    extends State<BUNCreatinineRatioCalculator> {
  TextEditingController bunController = TextEditingController();
  TextEditingController creatinineController = TextEditingController();
  double bunCreatinineRatioResult = 0.0;
  String interpretation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BUN Creatinine Ratio Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: bunController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'BUN (Blood Urea Nitrogen)'),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: creatinineController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Creatinine'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateBUNCreatinineRatio();
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text('BUN Creatinine Ratio: $bunCreatinineRatioResult'),
            const SizedBox(height: 20),
            Text('Interpretation: $interpretation'),
          ],
        ),
      ),
    );
  }

  void calculateBUNCreatinineRatio() {
    double bun = double.tryParse(bunController.text) ?? 0.0;
    double creatinine = double.tryParse(creatinineController.text) ?? 0.0;

    if (creatinine != 0.0) {
      double ratio = bun / creatinine;
      setState(() {
        bunCreatinineRatioResult = ratio;
        interpretation = getInterpretation(ratio);
      });
    }
  }

  String getInterpretation(double ratio) {
    if (ratio > 20) {
      return 'Interpretation: >20 indicates a pre-renal cause of Acute Renal Failure (ARF)';
    } else if (ratio >= 10 && ratio <= 20) {
      return 'Interpretation: 10-20 is a normal value or indicates a post-renal cause';
    } else {
      return 'Interpretation: <10 indicates a renal cause of Acute Renal Failure (ARF)';
    }
  }
}
