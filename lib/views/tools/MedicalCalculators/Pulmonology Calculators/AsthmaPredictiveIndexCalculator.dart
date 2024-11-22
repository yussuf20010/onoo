import 'package:flutter/material.dart';

class AsthmaPredictiveIndexCalculator extends StatefulWidget {
  const AsthmaPredictiveIndexCalculator({super.key});

  @override
  _AsthmaPredictiveIndexCalculatorState createState() =>
      _AsthmaPredictiveIndexCalculatorState();
}

class _AsthmaPredictiveIndexCalculatorState
    extends State<AsthmaPredictiveIndexCalculator> {
  // Initialize variables to store user input
  String wheezingEpisodes = 'Less than three';
  bool familyHistory = false;
  bool eczemaDiagnosed = false;
  bool allergensSensitivity = false;
  bool wheezingApartFromColds = false;
  bool highBloodEosinophils = false;

  // Function to calculate the API result based on the criteria
  String calculateAPIResult() {
    if (wheezingEpisodes == "Less than three") {
      if (familyHistory || eczemaDiagnosed) {
        if (allergensSensitivity || wheezingApartFromColds || highBloodEosinophils) {
          return "Positive (Loose Criteria)";
        } else {
          return "Negative";
        }
      }
    } else if (wheezingEpisodes == "Three or more") {
      if (familyHistory || eczemaDiagnosed) {
        if (allergensSensitivity || wheezingApartFromColds || highBloodEosinophils) {
          return "Positive (Stringent Criteria)";
        } else {
          return "Negative";
        }
      }
    }
    return "Negative";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asthma Predictive Index (API) Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Select the criteria for the API:'),
            ListTile(
              title: Text('Number of Wheezing Episodes Per Year:'),
              subtitle: DropdownButton<String>(
                value: wheezingEpisodes,
                items: ["Less than three", "Three or more"]
                    .map((value) => DropdownMenuItem<String>( // Explicitly specify the type as String
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    wheezingEpisodes = value!;
                  });
                },
              ),
            ),
            CheckboxListTile(
              title: Text('Family History with Asthma:'),
              value: familyHistory,
              onChanged: (value) {
                setState(() {
                  familyHistory = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Diagnosed with Eczema (Atopic Dermatitis):'),
              value: eczemaDiagnosed,
              onChanged: (value) {
                setState(() {
                  eczemaDiagnosed = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Sensitivity to Allergens in the Air:'),
              value: allergensSensitivity,
              onChanged: (value) {
                setState(() {
                  allergensSensitivity = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Wheezing Present Apart from Colds:'),
              value: wheezingApartFromColds,
              onChanged: (value) {
                setState(() {
                  wheezingApartFromColds = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Greater than 4% Blood Eosinophils:'),
              value: highBloodEosinophils,
              onChanged: (value) {
                setState(() {
                  highBloodEosinophils = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String result = calculateAPIResult();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('API Result', style: TextStyle(color: Colors.black)),
                      content: Text('The API result is: $result', style: TextStyle(color: Colors.black)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK', style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    );

                  },
                );
              },
              child: Text('Calculate API Result'),
            ),
          ],
        ),
      ),
    );
  }
}
