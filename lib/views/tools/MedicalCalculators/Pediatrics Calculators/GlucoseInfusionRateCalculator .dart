import 'package:flutter/material.dart';

class GIRCalculator extends StatefulWidget {
  const GIRCalculator({super.key});

  @override
  _GIRCalculatorState createState() => _GIRCalculatorState();
}

class _GIRCalculatorState extends State<GIRCalculator> {
  late double dextroseInfusionRate;
  late double dextroseConcentration;
  late double weightInKg;
  double calculatedGIR = 0.0;

  void calculateGIR() {
    if (dextroseInfusionRate != null && dextroseConcentration != null && weightInKg != null) {
      setState(() {
        calculatedGIR = (dextroseInfusionRate * dextroseConcentration * 10) / (weightInKg * 60);
      });
    } else {
      setState(() {
        calculatedGIR = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glucose Infusion Rate (GIR) Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Dextrose Infusion Rate (mL/h)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                dextroseInfusionRate = double.tryParse(value)!;
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Dextrose Concentration (%)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                dextroseConcentration = double.tryParse(value)!;
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Weight in Kg'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                weightInKg = double.tryParse(value)!;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateGIR();
              },
              child: const Text('Calculate GIR'),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Glucose Infusion Rate (GIR): $calculatedGIR mL/kg/min',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
