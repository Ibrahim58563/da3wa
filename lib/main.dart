// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daawa/providers/theme_provider.dart';
import 'package:daawa/utils/app_themes.dart';
import 'package:daawa/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'package:daawa/screens/categories_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // print(1000 ~/ (12 * (50 / 100)));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeStateNotifier);
    return MaterialApp(
      title: 'El Mensaje',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: theme.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: const CategoriesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
