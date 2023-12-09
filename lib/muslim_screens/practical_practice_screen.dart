import 'package:daawa/muslim_screens/pray_practical_screen.dart';
import 'package:daawa/muslim_screens/wuduu_practical_screen.dart';
import 'package:daawa/widgets/category_item.dart';
import 'package:flutter/material.dart';
import '../widgets/category_app_bar.dart';

List<String> practicalPracticeLessonName = [
  "Wuduu",
  "Oración",
  "Azkar",
];
List<Widget> screens = [
  const WuduuPracticalScreen(title: "Wuduu"),
  const PrayPracticalScreen(title: "Oración"),
];

class PracticalPracticeScreen extends StatefulWidget {
  const PracticalPracticeScreen({super.key});

  @override
  State<PracticalPracticeScreen> createState() =>
      _PracticalPracticeScreenState();
}

List<int>? lessonsLength;

class _PracticalPracticeScreenState extends State<PracticalPracticeScreen> {
  int finishLoop = 0;
  @override
  void initState() {
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
                child: ListView.separated(
                  itemCount: practicalPracticeLessonName.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                        index: (index + 1),
                        text: practicalPracticeLessonName[index],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => screens[index]));
                        });
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
