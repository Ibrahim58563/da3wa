import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class AkeedahScreen extends StatefulWidget {
  const AkeedahScreen({super.key});

  @override
  State<AkeedahScreen> createState() => _AkeedahScreenState();
}

class _AkeedahScreenState extends State<AkeedahScreen> {
  List _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final Map<String, dynamic> data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][1]['lessons'];
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
              "Todas las revelaciones hechas a los profetas de las diferentes naciones ordenaban la adoración a un Único Dios, Quien no tiene socio, así como ordenaban descreer de todo lo que fuera adorado además de Él. Ese es el significado de La ilaha il la Allah Muhámmad Rasulullah (no hay divinidad excepto Allah y Muhámmad es Su Mensajero). Es a través de la pronunciación y el sentimiento en el corazón de estas palabras que la persona entra a formar parte de la religión de Allah.",
          title: "Tu fe",
        ),
      ),
    );
  }
}
