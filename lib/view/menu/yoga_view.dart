import 'package:flutter/material.dart';
import 'package:workout_fitness/appbar/appbar2.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/BottomNavigation.dart';
import 'package:workout_fitness/common_widget/icon_like_and_share.dart';
import 'package:workout_fitness/common_widget/text_Loreip.dart';

class YogaView extends StatefulWidget {
  const YogaView({super.key});
  @override
  State<YogaView> createState() => _YogaViewState();
}

class _YogaViewState extends State<YogaView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Yoga",
          color_txt: Colors.white,
          color: TColor.primary,
          colorBack: TColor.white,
          onPressed: () {
            Navigator.pop(context);
          }),
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
            Icon_Like_And_Share(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Tips",
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
