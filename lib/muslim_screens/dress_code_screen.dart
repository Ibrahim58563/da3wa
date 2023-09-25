import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class DressCodeScreen extends StatefulWidget {
  const DressCodeScreen({super.key});

  @override
  State<DressCodeScreen> createState() => _DressCodeScreenState();
}

class _DressCodeScreenState extends State<DressCodeScreen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][5]['lessons'];
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
        title: "Tu vestimenta",
        description:
            "La vestimenta es una de las gracias de Allah. Dice en el Corán: “¡Oh, hijos de Adán! Los hemos provisto con vestimentas para que se cubran y se engalanen con ellas. Y [sepan que] es mejor engalanar sus corazones con la piedad. Esto en un signo de Allah para que recapaciten” (Corán 7:26).",
      )),
    );
  }
}
