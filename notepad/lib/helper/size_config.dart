import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late Size screenSize;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late double backendHeight;
  static late double frontendHeight;
  static late Orientation orientation;
  static const textFieldGap = 15.5;
  static const textListGap = 15.0;
  static const double bigFieldGap = 25.0;
  static const double iconSizeNormal = 22.0;
  static const double iconSizeLage = 30.0;
  static const double iconSizeSmall = 18.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenSize = _mediaQueryData.size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    orientation = _mediaQueryData.orientation;
    backendHeight = screenSize.height - (screenSize.height * 0.88);
    frontendHeight = screenSize.height - (screenSize.height * 0.20);
    // On iPhone 11 the defaultSize = 10 almost
    // So if the screen size increase or decrease then our defaultSize also vary
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}

Widget buildDivider() => const SizedBox(
      height: 24,
      child: VerticalDivider(),
    );

// ignore: must_be_immutable
class DividerSpace extends StatelessWidget {
  double verticalGap = 20;

  DividerSpace({Key? key, required this.verticalGap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalGap),
      child: const Divider(
        thickness: 1,
      ),
    );
  }
}
