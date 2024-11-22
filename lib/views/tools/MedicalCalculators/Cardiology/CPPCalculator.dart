import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../../../config/ad_config.dart';
import '../../../../core/components/app_native_ad.dart';
import '../../../../core/constants/app_colors.dart';
import '../MedicalCalcMainClass.dart';

class CPPCalc extends StatelessWidget {
  const CPPCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Coronary Perfusion Pressure Calculator',
        theme: theme,
        darkTheme: darkTheme,
        home: CPPCalculator(),
      ),
    );
  }
}

class CPPCalculator extends StatefulWidget {
  @override
  _CPPCalculatorState createState() => _CPPCalculatorState();
}

class _CPPCalculatorState extends State<CPPCalculator> {
  double coronaryPerfusionPressure = 0;

  TextEditingController dbpController = TextEditingController();
  TextEditingController pcwpController = TextEditingController();

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
          'Coronary Perfusion Pressure Calculator',
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
              controller: dbpController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Diastolic Blood Pressure (DBP)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextField(
              controller: pcwpController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Pulmonary Capillary Wedge Pressure (PCWP)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double dbp = double.tryParse(dbpController.text) ?? 0;
                  double pcwp = double.tryParse(pcwpController.text) ?? 0;

                  coronaryPerfusionPressure = dbp - pcwp;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              child: const Text('Calculate CPP'),
            ),
            const SizedBox(height: 16),
            Text(
              'Coronary Perfusion Pressure (CPP): ${coronaryPerfusionPressure.toStringAsFixed(2)} mm Hg',
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
  runApp(CPPCalc());
}
