import 'package:flutter/cupertino.dart';

import 'color_constants.dart';

Widget verticalLine({height, width, color, marginLeft}) {
  return Container(
    margin: EdgeInsets.only(left: marginLeft ?? 10),
    height: height ?? 5,
    width: width ?? 70,
    decoration: BoxDecoration(
        color: color ?? kSecondaryColor,
        borderRadius: BorderRadius.circular(15)),
  );
}
