import 'package:flutter/material.dart';

import 'DailyDosageCalculator.dart';
import 'MedicineHalfLifeCalculator.dart';
import 'ParacetamolDosageCalculator.dart';
import 'PediatricDoseCalculator.dart';

class PharmacologyCalc extends StatelessWidget {
  const PharmacologyCalc({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacology Calculators'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Daily Dosage Calculator',
              DailyDosageCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Medicine Half-Life Calculator',
              HalfLifeCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Pediatric Paracetamol Syrup Dosage Calculator',
              PediatricParacetamolSyrupCalculator(),
            ),
            // const SizedBox(height: 1),
            // buildCalculatorButton(
            //   context,
            //   'Pediatric Dosage Calculator',
            //   PediatricDosageCalculatorApp(),
            // ),
          ],
        ),
      ),
    );
  }


  Widget buildCalculatorButton(BuildContext context, String label, Widget route, {double fontSize = 14}) {
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
              style: TextStyle(fontSize: fontSize,),
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
