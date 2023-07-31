import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class LanguageRow extends StatelessWidget {
  final Map tObj;
  final VoidCallback onPress;
  final bool isActive;
  const LanguageRow(
      {super.key,
      required this.tObj,
      required this.onPress,
      required this.isActive});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tObj["name"],
              style: TextStyle(
                  color: isActive ? TColor.primary : TColor.secondaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            if (isActive)
              Image.asset(
                "assets/img/tick.png",
                width: 30,
                height: 30,
              )
          ],
        ),
      ),
    );
  }
}
