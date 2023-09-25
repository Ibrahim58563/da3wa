import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class PilgrimageScreen extends StatefulWidget {
  const PilgrimageScreen({super.key});

  @override
  State<PilgrimageScreen> createState() => _PilgrimageScreenState();
}

class _PilgrimageScreenState extends State<PilgrimageScreen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][15]['lessons'];
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
              "La peregrinación a La Meca es el quinto pilar del Islam, y es un acto de culto en el que se juntan muchas otras formas de adoración, tanto físicas como espirituales y financieras. Es obligatoria para todo musulmán y musulmana que pueda realizarla, al menos una vez en la vida. Dijo Allah, el Altísimo: “Es una obligación para los hombres peregrinar a esta Casa si se encuentran en condiciones de hacerlo [físicas y económicas]. Pero quien niegue lo que Allah ha prescrito, sepa que Él puede prescindir de todas las criaturas” (Corán 3:97).",
          title: "La peregrinación",
        ),
      ),
    );
  }
}
