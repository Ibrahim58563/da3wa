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
      body: const Center(
        child: Text(
          "Próximamente...",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
