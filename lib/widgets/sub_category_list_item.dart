import 'package:flutter/material.dart';

import '../utils/text_styles.dart';

class SubCategoryListItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final int lessonsNumber;
  final Widget screenName;
  const SubCategoryListItem({
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
                style: subTitle.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  height: 250,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Text(
                "Número de lecciones: ${lessonsNumber.toString()}",
                style: text24Bold.copyWith(fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}
