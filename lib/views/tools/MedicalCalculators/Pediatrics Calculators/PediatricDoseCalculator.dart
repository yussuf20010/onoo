import 'package:flutter/material.dart';

class PediatricDoseCalculator extends StatefulWidget {
  const PediatricDoseCalculator({super.key});

  @override
  _PediatricDoseCalculatorState createState() => _PediatricDoseCalculatorState();
}

class _PediatricDoseCalculatorState extends State<PediatricDoseCalculator> {
  double adultDose = 0.0;
  double childWeight = 0.0;
  double totalDailyDose = 0.0;

  void calculateTotalDailyDose() {
    setState(() {
      if (adultDose > 0 && childWeight > 0) {
        totalDailyDose = adultDose * childWeight;
      } else {
        totalDailyDose = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Daily Pediatric Dose Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Adult Dose (mg/kg)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  adultDose = double.parse(value);
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Child Weight (kg)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  childWeight = double.parse(value);
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: calculateTotalDailyDose,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Daily Dose: $totalDailyDose mg',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}