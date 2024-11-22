import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_pro/core/routes/app_routes.dart';
import 'package:news_pro/views/tools/Terminology/pageOne.dart';

class TerminologyMainClass extends StatelessWidget {
  const TerminologyMainClass({super.key});

  Widget _buildButton(BuildContext context, String label, String route) {
    return SizedBox(
      width: 170,
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
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }

  List<Widget> _buildButtonRows(BuildContext context) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildButton(context, 'Page 1', AppRoutes.pageOneMedicalTerms),
          const SizedBox(width: 10), // Add spacing between the buttons
          _buildButton(context, 'Page 2', AppRoutes.notes),
        ],
      ),
      const SizedBox(height: 10), // Add spacing between rows
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildButton(context, 'Page 3', AppRoutes.medicalcalc),
          const SizedBox(width: 10), // Add spacing between the buttons
          _buildButton(context, 'Page 4', AppRoutes.medicalcalc),
        ],
      ),
      const SizedBox(height: 10), // Add spacing between rows
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildButton(context, 'Page 5', AppRoutes.translate),
          const SizedBox(width: 10), // Add spacing between the buttons
          _buildButton(context, 'Page 6', AppRoutes.translate),
        ],
      ),
      const SizedBox(height: 10), // Add spacing between rows
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildButton(context, 'Page 7', AppRoutes.questions),
          const SizedBox(width: 10), // Add spacing between the buttons
          _buildButton(context, 'Page 8', AppRoutes.questions),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tools'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // JSON Lottie image
              SizedBox(
                height: 200,
                child: Lottie.asset(
                    'assets/animations/tools.json'), // Replace with your JSON file
              ),
              const SizedBox(height: 20), // Add spacing between the image and buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildButtonRows(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
