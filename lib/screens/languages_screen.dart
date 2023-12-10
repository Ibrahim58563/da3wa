import 'package:daawa/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Idiomas"),
      ),
      body: const Column(
        children: [
          Text("English"),
          Text("Spanish"),
          Text("French"),
          Text("Arabic"),
          Text("Italian"),
          Text("German"),
        ],
      ),
    );
  }
}
