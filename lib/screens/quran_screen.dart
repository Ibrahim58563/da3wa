import 'dart:convert';

import 'package:daawa/screens/sora_content_screen.dart';
import 'package:daawa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  final List<dynamic> _soraName = [];
  final List<List<dynamic>> _soraContentArabic = [];
  final List<List<dynamic>> _soraContentSpanish = [];

  @override
  void initState() {
    super.initState();
    readJson();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/quran.json');
    final data = await json.decode(response);
    // print(data);

    setState(() {
      for (var sora in data) {
        _soraName.add(sora['sora']);
        _soraContentArabic.add(sora['ayat']);
        _soraContentSpanish.add(sora['ayat']);
        print(sora['sora']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Índice de suras',
        style: whiteSubTitle,
      )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SoraContentScreen(
                                  suraName: _soraName[index],
                                  soraContentEspanol:
                                      _soraContentSpanish[index],
                                  soraContentArabic: _soraContentArabic[index],
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: index % 2 == 0
                        ? Colors.white.withOpacity(0.15)
                        : Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _soraName[index],
                        textAlign: TextAlign.center,
                        style: text24BoldWhite,
                      ),
                    ),
                  ),
                );
              },
              itemCount: _soraName.length,
            ),
          ),
        ],
      ),
    );
  }
}
