import 'package:daawa/screens/info_screen.dart';
import 'package:daawa/screens/muslim_screen.dart';
import 'package:daawa/screens/non_muslim_screen.dart';
import 'package:daawa/screens/quran_screen.dart';
import 'package:flutter/material.dart';
import '../utils/text_styles.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Categorías",
                style: titleStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              CategoryItem(
                index: 1,
                text: 'Aprender el Islam',
                image: 'assets/images/islam_icon.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MuslimScreen()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CategoryItem(
                index: 2,
                text: 'Guía a la Verdad',
                image: 'assets/images/christinaty.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NonMuslimScreen()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CategoryItem(
                index: 3,
                text: 'El sagrado Corán',
                image: 'assets/images/quran.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuranScreen()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CategoryItem(
                index: 4,
                text: 'Idea del programa',
                image: 'assets/images/question_mark.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InfoScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
