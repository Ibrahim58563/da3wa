import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../screens/lesson_details_screen.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class WuduuWidget extends StatelessWidget {
  final String? stepName;
  final String? body;
  final String? transliteration;
  final String? translation;
  final String? description;
  final String? audio;
  final String? video;
  final String? image;
  final List? items;
  const WuduuWidget({
    super.key,
    this.items,
    this.description,
    this.stepName,
    this.body,
    this.transliteration,
    this.translation,
    this.audio,
    this.video,
    this.image,
  });

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
                        "Enseñanza Practica",
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
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.separated(
                itemCount: items!.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Paso ${index + 1}",
                            style: text24Bold,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            items![index]["StepName"],
                            style: text18Bold,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: CircleAvatar(
                              backgroundColor: primaryColor,
                              child: const Icon(Icons.play_arrow_rounded),
                            ),
                          ),
                          Text(
                            items![index]["description"],
                            style: text18,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
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
