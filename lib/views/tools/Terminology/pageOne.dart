import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:flutter/services.dart';


class Terminology {
  final String arabicMedical;
  final String arabicCommon;
  final String englishCommon;
  final String englishMedical;

  Terminology({
    required this.arabicMedical,
    required this.arabicCommon,
    required this.englishCommon,
    required this.englishMedical,
  });

  factory Terminology.fromJson(Map<String, dynamic> json) {
    return Terminology(
      arabicMedical: json['Arabic Medical'],
      arabicCommon: json['Arabic Common'],
      englishCommon: json['English Common'],
      englishMedical: json['English Medical'],
    );
  }
}

class TerminologyPage extends StatefulWidget {
  const TerminologyPage({super.key});

  @override
  _TerminologyPageState createState() => _TerminologyPageState();
}

class _TerminologyPageState extends State<TerminologyPage> {
  List<Terminology> terminologyList = [];

  @override
  void initState() {
    super.initState();
    loadTerminologyData();
  }

  Future<void> loadTerminologyData() async {
    final data = await rootBundle.loadString('assets/terminology.json');
    final json = convert.jsonDecode(data);
    setState(() {
      terminologyList = (json as List).map((item) => Terminology.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Terminology'),
      ),
      body: ListView.builder(
        itemCount: terminologyList.length,
        itemBuilder: (context, index) {
          final terminology = terminologyList[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text('Arabic Medical: ${terminology.arabicMedical}'),
              subtitle: Text('Arabic Common: ${terminology.arabicCommon}\n'
                  'English Common: ${terminology.englishCommon}\n'
                  'English Medical: ${terminology.englishMedical}'),
            ),
          );
        },
      ),
    );
  }
}
