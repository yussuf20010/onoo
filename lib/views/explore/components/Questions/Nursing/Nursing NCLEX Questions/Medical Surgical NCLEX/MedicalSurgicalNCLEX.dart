import 'package:flutter/material.dart';

import 'MedicalSurgicalNCLEX_PartEight.dart';
import 'MedicalSurgicalNCLEX_PartFive.dart';
import 'MedicalSurgicalNCLEX_PartFour.dart';
import 'MedicalSurgicalNCLEX_PartOne.dart';
import 'MedicalSurgicalNCLEX_PartSeven.dart';
import 'MedicalSurgicalNCLEX_PartSix.dart';
import 'MedicalSurgicalNCLEX_PartThree.dart';
import 'MedicalSurgicalNCLEX_PartTwo.dart';

class MedicalSurgicalNCLEXQuestions extends StatelessWidget {
  const MedicalSurgicalNCLEXQuestions({super.key});


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
            fontSize: 30, // Adjust the font size as needed
            fontFamily: 'BORELA',
          ),
          textAlign: TextAlign.center, // Center the text both vertically and horizontally
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Surgical NCLEX Questions'),
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
                  _buildButton(context, 'Part 1', MedicalSurgicalNCLEXPartOne()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 2', MedicalSurgicalNCLEXPartTwo()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 3', MedicalSurgicalNCLEXPartThree()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 4', MedicalSurgicalNCLEXPartFour()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 5', MedicalSurgicalNCLEXPartFive()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 6', MedicalSurgicalNCLEXPartSix()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 7', MedicalSurgicalNCLEXPartSeven()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 8', MedicalSurgicalNCLEXPartEight()),
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
