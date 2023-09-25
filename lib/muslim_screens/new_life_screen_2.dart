import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class NewLifeScreen2 extends StatefulWidget {
  const NewLifeScreen2({super.key});

  @override
  State<NewLifeScreen2> createState() => _NewLifeScreen2State();
}

class _NewLifeScreen2State extends State<NewLifeScreen2> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    // print(data);

    setState(() {
      _items = data['Muslim'][14]['lessons'];
    });
    print(_items);
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
          title: "TU NUEVA VIDA 2",
        ),
      ),
    );
  }
}
