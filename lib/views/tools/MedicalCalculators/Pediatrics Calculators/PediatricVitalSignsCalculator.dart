import 'package:flutter/material.dart';

class VitalSignsCalculator extends StatefulWidget {
  const VitalSignsCalculator({Key? key}) : super(key: key);

  @override
  _VitalSignsCalculatorState createState() => _VitalSignsCalculatorState();
}

class _VitalSignsCalculatorState extends State<VitalSignsCalculator> {
  late double age;
  String heartRateAwakeRange = '';
  String heartRateAsleepRange = '';
  String respiratoryRateRange = '';
  String systolicBPRange = '';
  String diastolicBPRange = '';

  @override
  void initState() {
    super.initState();
    age = 0.0; // Initialize age with a default value
  }

  void calculateVitalSigns() {
    if (age != null) {
      if (age < 1) {
        heartRateAwakeRange = '100 - 205 bpm';
        heartRateAsleepRange = '90 - 160 bpm';
        respiratoryRateRange = '30 - 53 bpm';
        systolicBPRange = '39 - 59 mmHg';
        diastolicBPRange = '16 - 36 mmHg';
      } else if (age < 3) {
        heartRateAwakeRange = '100 - 205 bpm';
        heartRateAsleepRange = '90 - 160 bpm';
        respiratoryRateRange = '30 - 53 bpm';
        systolicBPRange = '60 - 84 mmHg';
        diastolicBPRange = '31 - 53 mmHg';
      } else if (age >= 1 && age <= 12) {
        heartRateAwakeRange = '100 - 190 bpm';
        heartRateAsleepRange = '90 - 160 bpm';
        respiratoryRateRange = '30 - 53 bpm';
        systolicBPRange = '72 - 104 mmHg';
        diastolicBPRange = '37 - 56 mmHg';
      } else if (age >= 12 && age <= 24) {
        heartRateAwakeRange = '98 - 140 bpm';
        heartRateAsleepRange = '80 - 120 bpm';
        respiratoryRateRange = '22 - 37 bpm';
        systolicBPRange = '86 - 106 mmHg';
        diastolicBPRange = '42 - 63 mmHg';
      } else if (age >= 24 && age <= 60) {
        heartRateAwakeRange = '80 - 120 bpm';
        heartRateAsleepRange = '65 - 100 bpm';
        respiratoryRateRange = '20 - 28 bpm';
        systolicBPRange = '89 - 112 mmHg';
        diastolicBPRange = '46 - 72 mmHg';
      } else if (age >= 60 && age <= 108) {
        heartRateAwakeRange = '75 - 118 bpm';
        heartRateAsleepRange = '58 - 90 bpm';
        respiratoryRateRange = '18 - 25 bpm';
        systolicBPRange = '97 - 115 mmHg';
        diastolicBPRange = '57 - 76 mmHg';
      } else if (age >= 108 && age <= 180) {
        heartRateAwakeRange = '75 - 118 bpm';
        heartRateAsleepRange = '58 - 90 bpm';
        respiratoryRateRange = '18 - 25 bpm';
        systolicBPRange = '102 - 120 mmHg';
        diastolicBPRange = '61 - 80 mmHg';
      } else {
        heartRateAwakeRange = '60 - 100 bpm';
        heartRateAsleepRange = '50 - 90 bpm';
        respiratoryRateRange = '12 - 20 bpm';
        systolicBPRange = '110 - 131 mmHg';
        diastolicBPRange = '64 - 83 mmHg';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pediatric Vital Signs Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Patient\'s Age (in months)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final parsedAge = double.tryParse(value);
                if (parsedAge != null) {
                  setState(() {
                    age = parsedAge;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateVitalSigns();
                setState(() {}); // Refresh the UI
              },
              child: const Text('Calculate Vital Signs'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Normal Range Vital Signs:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text('Heart Rate (Awake): $heartRateAwakeRange'),
            const SizedBox(height: 5),
            Text('Heart Rate (Asleep): $heartRateAsleepRange'),
            const SizedBox(height: 5),
            Text('Respiratory Rate: $respiratoryRateRange'),
            const SizedBox(height: 5),
            Text('Systolic Blood Pressure: $systolicBPRange'),
            const SizedBox(height: 5),
            Text('Diastolic Blood Pressure: $diastolicBPRange'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VitalSignsCalculator(),
  ));
}
