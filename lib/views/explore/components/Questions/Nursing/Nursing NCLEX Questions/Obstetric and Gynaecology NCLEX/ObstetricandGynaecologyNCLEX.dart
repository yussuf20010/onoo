import 'package:flutter/material.dart';

import 'ObstetricandGynaecologyNCLEX_PartFive.dart';
import 'ObstetricandGynaecologyNCLEX_PartFour.dart';
import 'ObstetricandGynaecologyNCLEX_PartOne.dart';
import 'ObstetricandGynaecologyNCLEX_PartThree.dart';
import 'ObstetricandGynaecologyNCLEX_PartTwo.dart';

class ObstetricandGynaecologyNCLEXQuestions extends StatelessWidget {
  const ObstetricandGynaecologyNCLEXQuestions({super.key});


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
        title: const Text('Obstetricand & Gynaecology NCLEX Questions'),
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
                  _buildButton(context, 'Part 1', ObstetricandGynaecologyNCLEXPartOne()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 2', ObstetricandGynaecologyNCLEXPartTwo()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 3', ObstetricandGynaecologyNCLEXPartThree()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 4', ObstetricandGynaecologyNCLEXPartFour()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Part 5', ObstetricandGynaecologyNCLEXPartFive()),
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
