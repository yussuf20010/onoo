import 'package:flutter/material.dart';
import 'dart:math';

class TriSSCalc extends StatelessWidget {
  const TriSSCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRISS Calculator',
      home: TriSSCalculator(),
    );
  }
}

class TriSSCalculator extends StatefulWidget {
  @override
  _TriSSCalculatorState createState() => _TriSSCalculatorState();
}

class _TriSSCalculatorState extends State<TriSSCalculator> {
  double glasgowComaScale = 0.0;
  double systolicBloodPressure = 0.0;
  double respiratoryRate = 0.0;
  int headNeckInjury = 0;
  int faceInjury = 0;
  int thoraxInjury = 0;
  int abdomenInjury = 0;
  int extremitiesInjury = 0;
  int externalInjury = 0;
  double ageInYears = 0.0;
  double survivalProbability = 0.0;

  final List<String> issChoices = [
    'None (0 p)',
    'Minor (1 p)',
    'Moderate (2 p)',
    'Serious (3 p)',
    'Severe (4 p)',
    'Critical (5 p)',
    'Unsurvivable (6 p)',
  ];

  int calculateISS() {
    return headNeckInjury + faceInjury + thoraxInjury + abdomenInjury + extremitiesInjury + externalInjury;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TRISS Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Revised Trauma Score (RTS):'),
              Text('Glasgow Coma Scale (3-15):'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    glasgowComaScale = double.tryParse(value) ?? 0.0;
                    calculateSurvivalProbability();
                  });
                },
              ),
              Text('Systolic Blood Pressure (BP):'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    systolicBloodPressure = double.tryParse(value) ?? 0.0;
                    calculateSurvivalProbability();
                  });
                },
              ),
              Text('Respiratory Rate:'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    respiratoryRate = double.tryParse(value) ?? 0.0;
                    calculateSurvivalProbability();
                  });
                },
              ),
              SizedBox(height: 16),
              Text('Injury Severity Score (ISS):'),
              Text('Head and Neck Injury:'),
              DropdownButton<int>(
                value: headNeckInjury,
                onChanged: (int? newValue) {
                  setState(() {
                    headNeckInjury = newValue!;
                    calculateSurvivalProbability();
                  });
                },
                items: issChoices.map((String choice) {
                  return DropdownMenuItem<int>(
                    value: issChoices.indexOf(choice),
                    child: Text(choice),
                  );
                }).toList(),
              ),
              Text('Face Injury:'),
              DropdownButton<int>(
                value: faceInjury,
                onChanged: (int? newValue) {
                  setState(() {
                    faceInjury = newValue!;
                    calculateSurvivalProbability();
                  });
                },
                items: issChoices.map((String choice) {
                  return DropdownMenuItem<int>(
                    value: issChoices.indexOf(choice),
                    child: Text(choice),
                  );
                }).toList(),
              ),
              Text('Thorax Injury:'),
              DropdownButton<int>(
                value: thoraxInjury,
                onChanged: (int? newValue) {
                  setState(() {
                    thoraxInjury = newValue!;
                    calculateSurvivalProbability();
                  });
                },
                items: issChoices.map((String choice) {
                  return DropdownMenuItem<int>(
                    value: issChoices.indexOf(choice),
                    child: Text(choice),
                  );
                }).toList(),
              ),
              Text('Abdomen Injury:'),
              DropdownButton<int>(
                value: abdomenInjury,
                onChanged: (int? newValue) {
                  setState(() {
                    abdomenInjury = newValue!;
                    calculateSurvivalProbability();
                  });
                },
                items: issChoices.map((String choice) {
                  return DropdownMenuItem<int>(
                    value: issChoices.indexOf(choice),
                    child: Text(choice),
                  );
                }).toList(),
              ),
              Text('Extremities Injury:'),
              DropdownButton<int>(
                value: extremitiesInjury,
                onChanged: (int? newValue) {
                  setState(() {
                    extremitiesInjury = newValue!;
                    calculateSurvivalProbability();
                  });
                },
                items: issChoices.map((String choice) {
                  return DropdownMenuItem<int>(
                    value: issChoices.indexOf(choice),
                    child: Text(choice),
                  );
                }).toList(),
              ),
              Text('External Injury:'),
              DropdownButton<int>(
                value: externalInjury,
                onChanged: (int? newValue) {
                  setState(() {
                    externalInjury = newValue!;
                    calculateSurvivalProbability();
                  });
                },
                items: issChoices.map((String choice) {
                  return DropdownMenuItem<int>(
                    value: issChoices.indexOf(choice),
                    child: Text(choice),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Text('Age in Years:'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    ageInYears = double.tryParse(value) ?? 0.0;
                    calculateSurvivalProbability();
                  });
                },
              ),
              SizedBox(height: 16),
              Text('TRISS Score:'),
              Text(
                'Probability of Survival – Blunt = ${(survivalProbability * 100).toStringAsFixed(2)}%',
              ),
              Text(
                'Probability of Survival – Penetrating = ${(survivalProbability * 100).toStringAsFixed(2)}%',
              ),
              Text('The Revised Trauma Score (RTS) in this case is ${calculateRTS().toStringAsFixed(4)}.'),
              Text('Interpretation: Values below the established threshold of 4 require immediate care in the trauma center. The higher RTS, the higher the chances of survival are.'),
              Text('Injury Severity Score = ${calculateISS()}'),
            ],
          ),
        ),
      ),
    );
  }

  double calculateRTS() {
    return (glasgowComaScale + systolicBloodPressure + respiratoryRate);
  }

  void calculateSurvivalProbability() {
    // Constants for the logarithmic regression equation (you can adjust these values)
    double b0 = -1.517;
    double b1 = 0.063;
    double b2 = -0.061;
    double b3 = 0.202;

    double b = b0 +
        (b1 * calculateRTS()) +
        (b2 * (calculateISS().toDouble())) +
        (b3 * ageInYears);

    // Calculate survival probability
    double probability = 1 / (1 + exp(-b));

    setState(() {
      survivalProbability = probability;
    });
  }
}
