import 'package:flutter/material.dart';
import 'package:notepad/CustomFile/CustomColors/customColors.dart';

class TitleTextIField extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  const TitleTextIField(
      {Key? key, required this.lable, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: const TextStyle(color: AppColor.whiteColor, fontSize: 32),
      validator: (input) => input!.isEmpty ? null : null,
      controller: controller,
      cursorColor: AppColor.bottomColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.backgroundColor,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.yellow, width: 0.0),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: lable,
        hintStyle: const TextStyle(
            color: Color(0xFF9A9A9A),
            fontWeight: FontWeight.w400,
            fontSize: 32),
      ),
    );
  }
}

class ContentTextField extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  final Color color;
  final double fontSize;
  final bool isBold;
  final bool isItalic;
  const ContentTextField({
    Key? key,
    required this.lable,
    required this.controller,
    required this.color,
    required this.fontSize,
    required this.isBold,
    required this.isItalic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (input) => input!.isEmpty ? null : null,
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      cursorColor: AppColor.bottomColor,
      style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
          color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.backgroundColor,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.yellow, width: 0.0),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: lable,
        hintStyle: const TextStyle(
            color: Color(0xFF9A9A9A),
            fontWeight: FontWeight.w400,
            fontSize: 23),
      ),
    );
  }
}
