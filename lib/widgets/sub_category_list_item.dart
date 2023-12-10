import 'dart:convert';
import 'dart:developer';

import 'package:daawa/muslim_screens/kids_screen.dart';
import 'package:daawa/muslim_screens/learn_quran_screen.dart';
import 'package:daawa/muslim_screens/new_muslim_screen.dart';
import 'package:daawa/screens/muslim_screen.dart';
import 'package:daawa/widgets/default_lesson_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/text_styles.dart';

class SubCategoryListItem extends StatefulWidget {
  final int lessonIndex;
  final String name;
  final String imagePath;
  final int lessonsNumber;
  const SubCategoryListItem({
    super.key,
    required this.name,
    required this.imagePath,
    required this.lessonsNumber,
    required this.lessonIndex,
  });

  @override
  State<SubCategoryListItem> createState() => _SubCategoryListItemState();
}

class _SubCategoryListItemState extends State<SubCategoryListItem> {
  List _items = [];
  final List _definitions = [];
  Future<void> kidsJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/kids.json');
    final data = await json.decode(response);
    // print(data);

    setState(() {
      for (var item in data) {
        log("content");
        print(item['content']);
        _items.add(item['content']);
        _definitions.add(item['title']);
        // log(item['title']);
      }
    });
  }

  Future<void> learnQuranJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    // print(data);

    setState(() {
      for (var topic in data['Muslim'][21]['lessons']) {
        _definitions.add(topic['header']);
        _items.add(topic['nestedTopics']);
        print(topic['header']);
      }
    });
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    Future<void> newMuslimJson() async {
      final String response =
          await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
      final data = await json.decode(response);
      // print(data);

      setState(() {
        for (var topic in data['Muslim'][19]['lessons']) {
          _definitions.add(topic['header']);
          _items.add(topic['nestedTopics']);
          print(topic['header']);
        }
      });
    }

    setState(() {
      if (widget.lessonIndex == 23) {
        kidsJson();
      } else if (widget.lessonIndex == 21) {
        learnQuranJson();
      } else if (widget.lessonIndex == 19) {
        newMuslimJson();
      } else {
        _items = data['Muslim'][widget.lessonIndex]['lessons'];
      }
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          if (widget.lessonIndex == 23) {
            return const KidsScreen();
          } else if (widget.lessonIndex == 21) {
            return LearnQuranScreen(
              lessonIndex: widget.lessonIndex,
            );
          } else if (widget.lessonIndex == 19) {
            return NewMuslimScreen(
              lessonIndex: widget.lessonIndex,
            );
          } else {
            return DefaultLessonBodyWidget(
              items: _items,
              indexOfJson: widget.lessonIndex,
              description: "",
              title: "El Testimonio de fe Islámica",
            );
          }
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFFcc803),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: subTitle.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.imagePath,
                  height: 250,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Text(
                "Número de lecciones: ${widget.lessonsNumber.toString()}",
                style: text24Bold.copyWith(fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}
