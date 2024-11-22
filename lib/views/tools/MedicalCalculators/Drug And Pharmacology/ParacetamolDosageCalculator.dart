import 'package:flutter/material.dart';

class PediatricParacetamolSyrupCalculator extends StatefulWidget {
  @override
  _PediatricParacetamolSyrupCalculatorState createState() => _PediatricParacetamolSyrupCalculatorState();
}

class _PediatricParacetamolSyrupCalculatorState extends State<PediatricParacetamolSyrupCalculator> {
  double weight = 0.0;
  double dosage = 0.0;
  String selectedFormula = 'Infant Syrup (120 mg/5 mL)';
  Map<String, double> formulaDosages = {
    'Infant Syrup (120 mg/5 mL)': 120,
    'Six plus syrup (250 mg/5 mL)': 250,
  };

  void calculateDosage() {
    setState(() {
      if (weight > 0) {
        // Calculate the recommended dosage
        double maxDosage = 60; // Maximum daily dosage in mg
        double formulaDosage = formulaDosages[selectedFormula] ?? 0;
        dosage = weight * 15 * 5 / formulaDosage; // Initial dosage based on weight and formula
        if (dosage > maxDosage) {
          dosage = maxDosage; // Limit dosage to the maximum daily dosage
        }
      } else {
        dosage = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pediatric Paracetamol Syrub Dosage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                weight = double.tryParse(value) ?? 0.0;
              },
              decoration: InputDecoration(labelText: 'Child\'s Weight (kg)'),
            ),
            const SizedBox(height: 12),
            DropdownButton<String>(
              value: selectedFormula,
              onChanged: (value) {
                setState(() {
                  selectedFormula = value!;
                });
              },
              items: formulaDosages.keys.map((String formula) {
                return DropdownMenuItem<String>(
                  value: formula,
                  child: Text(formula),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateDosage,
              child: Text('Calculate Dosage'),
            ),
            const SizedBox(height: 16),
            // Text('Selected Formula: $selectedFormula'),
            Text('Recommended Dosage: ${dosage.toStringAsFixed(2)} mL per dose'),
            const SizedBox(height: 4),
            Text('Note : Maximum Daily Dosage: 60 mg/kg'),
            const SizedBox(height: 4),
            Text('Note : Maximum Daily Dosage for Child: 4 g (if less than 65 kg)'),
          ],
        ),
      ),
    );
  }
}
