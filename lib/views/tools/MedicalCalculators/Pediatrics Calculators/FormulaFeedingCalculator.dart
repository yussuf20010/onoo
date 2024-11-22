import 'package:flutter/material.dart';

void main() => runApp(FormulaFeedingCalculatorApp());

class FormulaFeedingCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formula Feeding Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormulaFeedingCalculator(),
    );
  }
}

class FormulaFeedingCalculator extends StatefulWidget {
  @override
  _FormulaFeedingCalculatorState createState() =>
      _FormulaFeedingCalculatorState();
}

class _FormulaFeedingCalculatorState extends State<FormulaFeedingCalculator> {
  late double ageInMonths;
  late double weightInKg;
  double calculatedAmount = 0.0;

  void calculateFormulaAmount() {
    if (ageInMonths != null && weightInKg != null) {
      // Add your formula feeding calculation logic here.
      // This is a simple example formula, you should replace it with your own.
      calculatedAmount = (ageInMonths * 10) + (weightInKg * 5);
    } else {
      calculatedAmount = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formula Feeding Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Age in Months'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  ageInMonths = double.tryParse(value)!;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Weight in Kg'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  weightInKg = double.tryParse(value)!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  calculateFormulaAmount();
                });
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              'Formula Amount: $calculatedAmount mL',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
