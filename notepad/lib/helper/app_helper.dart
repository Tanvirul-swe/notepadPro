import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
}
