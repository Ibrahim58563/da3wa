import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class FoodAndDrinkScreen extends StatefulWidget {
  const FoodAndDrinkScreen({super.key});

  @override
  State<FoodAndDrinkScreen> createState() => _FoodAndDrinkScreenState();
}

class _FoodAndDrinkScreenState extends State<FoodAndDrinkScreen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][4]['lessons'];
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
              "Alimentarse de lo lícito tiene mucha importancia en el Islam, pues es motivo de respuesta favorable a las súplicas y de las bendiciones para la familia y las propiedades. Como alimentación Halal se entiende todo alimento lícito, que haya sido adquirid de manera lícita y con dinero lícito, sin haber abusado de los demás.",
          title: "Tu alimento y tu bebida",
        ),
      ),
    );
  }
}
