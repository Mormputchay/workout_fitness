import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selctTab = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              if (selctTab != 0) {
                selctTab = 0;
              }
              if (mounted) {
                setState(() {});
              }
            },
            child: Image.asset(
              "assets/img/menu_running.png",
              color: selctTab == 0 ? TColor.primary : TColor.gray,
              width: 25,
              height: 25,
            ),
          ),
          InkWell(
            onTap: () {
              if (selctTab != 1) {
                selctTab = 1;
              }
              if (mounted) {
                setState(() {});
              }
            },
            child: Image.asset(
              "assets/img/menu_meal_plan.png",
              width: 25,
              height: 25,
              color: selctTab == 1 ? TColor.primary : TColor.gray,
            ),
          ),
          InkWell(
            onTap: () {
              if (selctTab != 2) {
                selctTab = 2;
              }
              if (mounted) {
                setState(() {});
              }
            },
            child: Image.asset(
              "assets/img/menu_home.png",
              width: 25,
              height: 25,
              color: selctTab == 2 ? TColor.primary : TColor.gray,
            ),
          ),
          InkWell(
            onTap: () {
              if (selctTab != 3) {
                selctTab = 3;
              }
              if (mounted) {
                setState(() {});
              }
            },
            child: Image.asset(
              "assets/img/menu_weight.png",
              width: 25,
              height: 25,
              color: selctTab == 3 ? TColor.primary : TColor.gray,
            ),
          ),
          InkWell(
            onTap: () {
              if (selctTab != 4) {
                selctTab = 4;
              }
              if (mounted) {
                setState(() {});
              }
            },
            child: Image.asset(
              "assets/img/more.png",
              width: 25,
              height: 25,
              color: selctTab == 4 ? TColor.primary : TColor.gray,
            ),
          ),
        ],
      ),
    );
  }
}
