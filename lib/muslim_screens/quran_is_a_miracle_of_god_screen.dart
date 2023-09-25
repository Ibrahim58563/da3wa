import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class QuranIsAMiracleOfGod extends StatefulWidget {
  const QuranIsAMiracleOfGod({super.key});

  @override
  State<QuranIsAMiracleOfGod> createState() => _QuranIsAMiracleOfGodState();
}

class _QuranIsAMiracleOfGodState extends State<QuranIsAMiracleOfGod> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][22]['lessons'];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultLessonBodyWidget(
          items: _items,
          description: "",
          title: "El Corán es la palabra de Dios",
        ),
      ),
    );
  }
}
