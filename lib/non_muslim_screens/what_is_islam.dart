import 'dart:convert';

import 'package:daawa/utils/text_styles.dart';
import 'package:daawa/widgets/non_muslim_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class WhatIsIslamScreen extends StatefulWidget {
  final String title;
  const WhatIsIslamScreen({super.key, required this.title});

  @override
  State<WhatIsIslamScreen> createState() => _FastScreenState();
}

class _FastScreenState extends State<WhatIsIslamScreen> {
  final List<dynamic> _items = [];
  final List<String> _definitions = [];

  @override
  void initState() {
    super.initState();
    readJson();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/Newdawafinal.json');
    final data = await json.decode(response);
    // print(data);

    setState(() {
      for (var topic in data[0]['topics']) {
        _definitions.add(topic['header']);
        _items.add(topic['nestedTopics']);
        print(topic['header']);
        print(topic['nestedTopics']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: whiteSubTitle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: Future.delayed(const Duration(
                      microseconds:
                          1)), // Delay for 1 second to let all topics load
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: _definitions.length,
                        itemBuilder: (context, index) {
                          return NonMuslimCategoryItem(
                              index: (index + 1),
                              // Pass the data to DefaultLessonBodyWidget
                              text: _definitions[index],
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DefaultLessonBodyWidget(
                                                items: _items[index],
                                                title: _definitions[index])));
                              } // description: _items[index]['body'],
                              // items: _items,
                              );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
