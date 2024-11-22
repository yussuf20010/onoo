import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../MedicalCalcMainClass.dart';



class IVDripRateCalc extends StatelessWidget {
  const IVDripRateCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'IV Drip Rate Calculator',
        theme: theme,
        darkTheme: darkTheme,
        home: IVDripRateCalculator(),
      ),
    );
  }
}

class IVDripRateCalculator extends StatefulWidget {
  const IVDripRateCalculator({Key? key}) : super(key: key);

  @override
  _IVDripRateCalculatorState createState() => _IVDripRateCalculatorState();
}

class _IVDripRateCalculatorState extends State<IVDripRateCalculator> {
  double volumeInMl = 0;
  double dropFactor = 0;
  double timeInMinutes = 0;
  double dripRate = 0;

  TextEditingController volumeController = TextEditingController();
  TextEditingController dropFactorController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  void dispose() {
    volumeController.dispose();
    dropFactorController.dispose();
    timeController.dispose();
    super.dispose();
  }

  void calculateDripRate() {
    setState(() {
      volumeInMl = double.tryParse(volumeController.text) ?? 0;
      dropFactor = double.tryParse(dropFactorController.text) ?? 0;
      timeInMinutes = double.tryParse(timeController.text) ?? 0;

      if (volumeInMl > 0 && dropFactor > 0 && timeInMinutes > 0) {
        dripRate = (volumeInMl * dropFactor) / timeInMinutes;
      } else {
        dripRate = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgrounDark,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        title: Text(
          'IV Drip Rate Calculator',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: volumeController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Volume to be given (mL)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextField(
              controller: dropFactorController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Drop factor (gtts/min)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextField(
              controller: timeController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF7F8386),
              ),
              decoration: InputDecoration(
                labelText: 'Time (minutes)',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateDripRate,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              child: const Text('Calculate Drip Rate'),
            ),
            const SizedBox(height: 16),
            Text(
              'IV Drip Rate: ${dripRate.toStringAsFixed(2)} gtts/min',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(IVDripRateCalc());
}
