import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import '../../../../config/ad_config.dart';
import '../../../../core/components/app_native_ad.dart';
import '../../../../core/constants/app_colors.dart';
import '../MedicalCalcMainClass.dart';

class GlasgowComaScaleCalc extends StatelessWidget {
  const GlasgowComaScaleCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Glasgow Coma Scale Calculator',
        theme: theme,
        darkTheme: darkTheme,
        home: GCSCalculator(),
      ),
    );
  }
}

class GCSCalculator extends StatefulWidget {
  const GCSCalculator({super.key});

  @override
  _GCSCalculatorState createState() => _GCSCalculatorState();
}

class _GCSCalculatorState extends State<GCSCalculator> {
  int glasgowComaScore = 0;
  int eyeResponse = 0;
  int verbalResponse = 0;
  int motorResponse = 0;

  final List<Map<String, dynamic>> eyeOptions = [
    {'option': 'Spontaneous', 'score': 4},
    {'option': 'In response to sound', 'score': 3},
    {'option': 'In response to pressure', 'score': 2},
    {'option': 'No eye opening', 'score': 1},
  ];

  final List<Map<String, dynamic>> verbalOptions = [
    {'option': 'Orientated response', 'score': 5},
    {'option': 'Confused response', 'score': 4},
    {'option': 'Inappropriate words', 'score': 3},
    {'option': 'Incomprehensible speech', 'score': 2},
    {'option': 'No verbal response', 'score': 1},
  ];

  final List<Map<String, dynamic>> motorOptions = [
    {'option': 'Obeying commands', 'score': 6},
    {'option': 'Localizes pain stimulation', 'score': 5},
    {'option': 'Withdrawal from pain', 'score': 4},
    {'option': 'Flexor response to pain', 'score': 3},
    {'option': 'Extension response to pain', 'score': 2},
    {'option': 'No motor response', 'score': 1},
  ];

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
          'Glasgow Coma Scale Calculator',
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
            dropdown(
              'Select Eye Response',
              eyeOptions,
              eyeResponse,
                  (val) => setState(() => eyeResponse = val!),
            ),
            dropdown(
              'Select Verbal Response',
              verbalOptions,
              verbalResponse,
                  (val) => setState(() => verbalResponse = val!),
            ),
            dropdown(
              'Select Motor Response',
              motorOptions,
              motorResponse,
                  (val) => setState(() => motorResponse = val!),
            ),
            ElevatedButton(
              child: Text('Calculate GCS'),
              onPressed: () {
                setState(() {
                  glasgowComaScore = eyeResponse + verbalResponse + motorResponse;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
            Text(
              'Glasgow Coma Score: $glasgowComaScore',
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

  DropdownButton<int?> dropdown(
      String hint,
      List<Map<String, dynamic>> options,
      int? selected,
      void Function(int?) onChanged,
      ) {
    return DropdownButton<int?>(
      hint: Text(
        hint,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      value: selected == 0 ? null : selected,
      items: options.map((option) {
        return DropdownMenuItem<int?>(
          value: option['score'],
          child: Text('${option['option']} (+${option['score'].toString()})'),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}