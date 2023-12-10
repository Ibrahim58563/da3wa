import 'package:daawa/providers/theme_provider.dart';
import 'package:daawa/screens/info_screen.dart';
import 'package:daawa/screens/muslim_screen.dart';
import 'package:daawa/screens/non_muslim_screen.dart';
import 'package:daawa/screens/quran_screen.dart';
import 'package:daawa/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends HookConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset('assets/images/elmensaje_logo.png', height: 170),
                const SizedBox(
                  height: 15,
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
                  height: 15,
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
                  height: 15,
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
                  height: 15,
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
                const SizedBox(
                  height: 15,
                ),
                CategoryItem(
                  index: 5,
                  text: 'Configuración de',
                  image: 'assets/images/settings.png',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
