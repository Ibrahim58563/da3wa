import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class Pray2Screen extends StatefulWidget {
  const Pray2Screen({super.key});

  @override
  State<Pray2Screen> createState() => _Pray2ScreenState();
}

class _Pray2ScreenState extends State<Pray2Screen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][16]['lessons'];
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
              "El salat es la base fundacional de la religión, y el contacto que hay entre el siervo y su Señor. Es el más grandioso de los actos de adoración y el más importante. Allah ha ordenado al musulmán que lo realice siempre, sea cual fuere su situación, estando en su lugar de residencia o de viaje, sano o enfermo.",
          title: "Tu salat",
        ),
      ),
    );
  }
}
