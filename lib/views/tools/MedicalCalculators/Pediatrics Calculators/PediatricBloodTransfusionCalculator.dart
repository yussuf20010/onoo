import 'package:flutter/material.dart';

class PediatricBloodTransfusionCalculator extends StatefulWidget {
  const PediatricBloodTransfusionCalculator({super.key});

  @override
  _PediatricBloodTransfusionCalculatorState createState() =>
      _PediatricBloodTransfusionCalculatorState();
}

class _PediatricBloodTransfusionCalculatorState
    extends State<PediatricBloodTransfusionCalculator> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController hemoglobinIncrementController = TextEditingController();
  final TextEditingController hematocritController = TextEditingController();
  double transfusionVolume = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pediatric Blood Transfusion Volume'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: hemoglobinIncrementController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Hemoglobin Increment'),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: hematocritController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Hematocrit'),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: calculateTransfusionVolume,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Transfusion Blood Volume: $transfusionVolume mL',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  void calculateTransfusionVolume() {
    if (weightController.text.isEmpty ||
        hemoglobinIncrementController.text.isEmpty ||
        hematocritController.text.isEmpty) {
      return;
    }

    double weight = double.parse(weightController.text);
    double hemoglobinIncrement = double.parse(hemoglobinIncrementController.text);
    double hematocrit = double.parse(hematocritController.text);

    double transfusionVolume =
        (weight * hemoglobinIncrement * 3 * 100) / hematocrit ;

    setState(() {
      this.transfusionVolume = transfusionVolume;
    });
  }
}
