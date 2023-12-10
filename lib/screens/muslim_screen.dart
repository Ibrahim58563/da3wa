import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/sub_category_list_item.dart';

List<String> muslimLessonName = [
  'Los dos testimonios de fe',
  'TU Credo',
  'TU Pureza',
  'TU SALAT 1',
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
List<int> jsonIndexOfFile = [
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
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
        appBar: AppBar(
          title: const Text("Aprender el Islam"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: isDataLoaded // Check if data is loaded before building
                    ? ListView.separated(
                        itemCount: muslimLessonImages.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) {
                          return SubCategoryListItem(
                            lessonIndex: jsonIndexOfFile[index],
                            imagePath: muslimLessonImages[index],
                            lessonsNumber: lessonsLength![index],
                            name: muslimLessonName[index],
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
