import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../screens/lesson_details_screen.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class KidsLessonBodyWidget extends StatelessWidget {
  final String title;
  final String? description;
  const KidsLessonBodyWidget({
    super.key,
    required List items,
    required this.title,
    this.description,
  }) : _items = items;

  final List _items;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      )),
                  Flexible(
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: titleStyle.copyWith(fontSize: 32),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              description != ""
                  ? ReadMoreText(
                      trimLines: 2,
                      description ?? "",
                      style: text18White,
                      // textAlign: TextAlign.justify,
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.separated(
                itemCount: _items.length,
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
                                  title: _items[index]['question'],
                                  video: _items[index]['video'] ?? "",
                                  body: _items[index]['answer'],
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
                                _items[index]['question'],
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
