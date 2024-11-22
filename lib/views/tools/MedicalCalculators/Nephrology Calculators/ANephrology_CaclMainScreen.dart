import 'package:flutter/material.dart';

import 'AlbuminCreatinineRatioCalculator.dart';
import 'BUNCreatinineRatioCalculator.dart';
import 'GFRCalculator.dart';
import 'UrineOutputCalculator.dart';

class NephrologyCalc extends StatelessWidget {
  const NephrologyCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nephrology Calculators'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'GFR Calculator',
              GFRCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Urine Output Calculator',
              UrineOutputCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'BUN Creatinine Ratio Calculator',
              BUNCreatinineRatioCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Albumin Creatinine Ratio Calculator',
              AlbuminCreatinineRatioCalculator(),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildCalculatorButton(BuildContext context, String label, Widget route,
      {double fontSize = 14}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 140,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          },
        ),
      ),
    );
  }
}
