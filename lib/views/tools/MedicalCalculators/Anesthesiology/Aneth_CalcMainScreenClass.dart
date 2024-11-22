import 'package:flutter/material.dart';
import 'AldreteScoreCalculator.dart';
import 'IVDripRateCalculator.dart';
import 'PadScoreCalculator.dart';


class AnethCalc extends StatelessWidget {
  const AnethCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anesthesiology Calculators'),
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
              'IV Drip Rate',
              IVDripRateCalc(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Aldrete Score',
              AldreteScoreCalc(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Post Anesthetic Discharge Scoring System',
              PadScoreCalc(),
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
