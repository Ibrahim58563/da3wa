import 'package:daawa/categories_screen/dress_code_screen.dart';
import 'package:daawa/categories_screen/fast_screen.dart';
import 'package:daawa/categories_screen/financial_transactions_screen.dart';
import 'package:daawa/categories_screen/food_and_drink_screen.dart';
import 'package:daawa/categories_screen/new_life_screen.dart';
import 'package:daawa/categories_screen/pilgrimage_screen.dart';
import 'package:daawa/categories_screen/praryer_screen.dart';
import 'package:daawa/categories_screen/preminals_screen.dart';
import 'package:daawa/constants.dart';
import 'package:flutter/material.dart';

List<String> categoriesName = [
  'PRELIMINARIES',
  'TU SALAT',
  'TU AYUNO',
  'LA A PEREGRINACIÓN',
  'TUS TRANSACCIONES FINANCIERAS',
  'TU ALIMENTO Y TU BEBIDA',
  'TU VESTIMENTA',
  'TU NUEVA VIDA',
];
List<String> categoriesImages = [
  'assets/images/PRELIMINARIES.avif',
  'assets/images/TU SALAT.jpeg',
  'assets/images/TU AYUNO.jpeg',
  'assets/images/LA A PEREGRINACIÓN.jpeg',
  'assets/images/TUS TRANSACCIONES FINANCIERAS.webp',
  'assets/images/TU ALIMENTO Y TU BEBIDA.webp',
  'assets/images/TU VESTIMENTA.jpeg',
  'assets/images/TU NUEVA VIDA.jpeg',
];
List<Widget> screens = [
  const PreliminariesScreen(),
  const PrayerScreen(),
  const FastScreen(),
  const PilgrimageScreen(),
  const FinancialTransactionsScreen(),
  const FoodAndDrinkScreen(),
  const DressCodeScreen(),
  const NewLifeScreen(),
];

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Hola!",
              style: title,
            ),
            Expanded(
                child: ListView.separated(
              itemCount: categoriesImages.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) {
                return CategoryListItem(
                  imagePath: categoriesImages[index],
                  lessonsNumber: '14 Lesson',
                  name: categoriesName[index],
                  screenName: screens[index],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final String lessonsNumber;
  final Widget screenName;
  const CategoryListItem({
    super.key,
    required this.name,
    required this.imagePath,
    required this.lessonsNumber,
    required this.screenName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screenName));
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFFcc803),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: subTitle,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Text(
                lessonsNumber,
                style: text24Bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
