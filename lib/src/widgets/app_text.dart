import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.fontStyle,
      this.color});

  final String text;
  final AppTextWeight? fontWeight;
  final TextStyle? fontStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    String getFontWeight() {
      switch (fontWeight) {
        case AppTextWeight.bold:
          {
            return "Lato-Bold";
          }
        case AppTextWeight.light:
          {
            return "Lato-Light";
          }
        case AppTextWeight.black:
          {
            return "Lato-Black";
          }
        default:
          {
            return "Lato-Regular";
          }
      }
    }

    return Text(text,
        style: fontStyle != null
            ? fontStyle!.copyWith(fontFamily: getFontWeight())
            : TextStyle(fontFamily: getFontWeight()));
  }
}

enum AppTextWeight { bold, regular, light, black }
