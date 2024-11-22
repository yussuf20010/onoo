import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../../../../core/constants/app_colors.dart';
import '../MedicalCalcMainClass.dart';


class PadScoreCalc extends StatelessWidget {
  const PadScoreCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'PADS Score Calculator',
        theme: theme,
        darkTheme: darkTheme,
        home: PadScoreCalculator(),
      ),
    );
  }
}

class PadScoreCalculator extends StatefulWidget {
  const PadScoreCalculator({super.key});

  @override
  _PadScoreCalculatorState createState() => _PadScoreCalculatorState();
}

class _PadScoreCalculatorState extends State<PadScoreCalculator> {
  int vitalSignsScore = 0;
  int activityMentalStatusScore = 0;
  int painNauseaScore = 0;
  int surgicalBleedingScore = 0;
  int intakeOutputScore = 0;
  int totalScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgrounDark,
        title: Text(
          'PADS Score Calculator',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vital Signs:',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            DropdownButton<int>(
              value: vitalSignsScore,
              onChanged: (int? newValue) {
                setState(() {
                  vitalSignsScore = newValue!;
                  calculateTotalScore();
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text(
                    'Within 20% of preoperative value (2)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text(
                    '20%-40% of preoperative value (1)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text(
                    '> 40% preoperative value (0)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Activity and Mental Status:',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            DropdownButton<int>(
              value: activityMentalStatusScore,
              onChanged: (int? newValue) {
                setState(() {
                  activityMentalStatusScore = newValue!;
                  calculateTotalScore();
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text(
                    'Oriented × 3 AND has a steady gait (2)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text(
                    'Oriented × 3 OR has a steady gait (1)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Neither (0)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Pain, Nausea, and/or Vomiting:',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            DropdownButton<int>(
              value: painNauseaScore,
              onChanged: (int? newValue) {
                setState(() {
                  painNauseaScore = newValue!;
                  calculateTotalScore();
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text(
                    'Minimal (2)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text(
                    'Moderate, having required treatment (1)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Severe, requiring treatment (0)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Surgical Bleeding:',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            DropdownButton<int>(
              value: surgicalBleedingScore,
              onChanged: (int? newValue) {
                setState(() {
                  surgicalBleedingScore = newValue!;
                  calculateTotalScore();
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text(
                    'Minimal (2)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text(
                    'Moderate (1)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Severe (0)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Intake and Output:',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            DropdownButton<int>(
              value: intakeOutputScore,
              onChanged: (int? newValue) {
                setState(() {
                  intakeOutputScore = newValue!;
                  calculateTotalScore();
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text(
                    'Has had PO fluids AND voided (2)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text(
                    'Has had PO fluids OR voided (1)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Neither (0)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Total PADS Score: $totalScore',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            if (totalScore >= 9)
              Text(
                'Scores of 9 or 10 mean the patient can be safely discharged.',
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
    totalScore = vitalSignsScore +
        activityMentalStatusScore +
        painNauseaScore +
        surgicalBleedingScore +
        intakeOutputScore;
  }
}
