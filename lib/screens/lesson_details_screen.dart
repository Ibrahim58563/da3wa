import 'package:daawa/utils/app_colors.dart';
import 'package:daawa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class LessonDetailsScreen extends StatelessWidget {
  final String title;
  final String body;
  final String? video;
  const LessonDetailsScreen({
    super.key,
    required this.title,
    required this.body,
    this.video,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: body)).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Copied to your clipboard !')));
                    });
                  },
                  child: const Icon(
                    Icons.copy_rounded,
                    size: 28,
                  )),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                video != ""
                    ? Center(
                        child: InkWell(
                          onTap: () async {
                            final uri = Uri.parse(video!);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              // can't launch url
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: darkPrimaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.play_circle_fill_rounded,
                                    size: 32,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Watch on Youtube",
                                    style: text24Bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                SelectableText(
                  body,
                  // style: text18White,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
