import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import '../../../../config/ad_config.dart';
import '../../../../core/components/app_native_ad.dart';
import '../../../../core/components/banner_ad.dart';
import '../../../../core/constants/app_colors.dart';
import '../MedicalCalcMainClass.dart';


class CardiacOutputCalc extends StatelessWidget {
  const CardiacOutputCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Cardiac Output Calculator',
        theme: theme,
        darkTheme: darkTheme,
        home: CardiacOutputCalculator(),
      ),
    );
  }
}

class CardiacOutputCalculator extends StatefulWidget {
  const CardiacOutputCalculator({Key? key}) : super(key: key);

  @override
  _CardiacOutputCalculatorState createState() => _CardiacOutputCalculatorState();
}

class _CardiacOutputCalculatorState extends State<CardiacOutputCalculator> {
  double cardiacOutput = 0;

  TextEditingController heartRateController = TextEditingController();
  TextEditingController strokeVolumeController = TextEditingController();

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
          'Cardiac Output Calculator',
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
              controller: heartRateController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Heart Rate (bpm)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextField(
              controller: strokeVolumeController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Stroke Volume (mL/beat)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double heartRate = double.parse(heartRateController.text);
                  double strokeVolume = double.parse(strokeVolumeController.text);

                  cardiacOutput = heartRate * strokeVolume;
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
              'Cardiac Output: ${cardiacOutput.toStringAsFixed(2)} mL/min',
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
  runApp(CardiacOutputCalc());
}
