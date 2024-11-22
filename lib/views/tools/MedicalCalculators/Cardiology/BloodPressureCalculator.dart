import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../../../config/ad_config.dart';
import '../../../../core/components/app_native_ad.dart';
import '../../../../core/constants/app_colors.dart';
import '../MedicalCalcMainClass.dart';

class BloodPressureCalc extends StatelessWidget {
  const BloodPressureCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Blood Pressure Calculator',
        theme: theme,
        darkTheme: darkTheme,
        home: BloodPressureCalculator(),
      ),
    );
  }
}

class BloodPressureCalculator extends StatefulWidget {
  @override
  _BloodPressureCalculatorState createState() =>
      _BloodPressureCalculatorState();
}

class _BloodPressureCalculatorState extends State<BloodPressureCalculator> {
  int systolicPressure = 120;
  int diastolicPressure = 80;
  double meanArterialPressure = 0;
  String bloodPressureStatus = '';
  int pulsePressure = 0;

  TextEditingController systolicController = TextEditingController();
  TextEditingController diastolicController = TextEditingController();

  @override
  void dispose() {
    systolicController.dispose();
    diastolicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgrounDark,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        title: Text(
          'Blood Pressure Calculator',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: systolicController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Systolic Pressure (mmHg)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextField(
              controller: diastolicController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Diastolic Pressure (mmHg)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  systolicPressure =
                      int.tryParse(systolicController.text) ?? 120;
                  diastolicPressure =
                      int.tryParse(diastolicController.text) ?? 80;

                  // Calculate Mean Arterial Pressure (MAP)
                  meanArterialPressure =
                      (systolicPressure + 2 * diastolicPressure) / 3.0;

                  // Determine Blood Pressure Status
                  if (systolicPressure < 90 || diastolicPressure < 60) {
                    bloodPressureStatus = 'Low Blood Pressure (Hypotension)';
                  } else if (systolicPressure < 120 && diastolicPressure < 80) {
                    bloodPressureStatus = 'Normal Blood Pressure';
                  } else if (systolicPressure < 140 || diastolicPressure < 90) {
                    bloodPressureStatus = 'Prehypertension';
                  } else {
                    bloodPressureStatus = 'Hypertension';
                  }

                  // Calculate Pulse Pressure (PP)
                  pulsePressure = systolicPressure - diastolicPressure;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16),
            Text(
              'Blood Pressure: $systolicPressure/$diastolicPressure mmHg',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              'Mean Arterial Pressure (MAP): ${meanArterialPressure.toStringAsFixed(2)} mmHg',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              'Blood Pressure Status: $bloodPressureStatus',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              'Pulse Pressure (PP): $pulsePressure mmHg',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(BloodPressureCalc());
}
