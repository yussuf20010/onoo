import 'package:flutter/material.dart';

class MinuteVentilationCalculator extends StatefulWidget {
  const MinuteVentilationCalculator({Key? key}) : super(key: key);

  @override
  _MinuteVentilationCalculatorState createState() =>
      _MinuteVentilationCalculatorState();
}

class _MinuteVentilationCalculatorState
    extends State<MinuteVentilationCalculator> {
  double tidalVolume = 500; // Default value (between 400-600 mL)
  double respiratoryRate = 12; // Default value (between 10-16 resp/min)
  double minuteVentilation = 0;
  double alveolarMinuteVentilation = 0;

  void calculateMinuteVentilation() {
    // Calculate minute ventilation and alveolar minute ventilation
    minuteVentilation = tidalVolume * respiratoryRate;
    alveolarMinuteVentilation = (tidalVolume - 150) * respiratoryRate;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minute Ventilation Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tidal Volume (mL)'),
              onChanged: (value) {
                setState(() {
                  tidalVolume = double.tryParse(value) ?? 500;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Respiratory Rate (resp/min)'),
              onChanged: (value) {
                setState(() {
                  respiratoryRate = double.tryParse(value) ?? 12;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                calculateMinuteVentilation();
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 16),
            Text('Minute Ventilation: ${minuteVentilation.toStringAsFixed(2)} mL/min'),
            SizedBox(height: 5),
            Text('Alveolar Minute Ventilation: ${alveolarMinuteVentilation.toStringAsFixed(2)} mL/min'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MinuteVentilationCalculator(),
  ));
}
