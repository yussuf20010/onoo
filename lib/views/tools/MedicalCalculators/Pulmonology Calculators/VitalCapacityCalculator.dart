import 'package:flutter/material.dart';


class VitalCapacityCalculator extends StatefulWidget {
  const VitalCapacityCalculator({super.key});

  @override
  _VitalCapacityCalculatorState createState() => _VitalCapacityCalculatorState();
}

class _VitalCapacityCalculatorState extends State<VitalCapacityCalculator> {
  final TextEditingController irvController = TextEditingController();
  final TextEditingController tvController = TextEditingController();
  final TextEditingController ervController = TextEditingController();

  double vc = 0;

  void calculateVC() {
    double irv = double.parse(irvController.text);
    double tv = double.parse(tvController.text);
    double erv = double.parse(ervController.text);
    double calculatedVC = irv + tv + erv;
    setState(() {
      vc = calculatedVC;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vital Capacity Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: irvController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Inspiratory Reserve Volume (IRV) Litres)'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: tvController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tidal Volume (TV) Litres)'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ervController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Expiratory Reserve Volume (ERV) (Litres)'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: calculateVC,
              child: Text('Calculate VC'),
            ),
            SizedBox(height: 10),
            Text(
              'Vital Capacity (VC): $vc Litres',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
