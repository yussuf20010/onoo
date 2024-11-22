import 'package:flutter/material.dart';

import 'Dosage Calculation NCLEX/DosageCalculationNCLEX.dart';
import 'Gerontological NCLEX/GerontologicalNCLEX.dart';
import 'Growth and Development NCLEX/GrowthandDevelopmentNCLEX.dart';
import 'Leadership and Management NCLEX/LeadershipManagementNCLEX.dart';
import 'Medical Surgical NCLEX/MedicalSurgicalNCLEX.dart';
import 'Nutrition NCLEX/NutritionNCLEX.dart';
import 'Obstetric and Gynaecology NCLEX/ObstetricandGynaecologyNCLEX.dart';
import 'Pediatric NCLEX/PediatricNCLEX.dart';
import 'Psychatric NCLEX/PsychiatricNCLEX.dart';

class NCLEXNursingQuestions extends StatelessWidget {
  const NCLEXNursingQuestions({super.key});

  Widget _buildButton(BuildContext context, String label, Widget screen) {
    return SizedBox(
      width: 360,
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
            fontSize: 26, // Adjust the font size as needed
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
        title: const Text('NCLEX Questions'),
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
                  _buildButton(context, 'Medical Surgical', MedicalSurgicalNCLEXQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Pediatric', PediatricNCLEXQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Obstetric & Gynaecology', ObstetricandGynaecologyNCLEXQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Gerontological', GerontologicalNCLEXQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Growth & Development', GrowthAndDevelopmentNCLEXQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Nutrition', NutritionNCLEXQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Management', LeadershipManagementNCLEXQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Psychiatric', PsychiatricNCLEXQuestions()),
                  const SizedBox(height: 10), // Add spacing between the buttons
                  _buildButton(context, 'Dosage Calculation', DosageCalculationNCLEXQuestions()),
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
