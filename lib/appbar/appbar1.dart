import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';

AppBar builderAppBar1({required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: TColor.white,
    centerTitle: true,
    elevation: 0.0,
    title: Text(
      title,
      style: TextStyle(
          color: TColor.primary, fontSize: 20, fontWeight: FontWeight.w700),
    ),
  );
}
