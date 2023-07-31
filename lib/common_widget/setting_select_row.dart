import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SettingSelectRow extends StatelessWidget {
  final Map tObj;
  final onPressed;
  const SettingSelectRow(
      {super.key, required this.tObj, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tObj["name"],
              style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: TColor.secondaryText, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                tObj["value"],
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
