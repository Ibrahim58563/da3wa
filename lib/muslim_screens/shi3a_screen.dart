import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class Shi3aScreen extends StatefulWidget {
  const Shi3aScreen({super.key});

  @override
  State<Shi3aScreen> createState() => _Shi3aScreenState();
}

class _Shi3aScreenState extends State<Shi3aScreen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][18]['lessons'];
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
          title: "Sobre los chiías",
        ),
      ),
    );
  }
}
