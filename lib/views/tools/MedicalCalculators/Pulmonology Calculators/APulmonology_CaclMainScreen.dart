import 'package:flutter/material.dart';
import 'AsthmaPredictiveIndexCalculator.dart';
import 'LungCapacityCalculator.dart';
import 'MinuteVentilationCalculator.dart';
import 'ResidualVolumeCalculator.dart';
import 'TidalVolumeCalculator.dart';
import 'VitalCapacityCalculator.dart';

class PulmonologyCalc extends StatelessWidget {
  const PulmonologyCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulmonology Calculators'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Asthma Predictive Index',
              AsthmaPredictiveIndexCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Tidal Volume & Endotracheal Tube Depth',
              TidalVolumeCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Minute Ventilation (VE)',
              MinuteVentilationCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Lung Capacity',
              LungCapacityCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Residual Volume',
              ResidualVolumeCalculator(),
            ),
            const SizedBox(height: 1),
            buildCalculatorButton(
              context,
              'Vital Capacity',
              VitalCapacityCalculator(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCalculatorButton(BuildContext context, String label, Widget route,
      {double fontSize = 14}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 140,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          },
        ),
      ),
    );
  }
}
