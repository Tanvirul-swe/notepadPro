import 'package:flutter/material.dart';
import 'package:notepad/CustomFile/CustomColors/customColors.dart';

class TitleTextIField extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  const TitleTextIField({required this.lable, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      validator: (input) => input!.isEmpty ? null : null,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: textFieldColor,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.yellow, width: 0.0),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: lable,
        hintStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class ContentTextField extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  const ContentTextField({required this.lable, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (input) => input!.isEmpty ? null : null,
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.yellow, width: 0.0),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: lable,
        hintStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      ),
    );
  }
}
