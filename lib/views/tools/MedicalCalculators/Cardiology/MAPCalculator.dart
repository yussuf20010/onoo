import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../../../../config/ad_config.dart';
import '../../../../core/components/app_native_ad.dart';
import '../../../../core/constants/app_colors.dart';
import '../MedicalCalcMainClass.dart';

class MAPCalc extends StatelessWidget {
  const MAPCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Mean Arterial Pressure Calculator',
        theme: theme,
        darkTheme: darkTheme,
        home: MAPCalculator(),
      ),
    );
  }
}

class MAPCalculator extends StatefulWidget {
  const MAPCalculator({Key? key}) : super(key: key);

  @override
  _MAPCalculatorState createState() => _MAPCalculatorState();
}

class _MAPCalculatorState extends State<MAPCalculator> {
  double meanArterialPressure = 0;

  TextEditingController systolicController = TextEditingController();
  TextEditingController diastolicController = TextEditingController();

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
          'Mean Arterial Pressure Calculator',
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
                labelText: 'Systolic Pressure (mm Hg)',
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
                labelText: 'Diastolic Pressure (mm Hg)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double systolicPressure = double.tryParse(systolicController.text) ?? 0;
                  double diastolicPressure = double.tryParse(diastolicController.text) ?? 0;

                  meanArterialPressure = (2 * diastolicPressure + systolicPressure) / 3;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              child: const Text('Calculate MAP'),
            ),
            const SizedBox(height: 16),
            Text(
              'Mean Arterial Pressure (MAP): ${meanArterialPressure.toStringAsFixed(2)} mm Hg',
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
  runApp(MAPCalc());
}
