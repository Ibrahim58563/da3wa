// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:daawa/utils/text_styles.dart';

class SoraContentScreen extends StatelessWidget {
  final String suraName;
  final List<dynamic> soraContentArabic;
  final List<dynamic> soraContentEspanol;
  const SoraContentScreen({
    Key? key,
    required this.soraContentArabic,
    required this.soraContentEspanol,
    required this.suraName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SelectableText(
          suraName,
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: soraContentArabic.length,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: index % 1 == 1
                          ? Colors.black.withOpacity(0.1)
                          : Colors.grey.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText(
                          soraContentArabic[index]['arabic'],
                          style: suraArabicFont,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText(
                          soraContentEspanol[index]['muhammad_isa_garcia'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
