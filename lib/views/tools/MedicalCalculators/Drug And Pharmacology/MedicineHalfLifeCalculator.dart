import 'package:flutter/material.dart';

class HalfLifeCalculator extends StatefulWidget {
  const HalfLifeCalculator({super.key});

  @override
  _HalfLifeCalculatorState createState() => _HalfLifeCalculatorState();
}

class _HalfLifeCalculatorState extends State<HalfLifeCalculator> {
  double peakConcentration = 0.0;
  double troughConcentration = 0.0;
  double timeInterval = 0.0;
  double eliminationConstant = 0.0;
  double halfLife = 0.0;

  void calculateHalfLife() {
    setState(() {
      if (peakConcentration > troughConcentration && timeInterval > 0) {
        eliminationConstant = (peakConcentration - troughConcentration) / timeInterval;
        halfLife = 0.693 / eliminationConstant;
      } else {
        eliminationConstant = 0;
        halfLife = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Half Life Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                peakConcentration = double.tryParse(value) ?? 0.0;
              },
              decoration: const InputDecoration(labelText: 'Peak Concentration (Cmax) (mcg/mL)'),
            ),
            const SizedBox(height: 12),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                troughConcentration = double.tryParse(value) ?? 0.0;
              },
              decoration: const InputDecoration(labelText: 'Trough Concentration (mcg/mL)'),
            ),
            const SizedBox(height: 12),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                timeInterval = double.tryParse(value) ?? 0.0;
              },
              decoration: const InputDecoration(labelText: 'Time Interval (hrs)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: calculateHalfLife,
              child: Text('Calculate'),
            ),
            const SizedBox(height: 12),
            Text('Elimination Constant: ${eliminationConstant.toStringAsFixed(2)} mcg/mL/hrs'),
            Text('Half-Life: ${halfLife.toStringAsFixed(2)} hours'),
          ],
        ),
      ),
    );
  }
}