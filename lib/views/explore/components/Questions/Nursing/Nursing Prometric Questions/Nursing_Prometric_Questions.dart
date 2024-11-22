import 'package:flutter/material.dart';
import 'package:news_pro/views/explore/components/Questions/Nursing/Nursing%20Prometric%20Questions/Part%2018/Prometric_PartEighteen.dart';
import 'Part 1/Prometric_PartOne.dart';
import 'Part 2/Prometric_PartTwo.dart';
import 'Part 3/Prometric_PartThree.dart';
import 'Part 4/Prometric_PartFour.dart';
import 'Part 5/Prometric_PartFive.dart';
import 'Part 6/Prometric_PartSix.dart';
import 'Part 7/Prometric_PartSeven.dart';
import 'Part 8/Prometric_PartEight.dart';
import 'Part 9/Prometric_PartNine.dart';
import 'Part 10/Prometric_PartTen.dart';
import 'Part 11/Prometric_PartEleven.dart';
import 'Part 12/Prometric_PartTwelve.dart';
import 'Part 13/Prometric_PartThirteen.dart';
import 'Part 14/Prometric_PartFourteen.dart';
import 'Part 15/Prometric_PartFifteen.dart';
import 'Part 16/Prometric_PartSixteen.dart';
import 'Part 17/Prometric_PartSeventeen.dart';
import 'Part 19/Prometric_PartNineteen.dart';
import 'Part 20/Prometric_PartTwenty.dart';

class PrometricNursingQuestions extends StatelessWidget {
  const PrometricNursingQuestions({super.key});

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
        title: const Text('ProMetric Interview Questions'),
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
                  _buildButton(context, 'Part 1', PrometricPartOneNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 2', PrometricPartTwoNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 3', PrometricPartThreeNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 4', PrometricPartFourNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 5', PrometricPartFiveNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 6', PrometricPartSixNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 7', PrometricPartSevenNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 8', PrometricPartEightNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 9', PrometricPartNineNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 10', PrometricPartTenNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 11', PrometricPartElevenNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 13', PrometricPartTwelveNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 13', PrometricPartThirteenNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 14', PrometricPartFourteenNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 15', PrometricPartFifteenNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 16', PrometricPartSixteenNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 17', PrometricPartSeventeenNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 18', PrometricPartEighteenNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 19', PrometricPartNineteenNursingQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 20', PrometricPartTwentyNursingQuestions()),
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
