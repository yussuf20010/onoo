import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_pro/core/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';


class ToolsMainScreen extends StatelessWidget {
  const ToolsMainScreen({super.key});

  Widget _buildButton(BuildContext context, String label, IconData icon, String route) {
    return SizedBox(
      width: 170,
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 40, color: const Color(0xFF00C897)),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtonRows(BuildContext context) {
    return [
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: <Widget>[
      //     _buildButton(context, tr('ai_chat'), Icons.chat, AppRoutes.mainchatscreen),
      //     _buildButton(context, tr('note'), Icons.note_add, AppRoutes.notes),
      //
      //   ],
      // ),
      // const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButton(context, tr('calculators'), Icons.calculate, AppRoutes.medicalcalc),
          _buildButton(context, tr('questions'), Icons.question_mark, AppRoutes.questions),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButton(context, tr('chat_rooms'), Icons.groups, AppRoutes.chatrooms),
          _buildButton(context, tr('translator'), Icons.translate, AppRoutes.translate),

        ],
      ),
      // const SizedBox(height: 20),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: <Widget>[
      //     _buildButton(context, tr('terminology'), Icons.abc, AppRoutes.translate),
      //   ],
      // ),
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
              SizedBox(
                height: 200,
                child: Lottie.asset('assets/animations/tools.json'),
              ),
              const SizedBox(height: 20),
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
