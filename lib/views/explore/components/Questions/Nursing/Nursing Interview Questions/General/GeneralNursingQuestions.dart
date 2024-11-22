import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_pro/views/explore/components/Questions/Nursing/Nursing%20Interview%20Questions/General/part1.dart';
import 'package:news_pro/views/explore/components/Questions/Nursing/Nursing%20Interview%20Questions/General/part2.dart';
import 'package:news_pro/views/explore/components/Questions/Nursing/Nursing%20Interview%20Questions/General/part3.dart';
import 'package:news_pro/views/explore/components/Questions/Nursing/Nursing%20Interview%20Questions/General/part4.dart';
import 'package:news_pro/views/explore/components/Questions/Nursing/Nursing%20Interview%20Questions/General/part5.dart';

class GeneralNursingQuestions extends StatelessWidget {
  const GeneralNursingQuestions({super.key});

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
        title: const Text('General Interview Nursing Questions'),
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
                  _buildButton(context, 'Part 1'.tr(), PartOne_NursingInterview()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 2'.tr(), PartTwo_NursingInterview()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 3'.tr(), PartThree_NursingInterview()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 4'.tr(), PartFour_NursingInterview()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 5'.tr(), PartFive_NursingInterview()),
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
