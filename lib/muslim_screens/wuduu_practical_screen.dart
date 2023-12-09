import 'dart:convert';

import 'package:daawa/utils/text_styles.dart';
import 'package:daawa/widgets/non_muslim_category_item.dart';
import 'package:daawa/widgets/wuduu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class WuduuPracticalScreen extends StatefulWidget {
  final String title;
  const WuduuPracticalScreen({super.key, required this.title});

  @override
  State<WuduuPracticalScreen> createState() => _WuduuScreenState();
}

class _WuduuScreenState extends State<WuduuPracticalScreen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/All3.json');
    final data = await json.decode(response);

    setState(() {
      _items = data['Muslim'][6]["Wud"];
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
        body: WuduuWidget(
          items: _items,
          description: "",
          // title: "Tu familia",
        ),
      ),
    );
  }
}
