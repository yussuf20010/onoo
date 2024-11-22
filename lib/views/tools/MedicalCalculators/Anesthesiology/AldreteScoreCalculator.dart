import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../MedicalCalcMainClass.dart';


class AldreteScoreCalc extends StatelessWidget {
  const AldreteScoreCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Aldrete Score Calculator',
        theme: theme,
        darkTheme: darkTheme,
        home: AldreteScoreCalculator(),
      ),
    );
  }
}

class AldreteScoreCalculator extends StatefulWidget {
  const AldreteScoreCalculator({Key? key}) : super(key: key);

  @override
  _AldreteScoreCalculatorState createState() => _AldreteScoreCalculatorState();
}

class _AldreteScoreCalculatorState extends State<AldreteScoreCalculator> {
  int consciousnessScore = 0;
  int breathingScore = 0;
  int circulationScore = 0;
  int oxygenSaturationScore = 0;
  int activityScore = 0;
  int totalScore = 0;

  final Map<String, int> consciousnessOptions = {
    'Fully awake': 2,
    'Arousable on calling': 1,
    'Not responding': 0,
  };

  final Map<String, int> breathingOptions = {
    'Spontaneous breathing': 2,
    'Needs assistance': 1,
    'Not breathing': 0,
  };

  final Map<String, int> circulationOptions = {
    'Blood pressure stable': 2,
    'Transient hypertension/hypotension': 1,
    'Systolic < 90 mmHg': 0,
  };

  final Map<String, int> oxygenSaturationOptions = {
    'Oxygen saturation > 92%': 2,
    'Oxygen saturation 90-92%': 1,
    'Oxygen saturation < 90%': 0,
  };

  final Map<String, int> activityOptions = {
    'Able to move all extremities': 2,
    'Able to move two extremities': 1,
    'Paralyzed or unable to move extremities': 0,
  };

  @override
  Widget build(BuildContext context) {
    final TextStyle primaryTextStyle = TextStyle(
      color: Theme.of(context).primaryColor,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        title: Text(
          'Aldrete Score Calculator',
          style: primaryTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Consciousness:',
              style: primaryTextStyle,
            ),
            DropdownButton<String>(
              value: consciousnessScore.toString(),
              onChanged: (String? newValue) {
                setState(() {
                  consciousnessScore = int.parse(newValue!);
                  calculateTotalScore();
                });
              },
              items: consciousnessOptions.keys.map((String option) {
                return DropdownMenuItem<String>(
                  value: consciousnessOptions[option].toString(),
                  child: Text(
                    option,
                    style: primaryTextStyle,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Breathing:',
              style: primaryTextStyle,
            ),
            DropdownButton<String>(
              value: breathingScore.toString(),
              onChanged: (String? newValue) {
                setState(() {
                  breathingScore = int.parse(newValue!);
                  calculateTotalScore();
                });
              },
              items: breathingOptions.keys.map((String option) {
                return DropdownMenuItem<String>(
                  value: breathingOptions[option].toString(),
                  child: Text(
                    option,
                    style: primaryTextStyle,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Circulation:',
              style: primaryTextStyle,
            ),
            DropdownButton<String>(
              value: circulationScore.toString(),
              onChanged: (String? newValue) {
                setState(() {
                  circulationScore = int.parse(newValue!);
                  calculateTotalScore();
                });
              },
              items: circulationOptions.keys.map((String option) {
                return DropdownMenuItem<String>(
                  value: circulationOptions[option].toString(),
                  child: Text(
                    option,
                    style: primaryTextStyle,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Oxygen Saturation:',
              style: primaryTextStyle,
            ),
            DropdownButton<String>(
              value: oxygenSaturationScore.toString(),
              onChanged: (String? newValue) {
                setState(() {
                  oxygenSaturationScore = int.parse(newValue!);
                  calculateTotalScore();
                });
              },
              items: oxygenSaturationOptions.keys.map((String option) {
                return DropdownMenuItem<String>(
                  value: oxygenSaturationOptions[option].toString(),
                  child: Text(
                    option,
                    style: primaryTextStyle,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Activity:',
              style: primaryTextStyle,
            ),
            DropdownButton<String>(
              value: activityScore.toString(),
              onChanged: (String? newValue) {
                setState(() {
                  activityScore = int.parse(newValue!);
                  calculateTotalScore();
                });
              },
              items: activityOptions.keys.map((String option) {
                return DropdownMenuItem<String>(
                  value: activityOptions[option].toString(),
                  child: Text(
                    option,
                    style: primaryTextStyle,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Total Aldrete Score: $totalScore',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Scores of 9 and 10 are considered safe to discharge from PACU. Scores of 7 and less require continuous observation.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateTotalScore() {
    totalScore =
        consciousnessScore + breathingScore + circulationScore + oxygenSaturationScore + activityScore;
  }
}

void main() {
  runApp(AldreteScoreCalc());
}
