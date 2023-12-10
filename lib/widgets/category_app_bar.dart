import 'package:daawa/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/text_styles.dart';

Row categoryAppBar(BuildContext context) {
  // final appThemeState = ref.watch(appThemeStateNotifier);

  return Row(
    children: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          )),
      Flexible(
        child: Center(
          child: Text("Hola!", style: titleStyle
              // .copyWith(color:appThemeState.isDarkModeEnabled
              //     ? lightSecondaryColor
              //     : darkPrimaryColor),
              ),
        ),
      ),
    ],
  );
}
