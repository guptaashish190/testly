import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../src/widgets/app_text.dart';
import '../util.dart';
import 'colors.dart';

class AppGradientButton extends StatelessWidget {
  const AppGradientButton(
      {super.key,
      required this.color1,
      required this.color2,
      required this.text});

  final Color color1;
  final Color color2;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: MaterialButton(
        textColor: AppColors.white,
        child: AppText(
          text: text,
          fontWeight: AppTextWeight.bold,
          fontStyle: TextStyle(fontSize: SizeConfig.deviceHeight! * 2.3),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
