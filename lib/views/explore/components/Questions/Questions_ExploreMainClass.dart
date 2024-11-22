import 'package:flutter/material.dart';

import 'Nursing/Nursing CBT Questions/Nursing_CBT_Questions.dart';
import 'Nursing/Nursing Interview Questions/Nursing_Interview_Questions.dart';
import 'Nursing/Nursing NCLEX Questions/Nursing_NCLEX_Questions.dart';
import 'Nursing/Nursing Prometric Questions/Nursing_Prometric_Questions.dart';

class CustomCardButton extends StatelessWidget {
  final String label;
  final String backgroundImagePath;
  final VoidCallback onPressed;

  CustomCardButton({
    required this.label,
    required this.onPressed,
    required this.backgroundImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12), // Add padding around the button
      child: InkWell(
        onTap: onPressed,
        child: Card(
          elevation: 4, // Add elevation for shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Make the button rounded
          ),
          child: Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Apply the same radius to the image

              image: DecorationImage(
                image: AssetImage(backgroundImagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionsExploreMainClass extends StatelessWidget {
  const QuestionsExploreMainClass({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomCardButton(
                    label: '',
                    backgroundImagePath: 'assets/images/eginterview.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InterviewNursingQuestions()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCardButton(
                    label: '',
                    backgroundImagePath: 'assets/images/prometric.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrometricNursingQuestions()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCardButton(
                    label: '',
                    backgroundImagePath: 'assets/images/nclex.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NCLEXNursingQuestions()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCardButton(
                    label: '',
                    backgroundImagePath: 'assets/images/cbt.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CBTNursingQuestions()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
