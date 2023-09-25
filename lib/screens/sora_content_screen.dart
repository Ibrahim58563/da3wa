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
          style: whiteSubTitle,
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
                      color: Colors.white.withOpacity(0.15),
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
                          style: text18White,
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
