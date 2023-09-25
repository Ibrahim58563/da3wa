import 'package:flutter/material.dart';

import '../utils/text_styles.dart';

Row categoryAppBar(BuildContext context) {
  return Row(
    children: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          )),
      Flexible(
        child: Center(
          child: Text(
            "Hola!",
            style: titleStyle,
          ),
        ),
      ),
    ],
  );
}
