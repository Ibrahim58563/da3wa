import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class FastScreen extends StatefulWidget {
  const FastScreen({super.key});

  @override
  State<FastScreen> createState() => _FastScreenState();
}

class _FastScreenState extends State<FastScreen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][10]['lessons'];
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
              "Allah ha prescrito el ayuno para los musulmanes en un mes especial, el bendito mes de Ramadán, y lo convirtió en el cuarto pilar del Islam. Dijo Allah: “¡Oh, creyentes! Se les prescribió el ayuno al igual que a quienes los precedieron, para que alcancen la piedad” (Corán 2:183).",
          title: "El ayuno",
        ),
      ),
    );
  }
}
