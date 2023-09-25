import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class Ethics2Screen extends StatefulWidget {
  const Ethics2Screen({super.key});

  @override
  State<Ethics2Screen> createState() => _Ethics2ScreenState();
}

class _Ethics2ScreenState extends State<Ethics2Screen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    // print(data);

    setState(() {
      _items = data['Muslim'][12]['lessons'];
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
          title: "ética musulmana",
        ),
      ),
    );
  }
}
