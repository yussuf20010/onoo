import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'BloodPressureCalculator.dart';
import 'CPPCalculator.dart';
import 'CardiacOutputCalculator.dart';
import 'EjectionFractionCalculator.dart';
import 'HeartFailureRiskCalculator.dart';
import 'MaxHeartRateCalculator.dart';
import 'LAPCalculator.dart';
import 'MAPCalculator.dart';

class CardioCalc extends StatelessWidget {
  const CardioCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardio Calculators'),
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
              'Cardiac Output',
              CardiacOutputCalc(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Ejection Fraction',
              EjectionFractionCalc(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Heart Failure Risk',
              HeartFailureRiskCalc(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Blood Pressure',
              BloodPressureCalc(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Max Heart Rate',
              MaxHeartRateCalc(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Mean Arterial Pressurer (MAP)',
              MAPCalc(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Left Atrial Pressure (LAP)',
              LAPCalc(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Coronary Perfusion Pressure (CPP)',
              CPPCalc(),
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
