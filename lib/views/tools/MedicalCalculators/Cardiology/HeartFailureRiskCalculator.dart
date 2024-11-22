import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../../../../config/ad_config.dart';
import '../../../../core/components/app_native_ad.dart';
import '../../../../core/components/banner_ad.dart';
import '../../../../core/constants/app_colors.dart';
import '../MedicalCalcMainClass.dart';



class HeartFailureRiskCalc extends StatelessWidget {
  const HeartFailureRiskCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Heart Failure Risk Calculator',
        theme: theme,
        darkTheme: darkTheme,
        home: HeartFailureRiskCalculator(),
      ),
    );
  }
}

class HeartFailureRiskCalculator extends StatefulWidget {
  const HeartFailureRiskCalculator({Key? key}) : super(key: key);

  @override
  _HeartFailureRiskCalculatorState createState() =>
      _HeartFailureRiskCalculatorState();
}

class _HeartFailureRiskCalculatorState
    extends State<HeartFailureRiskCalculator> {
  double heartFailureRisk = 0;

  TextEditingController ageController = TextEditingController();
  TextEditingController hypertensionController = TextEditingController();
  TextEditingController diabetesController = TextEditingController();

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
          'Heart Failure Risk Calculator',
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
              controller: ageController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Age',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextField(
              controller: hypertensionController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Hypertension (0 or 1)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextField(
              controller: diabetesController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Diabetes (0 or 1)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int age = int.tryParse(ageController.text) ?? 0;
                  int hypertension =
                      int.tryParse(hypertensionController.text) ?? 0;
                  int diabetes = int.tryParse(diabetesController.text) ?? 0;

                  // A simplified risk calculation (not clinical)
                  heartFailureRisk =
                      (age * 0.02) + (hypertension * 0.5) + (diabetes * 0.5);
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              child: const Text('Calculate Risk'),
            ),
            const SizedBox(height: 16),
            Text(
              'Estimated Heart Failure Risk: ${heartFailureRisk.toStringAsFixed(2)}%',
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
  runApp(HeartFailureRiskCalc());
}
