import 'package:flutter/material.dart';

AppBar buildAppBar2(
    {required String title,
    required Color color,
    required onPressed,
    required Color color_txt,
    required Color colorBack}) {
  return AppBar(
    backgroundColor: color,
    leading: IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        "assets/img/back.png",
        width: 25,
        height: 25,
        color: colorBack,
      ),
    ),
    centerTitle: true,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(
          color: color_txt, fontSize: 20, fontWeight: FontWeight.w700),
    ),
  );
}
