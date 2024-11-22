import 'package:flutter/material.dart';

import 'Part 1/CBT_PartOne.dart';
import 'Part 2/CBT_PartTwo.dart';
import 'Part 3/CBT_PartThree.dart';
import 'Part 4/CBT_PartFour.dart';
import 'Part 5/CBT_PartFive.dart';
import 'Part 6/CBT_PartSix.dart';
import 'Part 7/CBT_PartSeven.dart';
import 'Part 8/CBT_PartEight.dart';
import 'Part 9/CBT_PartNine.dart';


class CBTNursingQuestions extends StatelessWidget {
  const CBTNursingQuestions({super.key});

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
        title: const Text('CBT Nursing Questions'),
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
                  _buildButton(context, 'Part 1', CBTPartOneNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 2', CBTPartTwoNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 3', CBTPartThreeNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 4', CBTPartFourNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 5', CBTPartFiveNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 6', CBTPartSixNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 7', CBTPartSevenNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 8', CBTPartEightNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 9', CBTPartNineNursingQuestions()),
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
