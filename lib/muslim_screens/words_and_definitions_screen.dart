import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class WordsAndDefinitionsScreen extends StatefulWidget {
  const WordsAndDefinitionsScreen({super.key});

  @override
  State<WordsAndDefinitionsScreen> createState() =>
      _WordsAndDefinitionsScreenState();
}

class _WordsAndDefinitionsScreenState extends State<WordsAndDefinitionsScreen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][17]['lessons'];
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
          title: "Términos y palabras islámicos en Árabe idioma",
        ),
      ),
    );
  }
}
