import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class NonMuslimCategoryItem extends StatelessWidget {
  final int index;
  final String? image;
  final String text;
  final Function() onTap;
  const NonMuslimCategoryItem({
    super.key,
    required this.index,
    this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.11,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: darkPrimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  (index).toString(),
                  style: text18BoldWhite.copyWith(color: darkPrimaryColor),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              image != null
                  ? Image.asset(
                      image!,
                      width: 80,
                    )
                  : const SizedBox(),
              image != null
                  ? const SizedBox(
                      width: 0,
                    )
                  : const SizedBox(),
              SizedBox(
                width: image == null
                    ? MediaQuery.of(context).size.width * 0.6
                    : null,
                child: Text(
                  text,
                  style: text18White.copyWith(color: darkSecondaryColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: darkPrimaryColor,
                  )),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
