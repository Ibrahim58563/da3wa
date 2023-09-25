import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class FamilyScreen extends StatefulWidget {
  const FamilyScreen({super.key});

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][6]['lessons'];
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
          description:
              "El Islam da a la familia una gran importancia, garantiza su cuidado y protección de todo aquello que la pueda afectar negativamente, puesto que de la familia depende el bienestar del individuo y de la sociedad.",
          title: "Tu familia",
        ),
      ),
    );
  }
}
