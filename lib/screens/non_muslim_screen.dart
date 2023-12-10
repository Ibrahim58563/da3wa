import 'dart:developer';
import 'package:daawa/screens/non_muslim_lesson_widget.dart';
import 'package:daawa/widgets/category_app_bar.dart';
import 'package:daawa/widgets/category_item.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          'Guía a la Verdad',
        )),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
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
                            builder: (context) => NonMuslimLessonWidget(
                              title: nonMuslimLessonName[index],
                              lessonIndex: index,
                            ),
                          ),
                        );
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
