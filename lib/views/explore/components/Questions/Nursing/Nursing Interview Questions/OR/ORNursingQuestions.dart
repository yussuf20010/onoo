import 'package:flutter/material.dart';
import 'package:news_pro/views/explore/components/Questions/Nursing/Nursing%20Interview%20Questions/OR/OR_PartFour.dart';
import 'package:news_pro/views/explore/components/Questions/Nursing/Nursing%20Interview%20Questions/OR/OR_PartTwo.dart';
import 'OR_PartFive.dart';
import 'OR_PartOne.dart';
import 'OR_PartSix.dart';
import 'OR_PartThree.dart';

class ORNursingQuestions extends StatelessWidget {
  const ORNursingQuestions({super.key});

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
        title: const Text('OR Interview Nursing Questions'),
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
                  _buildButton(context, 'Part 1', ORPartOneNursingInterview()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 2', ORPartTwoNursingInterview()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 3', ORPartThreeNursingInterview()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 4', ORPartFourNursingInterview()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 5', ORPartFiveNursingInterview()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 6', ORPartSixNursingInterview()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
