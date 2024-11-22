import 'package:flutter/material.dart';

class ResidualVolumeCalculator extends StatefulWidget {
  const ResidualVolumeCalculator({super.key});

  @override
  _ResidualVolumeCalculatorState createState() => _ResidualVolumeCalculatorState();
}

class _ResidualVolumeCalculatorState extends State<ResidualVolumeCalculator> {
  final TextEditingController frcController = TextEditingController();
  final TextEditingController ervController = TextEditingController();

  double rv = 0;

  void calculateRV() {
    double frc = double.parse(frcController.text);
    double erv = double.parse(ervController.text);
    double calculatedRV = frc - erv;
    setState(() {
      rv = calculatedRV;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Residual Volume Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: frcController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Functional Residual Capacity (FRC) (Litres)'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ervController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Expiratory Reserve Volume (ERV) (Litres)'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: calculateRV,
              child: Text('Calculate RV'),
            ),
            SizedBox(height: 10),
            Text(
              'Residual Volume (RV): $rv Litres',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
