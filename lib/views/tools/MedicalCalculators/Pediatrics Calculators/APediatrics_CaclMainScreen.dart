import 'package:flutter/material.dart';

import 'FormulaFeedingCalculator.dart';
import 'GlucoseInfusionRateCalculator .dart';
import 'PediatricBloodTransfusionCalculator.dart';
import 'PediatricDoseCalculator.dart';
import 'PediatricGlasgowComaScaleCalculator.dart';
import 'PediatricVitalSignsCalculator.dart';

class PediatricCalc extends StatelessWidget {
  const PediatricCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pediatric Calculators'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Total Daily Pediatric Dose',
              PediatricDoseCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Glucose Infusion Rate (GIR)',
              GIRCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Pediatric Vital Signs',
              VitalSignsCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Pediatric Blood Transfusion Volume',
                PediatricBloodTransfusionCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Pediatric Glasgow Coma Scale',
              PediatricGlasgowComaScaleCalculator(),
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
