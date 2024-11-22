import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../../../../config/ad_config.dart';
import '../../../../core/components/app_native_ad.dart';
import '../../../../core/constants/app_colors.dart';
import '../MedicalCalcMainClass.dart';

class LAPCalc extends StatelessWidget {
  const LAPCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Left Atrial Pressure Calculator',
        theme: theme,
        darkTheme: darkTheme,
        home: LAPCalculator(),
      ),
    );
  }
}

class LAPCalculator extends StatefulWidget {
  const LAPCalculator({Key? key}) : super(key: key);

  @override
  _LAPCalculatorState createState() => _LAPCalculatorState();
}

class _LAPCalculatorState extends State<LAPCalculator> {
  double leftAtrialPressure = 0;
  TextEditingController sbpController = TextEditingController();
  TextEditingController mrVMaxController = TextEditingController();

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
          'Left Atrial Pressure Calculator',
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
              controller: sbpController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Systolic Blood Pressure (SBP)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextField(
              controller: mrVMaxController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Maximum Mitral Regurgitation Velocity (MR VMAX)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double sbp = double.tryParse(sbpController.text) ?? 0;
                  double mrVMax = double.tryParse(mrVMaxController.text) ?? 0;

                  leftAtrialPressure = sbp - 4 * (mrVMax * mrVMax);
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              child: const Text('Calculate LAP'),
            ),
            const SizedBox(height: 16),
            Text(
              'Estimated Left Atrial Pressure (LAP): ${leftAtrialPressure.toStringAsFixed(2)} mmHg',
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
  runApp(LAPCalc());
}
