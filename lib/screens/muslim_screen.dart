import 'dart:convert';

import 'package:daawa/muslim_screens/3akeedah_screen.dart';
import 'package:daawa/muslim_screens/dress_code_screen.dart';
import 'package:daawa/muslim_screens/ethics_1_screen.dart';
import 'package:daawa/muslim_screens/ethics_2_screen.dart';
import 'package:daawa/muslim_screens/family_screen.dart';
import 'package:daawa/muslim_screens/fast_screen.dart';
import 'package:daawa/muslim_screens/financial_transactions_screen.dart';
import 'package:daawa/muslim_screens/food_and_drink_screen.dart';
import 'package:daawa/muslim_screens/kids_screen.dart';
import 'package:daawa/muslim_screens/learn_quran_screen.dart';
import 'package:daawa/muslim_screens/new_life_screen.dart';
import 'package:daawa/muslim_screens/new_life_screen_2.dart';
import 'package:daawa/muslim_screens/new_muslim_screen.dart';
import 'package:daawa/muslim_screens/pilgrimage_screen.dart';
import 'package:daawa/muslim_screens/practical_practice_screen.dart';
import 'package:daawa/muslim_screens/pray_1_screen.dart';
import 'package:daawa/muslim_screens/pray_2_screen.dart';
import 'package:daawa/muslim_screens/preminals_screen.dart';
import 'package:daawa/muslim_screens/quran_is_a_miracle_of_god_screen.dart';
import 'package:daawa/muslim_screens/seerah_screen.dart';
import 'package:daawa/muslim_screens/shahadah_screen.dart';
import 'package:daawa/muslim_screens/shi3a_screen.dart';
import 'package:daawa/muslim_screens/taharah_screen.dart';
import 'package:daawa/muslim_screens/words_and_definitions_screen.dart';
import 'package:daawa/muslim_screens/zakat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/category_app_bar.dart';
import '../widgets/sub_category_list_item.dart';

List<String> muslimLessonName = [
  'Los dos testimonios de fe',
  'TU Credo',
  'TU Pureza',
  'TU SALAT 1',
  "Enseñanza Practica",
  'TU ALIMENTO Y TU BEBIDA',
  'TU VESTIMENTA',
  'La familia',
  'TUS TRANSACCIONES FINANCIERAS',
  'Moral 1',
  'TU NUEVA VIDA 1',
  'TU AYUNO',
  'Biografia del profeta',
  'Moral 2',
  'TU Zakat',
  'TU NUEVA VIDA 2',
  'LA A PEREGRINACIÓN',
  'TU SALAT 2',
  'Términos y palabras islámicos en Árabe idioma',
  'Sobre los chiías',
  'Curso para el nuevo musulmán',
  'PRELIMINARIES',
  'Aprende el Corán',
  'El Corán es la palabra de Dios',
  'TU Niños',
];
List<String> muslimLessonImages = [
  'assets/images/shahadah.jpeg',
  'assets/images/3akeedah.webp',
  'assets/images/tahara.jpeg',
  'assets/images/TU SALAT.jpeg',
  'assets/images/TU SALAT.jpeg',
  'assets/images/TU ALIMENTO Y TU BEBIDA.webp',
  'assets/images/TU VESTIMENTA.jpeg',
  'assets/images/family.jpeg',
  'assets/images/TUS TRANSACCIONES FINANCIERAS.webp',
  'assets/images/ethics.jpeg',
  'assets/images/TU NUEVA VIDA.jpeg',
  'assets/images/TU AYUNO.jpeg',
  'assets/images/seerah.jpeg',
  'assets/images/ethics2.jpeg',
  'assets/images/zakah.jpeg',
  'assets/images/new_life_2.jpeg',
  'assets/images/LA A PEREGRINACIÓN.jpeg',
  'assets/images/pray2.jpeg',
  'assets/images/words.jpeg',
  'assets/images/shi3a.webp',
  'assets/images/new_muslim.webp',
  'assets/images/quill_pen.jpeg',
  'assets/images/learn_quran.png',
  'assets/images/miracle.jpg',
  'assets/images/kids.jpeg',
];
List<Widget> screens = [
  const ShahadahScreen(),
  const AkeedahScreen(),
  const TaharahScreen(),
  const Pray1Screen(),
  const PracticalPracticeScreen(),
  const FoodAndDrinkScreen(),
  const DressCodeScreen(),
  const FamilyScreen(),
  const FinancialTransactionsScreen(),
  const Ethics1Screen(),
  const NewLifeScreen(),
  const FastScreen(),
  const SeerahScreen(),
  const Ethics2Screen(),
  const ZakatScreen(),
  const NewLifeScreen2(),
  const PilgrimageScreen(),
  const Pray2Screen(),
  const WordsAndDefinitionsScreen(),
  const Shi3aScreen(),
  const NewMuslimScreen(),
  const PreliminariesScreen(),
  const LearnQuranScreen(),
  const QuranIsAMiracleOfGod(),
  const KidsScreen(),
];

class MuslimScreen extends StatefulWidget {
  const MuslimScreen({super.key});

  @override
  State<MuslimScreen> createState() => _MuslimScreenState();
}

List<int>? lessonsLength;

class _MuslimScreenState extends State<MuslimScreen> {
  bool isDataLoaded = false; // Add this flag

  Future<void> calcLength() async {
    lessonsLength = [];
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);

    for (var lesson in data['Muslim']) {
      setState(() {
        lessonsLength?.add((lesson['lessons'].length));
        finishLoop++;
      });
      if (lesson['title'] == "La oración Nivel 1") {
        lessonsLength?.add(3);
      }
      if (lesson['title'] == "El Corán es la palabra de Dios") {
        break;
      }
    }
    lessonsLength
        ?.add(9); // this is the kids length because it's in a separate file
    setState(() {
      isDataLoaded = true;
    });
  }

  int finishLoop = 0;

  @override
  void initState() {
    calcLength();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              categoryAppBar(context),
              Expanded(
                child: isDataLoaded // Check if data is loaded before building
                    ? ListView.separated(
                        itemCount: muslimLessonImages.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) {
                          return SubCategoryListItem(
                            imagePath: muslimLessonImages[index],
                            lessonsNumber: lessonsLength![index],
                            name: muslimLessonName[index],
                            screenName: screens[index],
                          );
                        },
                      )
                    : const Center(
                        child:
                            CircularProgressIndicator()), // Show loading indicator if data is not loaded
              ),
            ],
          ),
        ),
      ),
    );
  }
}
