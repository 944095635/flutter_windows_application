import 'dart:ui';

import 'package:flutter/material.dart';

Widget getFilterWidget({
  Widget? child,
  double sigmaX = 12,
  double sigmaY = 12,
  bool hasColor = true, //是否具备颜色
  EdgeInsets? padding,
}) {
  return ClipRect(
    //背景模糊化
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: sigmaX,
        sigmaY: sigmaY,
      ),
      child: Container(
        color: hasColor ? const Color.fromARGB(100, 255, 255, 255) : null,
        padding: padding,
        child: child,
      ),
    ),
  );
}
