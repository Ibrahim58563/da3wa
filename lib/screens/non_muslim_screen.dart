import 'dart:convert';
import 'dart:developer';

import 'package:daawa/non_muslim_screens/christianity.dart';
import 'package:daawa/non_muslim_screens/maze.dart';
import 'package:daawa/non_muslim_screens/proof_for_islam.dart';
import 'package:daawa/non_muslim_screens/questions.dart';
import 'package:daawa/non_muslim_screens/reply.dart';
import 'package:daawa/non_muslim_screens/what_is_islam.dart';
import 'package:daawa/widgets/category_app_bar.dart';
import 'package:daawa/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<Widget> screens = [
  WhatIsIslamScreen(title: nonMuslimLessonName[0]),
  ChristianityScreen(title: nonMuslimLessonName[1]),
  ProofScreen(title: nonMuslimLessonName[2]),
  MazeScreen(title: nonMuslimLessonName[3]),
  QuestionsScreen(title: nonMuslimLessonName[4]),
  ReplyScreen(title: nonMuslimLessonName[5]),
  // QuranIsTheWordOfGod(title: nonMuslimLessonName[6]),
];

class NonMuslimScreen extends StatefulWidget {
  const NonMuslimScreen({super.key});

  @override
  State<NonMuslimScreen> createState() => _NonMuslimScreenState();
}

List nonMuslimLessonName = [
  '¿Qué es el Islam?',
  'Cristianismo',
  'El Islam es la religión de verdad',
  'Objeciones sobre el Islam',
  'Preguntas sobre el Islam',
  'Responder a las sectas',
];

class _NonMuslimScreenState extends State<NonMuslimScreen> {
  bool jsonDataLoaded = false;

  // Initialize a list to store non-Muslim lesson names.
  List<String> nonMuslimLessonName = [];

  // Fetch content from the JSON file
  Future<void> readJson() async {
    if (!jsonDataLoaded) {
      final String response =
          await rootBundle.loadString('assets/lessonsJson/Newdawafinal.json');
      final data = await json.decode(response);
      // print(data);

      setState(() {
        for (var lesson in data) {
          nonMuslimLessonName.add(lesson['sectionName']);
          print("added lesson names");
        }
        // Set the flag to true to indicate that JSON data has been loaded.
        jsonDataLoaded = true;
      });
    }
  }

  @override
  void initState() {
    // Call readJson in initState to load JSON data when the screen is first opened.
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              categoryAppBar(context),
              Expanded(
                  child: ListView.separated(
                itemCount: nonMuslimLessonName.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  log(nonMuslimLessonName.toString());
                  return CategoryItem(
                      index: (index + 1),
                      text: nonMuslimLessonName[index],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => screens[index]));
                      });
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
