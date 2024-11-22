import 'package:flutter/material.dart';

class LungCapacityCalculatorInputs {
  static const double normalVCMen = 4.6;
  static const double normalVCWomen = 3.1;
  static const double normalICMen = 3.5;
  static const double normalICWomen = 2.4;
  static const double normalFRCMen = 2.3;
  static const double normalFRCWomen = 1.8;
  static const double normalTLCMen = 5.8;
  static const double normalTLCWomen = 4.2;

  static double calculateVC(double irv, double tv, double erv) {
    return irv + tv + erv;
  }

  static double calculateIC(double irv, double tv) {
    return irv + tv;
  }

  static double calculateFRC(double erv, double rv) {
    return erv + rv;
  }

  static double calculateTLC(double irv, double tv, double erv, double rv) {
    return irv + tv + erv + rv;
  }
}

class LungCapacityCalculator extends StatefulWidget {
  const LungCapacityCalculator({super.key});

  @override
  _LungCapacityCalculatorState createState() => _LungCapacityCalculatorState();
}

class _LungCapacityCalculatorState extends State<LungCapacityCalculator> {
  TextEditingController irvController = TextEditingController();
  TextEditingController tvController = TextEditingController();
  TextEditingController ervController = TextEditingController();
  TextEditingController rvController = TextEditingController();

  double resultVC = 0;
  double resultIC = 0;
  double resultFRC = 0;
  double resultTLC = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lung Capacity Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Wrap the Column with SingleChildScrollView
          child: Column(
            children: [
              TextField(
                controller: irvController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Inspiratory Reserve Volume (IRV)'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: tvController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Tidal Volume (TV)'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ervController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Expiratory Reserve Volume (ERV)'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: rvController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Residual Volume (RV)'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: calculateLungCapacities,
                child: Text('Calculate'),
              ),
              SizedBox(height: 16),
              Text('Vital Capacity (VC): $resultVC litres'),
              const SizedBox(height: 5),
              Text('Inspiratory Capacity (IC): $resultIC litres'),
              const SizedBox(height: 5),
              Text('Functional Residual Capacity (FRC): $resultFRC litres'),
              const SizedBox(height: 5),
              Text('Total Lung Capacity (TLC): $resultTLC litres'),
            ],
          ),
        ),
      ),
    );
  }

  void calculateLungCapacities() {
    double irv = double.tryParse(irvController.text) ?? 0;
    double tv = double.tryParse(tvController.text) ?? 0;
    double erv = double.tryParse(ervController.text) ?? 0;
    double rv = double.tryParse(rvController.text) ?? 0;

    setState(() {
      resultVC = LungCapacityCalculatorInputs.calculateVC(irv, tv, erv);
      resultIC = LungCapacityCalculatorInputs.calculateIC(irv, tv);
      resultFRC = LungCapacityCalculatorInputs.calculateFRC(erv, rv);
      resultTLC = LungCapacityCalculatorInputs.calculateTLC(irv, tv, erv, rv);
    });
  }
}
