import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notepad/CustomFile/CustomColors/customColors.dart';

Widget builderLoader(double height, double width) {
  return Container(
    height: height,
    width: width,
    color: AppColor.backgroundColor,
    child: const Center(
      child: SpinKitThreeInOut(
        color: AppColor.whiteColor,
        size: 50.0,
      ),
    ),
  );
}

Widget actionBottom({required IconData icon, required VoidCallback onPress}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF3B3B3B),
        ),
        child: Icon(icon)),
  );
}
