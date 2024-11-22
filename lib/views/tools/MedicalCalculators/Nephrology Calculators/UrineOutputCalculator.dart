import 'package:flutter/material.dart';


class UrineOutputCalculator extends StatefulWidget {
  const UrineOutputCalculator({super.key});

  @override
  _UrineOutputCalculatorState createState() => _UrineOutputCalculatorState();
}

class _UrineOutputCalculatorState extends State<UrineOutputCalculator> {
  TextEditingController totalUrineOutputController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController fluidIntakeController = TextEditingController();
  double urineOutputResult = 0.0;
  double fluidBalanceResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Urine Output Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: totalUrineOutputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Total Urine Output (mL)'),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: hoursController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Hours'),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: fluidIntakeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Fluid Intake (mL)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateUrineOutput();
              },
              child: const Text('Calculate Urine Output (mL/kg/hr)'),
            ),
            const SizedBox(height: 20),
            Text('Urine Output (mL/kg/hr): $urineOutputResult'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateFluidBalance();
              },
              child: const Text('Calculate Fluid Balance (mL)'),
            ),
            const SizedBox(height: 20),
            Text('Fluid Balance (mL): $fluidBalanceResult'),
          ],
        ),
      ),
    );
  }

  void calculateUrineOutput() {
    double totalUrineOutput = double.tryParse(totalUrineOutputController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double hours = double.tryParse(hoursController.text) ?? 0.0;

    if (weight > 0 && hours > 0) {
      double urineOutput = totalUrineOutput / (weight * hours);
      setState(() {
        urineOutputResult = urineOutput;
      });
    }
  }

  void calculateFluidBalance() {
    double totalUrineOutput = double.tryParse(totalUrineOutputController.text) ?? 0.0;
    double fluidIntake = double.tryParse(fluidIntakeController.text) ?? 0.0;

    if (totalUrineOutput > 0) {
      double fluidBalance = fluidIntake - totalUrineOutput;
      setState(() {
        fluidBalanceResult = fluidBalance;
      });
    }
  }
}
