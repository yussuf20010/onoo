// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import '../../../core/constants/app_colors.dart';
// import 'Anesthesiology/Aneth_CalcMainScreenClass.dart';
// import 'Cardiology/ACardio_CalcMainScreenClass.dart';
// import 'Drug And Pharmacology/ADrugs_CalcMainScreenClass.dart';
// import 'Emergency/AEmergency_CalcMainScreenClass.dart';
// import 'Nephrology Calculators/ANephrology_CaclMainScreen.dart';
// import 'Pediatrics Calculators/APediatrics_CaclMainScreen.dart';
// import 'Pulmonology Calculators/APulmonology_CaclMainScreen.dart';
//
// ThemeData lightTheme = ThemeData(
//   primaryColor: AppColors.primary,
//   scaffoldBackgroundColor: AppColors.scaffoldBackground,
//   cardColor: AppColors.cardColor,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: AppColors.scaffoldBackgrounDark,
//   ),
// );
//
// ThemeData darkTheme = ThemeData(
//   primaryColor: AppColors.primary,
//   scaffoldBackgroundColor: AppColors.scaffoldBackgrounDark,
//   cardColor: AppColors.cardColorDark,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: AppColors.scaffoldBackgrounDark,
//   ),
// );
//
// class MedicalCalcClass extends StatelessWidget {
//   const MedicalCalcClass({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Medical Calculators'),
//       ),
//       body: Center(
//         child: ListView(
//           children: <Widget>[
//             SizedBox(
//               height: 130,
//               child: Lottie.asset(
//                   'assets/animations/calc.json'), // Replace with your JSON file
//             ),
//             const SizedBox(height: 20),
//             buildCalculatorButton(
//               context,
//               'Anesthesiology',
//               AnethCalc(),
//               Icons.medical_information,
//             ),
//             buildCalculatorButton(
//               context,
//               'Cardiology Calculators',
//               CardioCalc(),
//               Icons.monitor_heart_outlined,
//             ),
//             buildCalculatorButton(
//               context,
//               'Pharmacology And Drug',
//               PharmacologyCalc(),
//               Icons.medication_outlined,
//             ),
//             // buildCalculatorButton(
//             //   context,
//             //   'Emergency Calculators',
//             //   EmergencyCalc(),
//             //   Icons.emergency_outlined,
//             // ),
//             buildCalculatorButton(
//               context,
//               'Pediatrics Calculators',
//               PediatricCalc(),
//               Icons.child_care_outlined,
//             ),
//             buildCalculatorButton(
//               context,
//               'Nephrology Calculators',
//               NephrologyCalc(),
//               Icons.man,
//             ),
//             buildCalculatorButton(
//               context,
//               'Pulmonology Calculators',
//               PulmonologyCalc(),
//               Icons.man,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildCalculatorButton(
//       BuildContext context, String label, Widget? route, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         width: 140,
//         height: 50,
//         child: ElevatedButton.icon(
//           style: ButtonStyle(
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 side: const BorderSide(color: Colors.white),
//               ),
//             ),
//           ),
//           icon: Icon(icon),
//           label: Text(label),
//           onPressed: () {
//             if (route != null) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => route),
//               );
//             } else {
//               // Handle the onPressed action for null routes (if needed).
//             }
//           },
//         ),
//       ),
//     );
//   }
// }




import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constants/app_colors.dart';
import 'Anesthesiology/Aneth_CalcMainScreenClass.dart';
import 'Cardiology/ACardio_CalcMainScreenClass.dart';
import 'Drug And Pharmacology/ADrugs_CalcMainScreenClass.dart';
import 'Emergency/AEmergency_CalcMainScreenClass.dart';
import 'Nephrology Calculators/ANephrology_CaclMainScreen.dart';
import 'Pediatrics Calculators/APediatrics_CaclMainScreen.dart';
import 'Pulmonology Calculators/APulmonology_CaclMainScreen.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  cardColor: AppColors.cardColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.scaffoldBackgrounDark,
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.scaffoldBackgrounDark,
  cardColor: AppColors.cardColorDark,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.scaffoldBackgrounDark,
  ),
);

class MedicalCalcClass extends StatelessWidget {
  const MedicalCalcClass({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Calculators'),
      ),
      body: Stack(
        children: [
          Center(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 130,
                  child: Lottie.asset(
                    'assets/animations/calc.json',
                  ),
                ),
                const SizedBox(height: 20),
                buildCalculatorButton(
                  context,
                  'Anesthesiology',
                  AnethCalc(),
                  Icons.medical_information,
                ),
                buildCalculatorButton(
                  context,
                  'Cardiology Calculators',
                  CardioCalc(),
                  Icons.monitor_heart_outlined,
                ),
                buildCalculatorButton(
                  context,
                  'Pharmacology And Drug',
                  PharmacologyCalc(),
                  Icons.medication_outlined,
                ),
                // buildCalculatorButton(
                //   context,
                //   'Emergency Calculators',
                //   EmergencyCalc(),
                //   Icons.emergency_outlined,
                // ),
                buildCalculatorButton(
                  context,
                  'Pediatrics Calculators',
                  PediatricCalc(),
                  Icons.child_care_outlined,
                ),
                buildCalculatorButton(
                  context,
                  'Nephrology Calculators',
                  NephrologyCalc(),
                  Icons.man,
                ),
                buildCalculatorButton(
                  context,
                  'Pulmonology Calculators',
                  PulmonologyCalc(),
                  Icons.man,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'educational_purpose'.tr(),
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCalculatorButton(
      BuildContext context, String label, Widget? route, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 140,
        height: 50,
        child: ElevatedButton.icon(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          icon: Icon(icon),
          label: Text(label),
          onPressed: () {
            if (route != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route),
              );
            } else {
              // Handle the onPressed action for null routes (if needed).
            }
          },
        ),
      ),
    );
  }
}
