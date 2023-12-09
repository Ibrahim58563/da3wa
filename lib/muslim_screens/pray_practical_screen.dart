import 'dart:convert';

import 'package:daawa/muslim_screens/default_pray_practical_screen.dart';
import 'package:daawa/utils/text_styles.dart';
import 'package:daawa/widgets/category_app_bar.dart';
import 'package:daawa/widgets/category_item.dart';
import 'package:daawa/widgets/non_muslim_category_item.dart';
import 'package:daawa/widgets/wuduu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class PrayPracticalScreen extends StatefulWidget {
  final String title;
  const PrayPracticalScreen({super.key, required this.title});

  @override
  State<PrayPracticalScreen> createState() => PrayScreenState();
}

class PrayScreenState extends State<PrayPracticalScreen> {
  var _items;
  List<Widget> screens = [];
  List<String> prayNames = [
    'Fajr',
    'Duhr',
    'Asr',
    'Maghreb',
    'Ishaa',
  ];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/All3.json');
    final data = await json.decode(response);

    setState(() {
      _items = data['Muslim'][6]['salauate'];
    });
    print(_items);
    print(_items.runtimeType);
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              categoryAppBar(context),
              Expanded(
                  child: ListView.separated(
                itemCount: prayNames.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  return CategoryItem(
                      index: (index + 1),
                      text: prayNames[index],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DefaultPrayPracticalScreen(
                                      title: prayNames[index],
                                      items: _items[prayNames[index]],
                                    )));
                      });
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
