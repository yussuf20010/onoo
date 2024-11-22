import 'package:flutter/material.dart';

class TidalVolumeCalculator extends StatefulWidget {
  const TidalVolumeCalculator({Key? key}) : super(key: key);

  @override
  _TidalVolumeCalculatorState createState() => _TidalVolumeCalculatorState();
}

class _TidalVolumeCalculatorState extends State<TidalVolumeCalculator> {
  double heightCm = 0;
  double ettDepth = 0;
  double TidalVolume = 0;
  String gender = 'Male';
  double selectedTidalVolume = 6; // Default to 6 mL/kg

  void calculateETTDepth() {
    if (heightCm > 0) {
      setState(() {
        ettDepth = 0.1 * heightCm + 4;
      });
    }
  }

  void calculateTidalVolume() {
    if (heightCm > 0) {
      double ibw;
      if (gender == 'Male') {
        ibw = 50 + 2.3 * (heightCm - 163); // Adjust for height in cm
      } else {
        ibw = 45.5 + 2.3 * (heightCm - 163); // Adjust for height in cm
      }

      // Calculate the target tidal volume based on the selected value (6 or 8 mL/kg).
      TidalVolume = ibw * selectedTidalVolume;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ETT & Tidal Volume Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Patient Height (cm)'),
              onChanged: (value) {
                setState(() {
                  heightCm = double.tryParse(value) ?? 0;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Gender:'),
                DropdownButton<String?>(
                  value: gender,
                  onChanged: (String? newValue) {
                    setState(() {
                      gender = newValue ?? 'Male';
                    });
                  },
                  items: <String?>['Male', 'Female']
                      .map<DropdownMenuItem<String?>>((String? value) {
                    return DropdownMenuItem<String?>(
                      value: value,
                      child: Text(value ?? 'Male'),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Target Tidal Volume (mL/kg):'),
                DropdownButton<double>(
                  value: selectedTidalVolume,
                  onChanged: (double? newValue) {
                    setState(() {
                      selectedTidalVolume = newValue ?? 6;
                    });
                  },
                  items: [6.0, 8.0]
                      .map<DropdownMenuItem<double>>((double value) {
                    return DropdownMenuItem<double>(
                      value: value,
                      child: Text('$value mL/kg'),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                calculateETTDepth();
                calculateTidalVolume();
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 16),
            Text('ETT Depth from Front Teeth (Chula formula): $ettDepth cm'),
            Text('Tidal Volume: $TidalVolume mL'),
          ],
        ),
      ),
    );
  }
}
