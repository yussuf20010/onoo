import 'package:flutter/material.dart';

import 'CBTRoom.dart';
import 'GeneralRoom.dart';
import 'ICURoom.dart';
import 'InterviewRoom.dart';
import 'NCLEXRoom.dart';
import 'ORRoom.dart';
import 'PrometricRoom.dart';
import 'WardRoom.dart';
import 'WazayefRoom.dart';

class CustomCardButton extends StatelessWidget {
  final String label;
  final String backgroundImagePath;
  final VoidCallback onPressed;

  CustomCardButton({
    required this.label,
    required this.onPressed,
    required this.backgroundImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: InkWell(
        onTap: onPressed,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(backgroundImagePath),
                fit: BoxFit.cover,
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.5),
              //     spreadRadius: 2,
              //     blurRadius: 7,
              //     offset: Offset(0, 1),
              //   ),
              // ],
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 25,
                      blurRadius: 60,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 36,
                    fontFamily: 'Montserrat-Regular',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatRooms extends StatelessWidget {
  const ChatRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Rooms'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomCardButton(
                    label: 'General Room',
                    backgroundImagePath: 'assets/images/generalroom.webp',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GeneralRoom()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCardButton(
                    label: 'ICU Room',
                    backgroundImagePath: 'assets/images/icuroom.webp',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ICURoom()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCardButton(
                    label: 'OR Room',
                    backgroundImagePath: 'assets/images/orroom.webp',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ORRoom()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCardButton(
                    label: 'Ward Room',
                    backgroundImagePath: 'assets/images/wardroom.webp',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WardRoom()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCardButton(
                    label: 'Interview Room',
                    backgroundImagePath: 'assets/images/interviewroom.webp',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InterviewRoom()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCardButton(
                    label: 'CBT Room',
                    backgroundImagePath: 'assets/images/cbtroom.webp',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CBTRoom()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCardButton(
                    label: 'ProMetric Room',
                    backgroundImagePath: 'assets/images/prometricroom.webp',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProMetricRoom()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCardButton(
                    label: 'NCLEX Room',
                    backgroundImagePath: 'assets/images/nclexroom.webp',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NclexRoom()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomCardButton(
                    label: 'Wazayef Room',
                    backgroundImagePath: 'assets/images/wazayefroom.webp',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WazayefRoom()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
