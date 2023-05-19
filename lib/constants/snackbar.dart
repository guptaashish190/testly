import 'package:flutter/material.dart';
import 'package:testly/constants/colors.dart';

enum SnackBarType { success, error, warning, info }

Color getSnackbarBackgroundColor(SnackBarType type) {
  if (type == SnackBarType.success) {
    return AppColors.success;
  }
  if (type == SnackBarType.error) {
    return AppColors.red;
  }
  if (type == SnackBarType.warning) {
    return AppColors.yellow;
  }
  if (type == SnackBarType.info) {
    return AppColors.primary;
  }
  return AppColors.primary;
}

SnackBar snackBarWidget(text, SnackBarType snackbarType) {
  return SnackBar(
    duration: const Duration(milliseconds: 1200),
    content: Text(text),
    backgroundColor: getSnackbarBackgroundColor(snackbarType),
  );
}

void showSnackBar({
  required BuildContext context,
  required String text,
  required SnackBarType type,
}) {
  ScaffoldMessenger.of(context).showSnackBar(snackBarWidget(text, type));
}
