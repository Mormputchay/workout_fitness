import 'package:flutter/material.dart';
import 'package:workout_fitness/appbar/appbar2.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/BottomNavigation.dart';
import 'package:workout_fitness/common_widget/setting_select_row.dart';
import 'package:workout_fitness/common_widget/setting_switch_row.dart';
import 'package:workout_fitness/view/settings/connect_view.dart';
import 'package:workout_fitness/view/settings/select_language_view.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});
  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  List settingArr = [
    {"name": "Reminders", "type": "switch", "value": "false"},
    {"name": "Language", "type": "select", "value": "ENGLISH"},
    {"name": "Connected", "type": "select", "value": "FACEBOOK"},
    {"name": "Apple health", "type": "switch", "value": "true"},
    {"name": "Introducing about meal plan", "type": "switch", "value": "false"},
    {"name": "Water and Food", "type": "switch", "value": "false"},
    {"name": "How many times a day to eat", "type": "switch", "value": "false"},
    {"name": "Become stronger", "type": "switch", "value": "false"},
    {"name": "Shoes To Training", "type": "switch", "value": "false"},
    {"name": "Appeal Tips", "type": "switch", "value": "false"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Settings",
          color_txt: Colors.white,
          color: TColor.primary,
          colorBack: TColor.white,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: ListView.separated(
        itemCount: settingArr.length,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        itemBuilder: (context, index) {
          var tObj = settingArr[index] as Map? ?? {};
          if (tObj["type"] == "switch") {
            return SettingSwitchRow(
              tObj: tObj,
              onChanged: (newVal) {
                setState(() {
                  settingArr[index]["value"] = newVal ? "true" : "false";
                });
              },
            );
          } else if (tObj["type"] == "select") {
            return SettingSelectRow(
                tObj: tObj,
                onPressed: () {
                  if (tObj["name"] == "Language") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SelectLanguageView(disSelect: (newVal) {})));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ConnectView(disSelect: (newVal) {})));
                  }
                });
          } else {
            return Container();
          }
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
