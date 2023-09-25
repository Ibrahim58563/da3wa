import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class FinancialTransactionsScreen extends StatefulWidget {
  const FinancialTransactionsScreen({super.key});

  @override
  State<FinancialTransactionsScreen> createState() =>
      _FinancialTransactionsScreenState();
}

class _FinancialTransactionsScreenState
    extends State<FinancialTransactionsScreen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][7]['lessons'];
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
        title: "Tus transacciones financieras",
        description:
            "El Islam ha dispuesto una serie de leyes y sentencias que tienen en cuenta la naturaleza del ser humano y protegen sus derechos financieros y profesionales, tanto para ricos como para pobres, y refuerzan el sentido de solidaridad y unión en la sociedad, así como su desarrollo en todos los ámbitos.",
      )),
    );
  }
}
