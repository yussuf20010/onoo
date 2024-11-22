// import 'package:flutter/material.dart';
// import 'package:news_pro/core/routes/app_routes.dart';
//
// class QuestionsMainScreen extends StatelessWidget {
//   const QuestionsMainScreen({super.key});
//
//   Widget _buildButton(BuildContext context, String label, String route) {
//     return SizedBox(
//       width: 330,
//       height: 100,
//       child: ElevatedButton(
//         style: ButtonStyle(
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//               side: const BorderSide(color: Colors.white),
//             ),
//           ),
//         ),
//         onPressed: () {
//           Navigator.pushNamed(context, route);
//         },
//         child: Text(
//           label,
//           style: const TextStyle(
//             fontSize: 22,
//             fontFamily: 'Montserrat-Regular',
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Questions'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const SizedBox(height: 150), // Add spacing between the image and buttons
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   _buildButton(context, 'Nursing Interview Questions', AppRoutes.nursinginterviewquestions),
//                   const SizedBox(height: 10), // Add spacing between the buttons
//                   _buildButton(context, 'Nursing ProMetric Questions', AppRoutes.nursingprometrikquestions),
//                   const SizedBox(height: 10), // Add spacing between the buttons
//                   _buildButton(context, 'Nursing NCLEX Questions', AppRoutes.nursingnclexquestions),
//                   const SizedBox(height: 10), // Add spacing between the buttons
//                   _buildButton(context, 'Nursing CBT Questions', AppRoutes.nursingcbtquestions),
//                   const SizedBox(height: 10), // Add spacing between the buttons
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







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

class QuestionsMainScreen extends StatelessWidget {
  const QuestionsMainScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
      ),
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
