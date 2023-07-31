import 'package:flutter/material.dart';

import '../common/color_extension.dart';

AppBar buildAppBar3(BuildContext context) {
  return AppBar(
    backgroundColor: TColor.primary,
    centerTitle: true,
    elevation: 1,
    title: Text(
      "Climbers",
      style: TextStyle(
          fontSize: 20, color: TColor.white, fontWeight: FontWeight.w700),
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Image.asset(
        "assets/img/black_white.png",
        width: 25,
        height: 25,
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/img/node_music.png",
            width: 25,
            height: 25,
          ))
    ],
  );
}
