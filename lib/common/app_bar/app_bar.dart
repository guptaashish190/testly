import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testly/constants/colors.dart';
import 'package:testly/src/widgets/app_text.dart';
import 'package:testly/util.dart';

import '../../src/widgets/spacing.dart';

PreferredSize appBar({required String title, List<Widget>? rightActions}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.grey.withOpacity(0.3),
          offset: const Offset(0, 2.0),
          blurRadius: 4.0,
        )
      ]),
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: AppColors.primary,
            statusBarIconBrightness: Brightness.dark),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: AppColors.darkGrey, //change your color here
        ),
        title: AppText(
          text: title,
          fontWeight: AppTextWeight.black,
          fontStyle: TextStyle(
            color: AppColors.white,
            fontSize: SizeConfig.deviceHeight! * 2.3,
          ),
        ),
        backgroundColor: AppColors.primary,
        actions: [
          if (rightActions != null) ...rightActions,
          if (rightActions == null)
            Padding(
                padding: EdgeInsets.only(right: SizeConfig.deviceWidth! * 5),
                child: Icon(
                  Icons.person,
                  color: AppColors.white,
                ))
        ],
      ),
    ),
  );
}
