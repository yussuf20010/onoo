import 'package:flutter/material.dart';

class PGSCalcu extends StatefulWidget {
  const PGSCalcu({super.key});

  @override
  _PGSCalcWidgetState createState() => _PGSCalcWidgetState();
}

class _PGSCalcWidgetState extends State<PGSCalcu> {
  final pGSCalculator = PGSCalc();

  int eyeResponse = 4;
  int verbalResponse = 5;
  int motorResponse = 6;

  int calculatePGCS() {
    return pGSCalculator.calculate(eyeResponse, verbalResponse, motorResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Pediatric Glasgow Coma Scale Calculator'),
        DropdownButton<int>(
          value: eyeResponse,
          onChanged: (value) {
            setState(() {
              eyeResponse = value!;
            });
          },
          items: [
            DropdownMenuItem(value: 4, child: Text('Eyes open spontaneously')),
            DropdownMenuItem(value: 3, child: Text('Eyes open to speech')),
            DropdownMenuItem(value: 2, child: Text('Eyes open to pain')),
            DropdownMenuItem(value: 1, child: Text('No eye opening')),
          ],
        ),
        DropdownButton<int>(
          value: verbalResponse,
          onChanged: (value) {
            setState(() {
              verbalResponse = value!;
            });
          },
          items: [
            DropdownMenuItem(value: 5, child: Text('Smiles, oriented to sounds, follows objects, interacts')),
            DropdownMenuItem(value: 4, child: Text('Cries but consolable, inappropriate interactions')),
            DropdownMenuItem(value: 3, child: Text('Inconsistently inconsolable, moaning')),
            DropdownMenuItem(value: 2, child: Text('Inconsolable, agitated')),
            DropdownMenuItem(value: 1, child: Text('No verbal response')),
          ],
        ),
        DropdownButton<int>(
          value: motorResponse,
          onChanged: (value) {
            setState(() {
              motorResponse = value!;
            });
          },
          items: [
            DropdownMenuItem(value: 6, child: Text('Infant moves spontaneously or purposefully')),
            DropdownMenuItem(value: 5, child: Text('Infant withdraws from touch')),
            DropdownMenuItem(value: 4, child: Text('Infant withdraws from pain')),
            DropdownMenuItem(value: 3, child: Text('Abnormal flexion to pain for an infant (decorticate response)')),
            DropdownMenuItem(value: 2, child: Text('Extension to pain (decerebrate response)')),
            DropdownMenuItem(value: 1, child: Text('No motor response')),
          ],
        ),
        Text('pGCS Score: ${calculatePGCS()}'),
      ],
    );
  }
}

class PGSCalc{
  int calculate(int eyeResponse, int verbalResponse, int motorResponse) {
    return eyeResponse + verbalResponse + motorResponse;
  }
}
