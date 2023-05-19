import 'package:flutter/material.dart';
import 'package:testly/constants/colors.dart';
import 'package:testly/util.dart';

class BasicTextField extends StatelessWidget {
  const BasicTextField(
      {Key? key,
      required this.textController,
      this.hintText = "",
      this.textStyle,
      this.icon,
      this.keyboardType,
      this.primaryColor = false,
      this.backgroundColor = AppColors.white,
      this.multiline = false,
      this.isPassword = false,
      this.noShadow = false,
      this.borderColor,
      this.onChanged})
      : super(key: key);

  final TextEditingController textController;
  final String hintText;
  final IconData? icon;
  final bool primaryColor;
  final bool isPassword;
  final TextStyle? textStyle;
  final bool? multiline;
  final TextInputType? keyboardType;
  final Function? onChanged;
  final bool noShadow;
  final Color? borderColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.deviceHeight! * 1),
      // padding: EdgeInsets.symmetric(horizontal: SizeConfig.deviceHeight! * 1),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
            width: 0.4,
            style: borderColor != null ? BorderStyle.solid : BorderStyle.none,
            color: borderColor ?? AppColors.black),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            spreadRadius: noShadow ? 0 : 1,
            blurRadius: noShadow ? 0 : 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.deviceWidth! * 3, vertical: 0),
        child: TextField(
          keyboardType: keyboardType,
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
          controller: textController,
          obscureText: isPassword,
          maxLines: multiline == true ? null : 1,
          style: textStyle,
          decoration: getInputDecoration(),
        ),
      ),
    );
  }

  InputDecoration getInputDecoration() {
    if (icon != null) {
      return InputDecoration(
        prefixIcon: Icon(
          icon,
          color: primaryColor ? AppColors.primary : AppColors.black,
          size: SizeConfig.deviceHeight! * 3,
        ),
        border: InputBorder.none,
        hintText: hintText,
      );
    }
    return InputDecoration(
      border: InputBorder.none,
      hintText: hintText,
    );
  }
}

class PlainTextField extends StatelessWidget {
  const PlainTextField({
    Key? key,
    required this.textController,
    this.hintText = "",
    this.textStyle,
    this.icon,
    this.primaryColor = false,
    this.multiline = false,
    this.isPassword = false,
    this.prefixText,
    this.compact = false,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController textController;
  final String hintText;
  final IconData? icon;
  final bool primaryColor;
  final bool isPassword;
  final TextStyle? textStyle;
  final bool? multiline;
  final TextInputType? keyboardType;
  final bool compact;
  final String? prefixText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: compact
          ? null
          : EdgeInsets.symmetric(vertical: SizeConfig.deviceHeight! * 1),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.deviceWidth! * 3, vertical: 0),
        child: TextField(
          keyboardType: keyboardType,
          controller: textController,
          obscureText: isPassword,
          maxLines: multiline == true ? null : 1,
          style: textStyle,
          decoration: InputDecoration(
            isDense: compact,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            prefixIcon: prefixText != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Text(prefixText!),
                  )
                : null,
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
