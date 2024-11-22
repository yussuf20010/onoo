import 'package:flutter/material.dart';

class DailyDosageCalculator extends StatefulWidget {
  @override
  _DailyDosageCalculatorState createState() => _DailyDosageCalculatorState();
}

class _DailyDosageCalculatorState extends State<DailyDosageCalculator> {
  double doseInMgKg = 0.0;
  double patientWeightKg = 0.0;
  // String selectedFrequency = 'qD';
  double totalDailyDose = 0.0;

  // Map<String, String> frequencyInterpretations = {
  //   'qD': 'Once a day',
  //   'BID': 'Twice a day',
  //   'TID': 'Three times a day',
  //   'QID': 'Four times a day',
  //   'q8 hr': 'Every 8 hours',
  //   'q6 hr': 'Every 6 hours',
  //   'q4 hr': 'Every 4 hours',
  //   'q3 hr': 'Every 3 hours',
  //   'q2 hr': 'Every 2 hours',
  //   'q1 hr': 'Every 1 hour',
  // };

  double frequencyMultiplier(String frequency) {
    if (frequency.startsWith('q')) {
      int? hours = int.tryParse(frequency.substring(1));
      if (hours != null) {
        return 24.0 / hours;
      }
    }
    return 1.0;
  }

  void calculateDoses() {
    setState(() {
      totalDailyDose = doseInMgKg * patientWeightKg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Dosage Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                doseInMgKg = double.tryParse(value) ?? 0.0;
              },
              decoration: InputDecoration(labelText: 'Dose (mg/kg)'),
            ),
            SizedBox(height: 12),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                patientWeightKg = double.tryParse(value) ?? 0.0;
              },
              decoration: InputDecoration(labelText: 'Patient Weight (kg)'),
            ),
            // DropdownButton<String>(
            //   value: selectedFrequency,
            //   items: frequencyInterpretations.keys.map((freq) {
            //     return DropdownMenuItem<String>(
            //       value: freq,
            //       child: Text(frequencyInterpretations[freq]!),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       selectedFrequency = value!;
            //     });
            //   },
            //   hint: Text('Select Dose Frequency'),
            // ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateDoses,
              child: Text('Calculate'),
            ),
            SizedBox(height: 16),
            Text('Total Daily Dose (mg/day): $totalDailyDose'),
          ],
        ),
      ),
    );
  }
}