import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notepad/CustomFile/CustomColors/customColors.dart';
import 'package:notepad/CustomFile/app_assets.dart';
import 'package:notepad/helper/size_config.dart';

class AppHelper {
  late BuildContext context;
  late DateTime currentBackPressTime;

  AppHelper.of(BuildContext _context) {
    context = _context;
  }

  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: const SpinKitRotatingCircle(
          color: Colors.black,
          size: 50.0,
        ),
      );
    });
    return loader;
  }

  static showLoader(BuildContext context, OverlayEntry loader) {
    Overlay.of(context)!.insert(loader);
  }

  static hideLoader(OverlayEntry loader) {
    Timer(const Duration(milliseconds: 500), () {
      try {
        loader.remove();
        // ignore: empty_catches
      } catch (e) {}
    });
  }

  Widget emptyView() {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Image.asset(
        AppAssets.emptySvgImage,
        height: AppHelper.getProportionateScreenHeight(size.height * 0.5),
      ),
    );
  }

  static double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = SizeConfig.screenHeight;
    // 812 is the layout height that designer use
    return (inputHeight / 812.0) * screenHeight;
  }

  Widget errorView() {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Image.asset(
        AppAssets.emptySvgImage,
        height: AppHelper.getProportionateScreenHeight(size.height * 0.5),
      ),
    );
  }
}
