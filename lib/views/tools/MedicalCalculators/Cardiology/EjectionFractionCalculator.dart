import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import '../../../../config/ad_config.dart';
import '../../../../core/components/app_native_ad.dart';
import '../../../../core/components/banner_ad.dart';
import '../../../../core/constants/app_colors.dart';
import '../MedicalCalcMainClass.dart';


class EjectionFractionCalc extends StatelessWidget {
  const EjectionFractionCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Ejection Fraction Calculator',
        theme: theme,
        darkTheme: darkTheme,
        home: EjectionFractionCalculator(),
      ),
    );
  }
}

class EjectionFractionCalculator extends StatefulWidget {
  const EjectionFractionCalculator({Key? key}) : super(key: key);

  @override
  _EjectionFractionCalculatorState createState() => _EjectionFractionCalculatorState();
}

class _EjectionFractionCalculatorState extends State<EjectionFractionCalculator> {
  double ejectionFraction = 0;

  TextEditingController endDiastolicVolumeController = TextEditingController();
  TextEditingController endSystolicVolumeController = TextEditingController();

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
          'Ejection Fraction Calculator',
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
              controller: endDiastolicVolumeController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'End-Diastolic Volume (mL)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextField(
              controller: endSystolicVolumeController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'End-Systolic Volume (mL)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double edv = double.parse(endDiastolicVolumeController.text);
                  double esv = double.parse(endSystolicVolumeController.text);

                  if (edv > 0) {
                    ejectionFraction = ((edv - esv) / edv) * 100;
                  } else {
                    ejectionFraction = 0;
                  }
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
              'Ejection Fraction: ${ejectionFraction.toStringAsFixed(2)}%',
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
  runApp(EjectionFractionCalc());
}
