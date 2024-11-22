import 'package:flutter/material.dart';
import 'Dialysis_PartOne.dart';
import 'Dialysis_PartTwo.dart';

class DialysisNursingQuestions extends StatelessWidget {
  const DialysisNursingQuestions({super.key});

  Widget _buildButton(BuildContext context, String label, Widget screen) {
    return SizedBox(
      width: 330,
      height: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.white),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 34,
              fontFamily: 'BORELA'
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialysis Interview Nursing Questions'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildButton(context, 'Part 1', DialysisPartOneNursingInterview()),
                  const SizedBox(height: 10),
                  _buildButton(context, 'Part 2', DialysisPartTwoNursingInterview()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
