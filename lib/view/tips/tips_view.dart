import 'package:flutter/material.dart';
import 'package:workout_fitness/appbar/appbar2.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/BottomNavigation.dart';
import 'package:workout_fitness/common_widget/tip_row.dart';
import 'package:workout_fitness/view/tips/tips_details_view.dart';

class TipsView extends StatefulWidget {
  const TipsView({super.key});
  @override
  State<TipsView> createState() => _TipsViewState();
}

class _TipsViewState extends State<TipsView> {
  List tipArr = [
    {"name": "About Traning"},
    {"name": "How to weight loss?"},
    {"name": "Introducing about meal plan"},
    {"name": "Water and Food"},
    {"name": "How many times a day to eat"},
    {"name": "Become stronger"},
    {"name": "Shoes To Training"},
    {"name": "Appeal Tips"}
  ];
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Tips",
          color_txt: Colors.white,
          color: TColor.primary,
          colorBack: TColor.white,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: ListView.separated(
        itemCount: tipArr.length,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        itemBuilder: (context, index) {
          var tObj = tipArr[index] as Map? ?? {};
          return TipRows(
            tObj: tObj,
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TipsDetailView(tObj: tObj)));
            },
            isActive: index == 0,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.black26,
            height: 1,
          );
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 1,
        child: BottomNavigation(),
      ),
    );
  }
}
