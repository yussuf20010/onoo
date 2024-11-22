import 'package:flutter/material.dart';

class PediatricGlasgowComaScaleCalculator extends StatefulWidget {
  const PediatricGlasgowComaScaleCalculator({Key? key}) : super(key: key);

  @override
  _PediatricGlasgowComaScaleCalculatorState createState() =>
      _PediatricGlasgowComaScaleCalculatorState();
}

class _PediatricGlasgowComaScaleCalculatorState
    extends State<PediatricGlasgowComaScaleCalculator> {
  int? bestEyeResponse; // Default value for best eye response
  int? bestVerbalResponse; // Default value for best verbal response
  int? bestMotorResponse; // Default value for best motor response
  int totalScore = 15; // Default total score

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pediatric Glasgow Coma Scale (pGCS)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Best Eye Response',
              style: TextStyle(fontSize: 18),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200), // Set a maximum height
              child: DropdownButton<int>(
                value: bestEyeResponse,
                items: const [
                  DropdownMenuItem<int>(
                    value: null,
                    child: Text('Select response'),
                  ),
                  DropdownMenuItem<int>(
                    value: 4,
                    child: Text('Eyes opening spontaneously (4 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 3,
                    child: Text('Eye opening to speech (3 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text('Eye opening to pain (2 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('No eye opening or response (1 point)'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    bestEyeResponse = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Best Verbal Response',
              style: TextStyle(fontSize: 18),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200), // Set a maximum height
              child: DropdownButton<int>(
                value: bestVerbalResponse,
                items: const [
                  DropdownMenuItem<int>(
                    value: null,
                    child: Text('Select response'),
                  ),
                  DropdownMenuItem<int>(
                    value: 5,
                    child: Text(
                        'Smiles, oriented to sounds, follows objects, interacts (5 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 4,
                    child: Text('Cries but consolable, inappropriate interactions (4 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 3,
                    child: Text('Inconsistently inconsolable, moaning (3 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text('Inconsolable, agitated (2 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('No verbal response (1 point)'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    bestVerbalResponse = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Best Motor Response',
              style: TextStyle(fontSize: 18),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200), // Set a maximum height
              child: DropdownButton<int>(
                value: bestMotorResponse,
                items: const [
                  DropdownMenuItem<int>(
                    value: null,
                    child: Text('Select response'),
                  ),
                  DropdownMenuItem<int>(
                    value: 6,
                    child: Text('Infant moves spontaneously or purposefully (6 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 5,
                    child: Text('Infant withdraws from touch (5 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 4,
                    child: Text('Infant withdraws from pain (4 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 3,
                    child: Text(
                        'Abnormal flexion to pain for an infant (decorticate response) (3 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text('Extension to pain (decerebrate response) (2 points)'),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('No motor response (1 point)'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    bestMotorResponse = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: calculateTotalScore,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Score: ${totalScore.toString()}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void calculateTotalScore() {
    if (bestEyeResponse != null && bestVerbalResponse != null && bestMotorResponse != null) {
      totalScore = bestEyeResponse! + bestVerbalResponse! + bestMotorResponse!;
      setState(() {});
    }
  }
}