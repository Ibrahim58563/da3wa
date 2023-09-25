// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daawa/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'package:daawa/screens/categories_screen.dart';

void main() {
  // print(1000 ~/ (12 * (50 / 100)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El Mensaje',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.white)),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          background: Colors.black,
        ),
      ),
      home: const CategoriesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
