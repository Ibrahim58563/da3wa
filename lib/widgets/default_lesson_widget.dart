import 'dart:convert';

import 'package:daawa/screens/muslim_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';

import '../screens/lesson_details_screen.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class DefaultLessonBodyWidget extends StatefulWidget {
  final int? indexOfJson;
  final String? title;
  final String? description;
  const DefaultLessonBodyWidget({
    super.key,
    required List items,
    this.description,
    required this.title,
    this.indexOfJson,
  }) : _items = items;

  final List _items;

  @override
  State<DefaultLessonBodyWidget> createState() =>
      _DefaultLessonBodyWidgetState();
}

class _DefaultLessonBodyWidgetState extends State<DefaultLessonBodyWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            muslimLessonName[widget.indexOfJson ?? 0] == "TU Credo"
                ? widget.title!
                : widget.title!,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.description != ""
                  ? ReadMoreText(
                      trimLines: 2,
                      trimLength: 100,
                      widget.description ?? "",
                      style: text18White,
                      trimCollapsedText: " Leer más",
                      trimExpandedText: " Leer menos",
                      // textAlign: TextAlign.justify,
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.separated(
                itemCount: widget._items.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LessonDetailsScreen(
                                  title: widget._items[index]['title'],
                                  video: widget._items[index]['video'] ?? "",
                                  body: widget._items[index]['body'],
                                ))),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: darkSecondaryColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              (index + 1).toString(),
                              style: text18BoldWhite,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                widget._items[index]['title'] ?? "error",
                                style: text18White,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: darkPrimaryColor,
                              child: const Icon(Icons.play_arrow_rounded),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
