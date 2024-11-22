import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'AdultGlasgowScale.dart';
import 'PediatricGlasgowScale.dart';
import 'TriSSCalculator.dart';

class EmergencyCalc extends StatelessWidget {
  const EmergencyCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Calculators'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            // SizedBox(
            //   height: 200,
            //   child: Lottie.asset('assets/animations/tools.json'),
            // ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Incomplete - Trauma Injury Severity Score (TRISS)',
              TriSSCalc(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Adult Glasgow Coma Scale (GCS)',
              GlasgowComaScaleCalc(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Pediatric Glasgow Coma Scale (pGCS)',
              PGSCalcu(),
            ),

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
