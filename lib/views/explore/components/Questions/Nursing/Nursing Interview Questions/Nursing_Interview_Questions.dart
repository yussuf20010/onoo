import 'package:flutter/material.dart';
import 'Administration/AdminNursingQuestions.dart';
import 'Dialysis/DialysisNursingQuestions.dart';
import 'ECG/ECGNursingQuestions.dart';
import 'General/GeneralNursingQuestions.dart';
import 'Infection Control/InfControlNursingQuestions.dart';
import 'OR/ORNursingQuestions.dart';
import 'Psychiatry/PsycoNursingQuestions.dart';

class InterviewNursingQuestions extends StatelessWidget {
  const InterviewNursingQuestions({super.key});

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
        title: const Text('Nursing Interview Questions'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20), // Add spacing between the image and buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildButton(context, 'General', GeneralNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Dialysis',  DialysisNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Operation Room', ORNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'ECG', ECGNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Infection Control', InfControlNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Psychiatry', PsycoNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Administration', AdminNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
