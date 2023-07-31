import 'package:flutter/material.dart';
import 'package:workout_fitness/appbar/appbar2.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/BottomNavigation.dart';

import '../../common_widget/text_Loreip.dart';

class TipsDetailView extends StatefulWidget {
  final Map tObj;
  const TipsDetailView({super.key, required this.tObj});
  @override
  State<TipsDetailView> createState() => _TipsDetailViewState();
}

class _TipsDetailViewState extends State<TipsDetailView> {
  bool clickLike = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Tips",
          color: TColor.primary,
          onPressed: () {
            Navigator.pop(context);
          },
          color_txt: Colors.white,
          colorBack: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/img/1.png",
              width: media.width,
              height: media.width * 0.55,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.tObj["name"],
                    style: TextStyle(
                        fontSize: 20,
                        color: TColor.secondaryText,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Text(
                "Drink water",
                style: TextStyle(
                    fontSize: 18,
                    color: TColor.secondaryText,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Text_Loreip(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Text(
                "Calories",
                style: TextStyle(
                    fontSize: 18,
                    color: TColor.secondaryText,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Text_Loreip(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 1,
        child: BottomNavigation(),
      ),
    );
  }
}
