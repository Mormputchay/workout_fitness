import 'package:flutter/material.dart';
import 'package:workout_fitness/appbar/appbar2.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/setting_slider_row.dart';
import 'package:workout_fitness/common_widget/setting_switch_row.dart';

class RunningSettingView extends StatefulWidget {
  const RunningSettingView({super.key});
  @override
  State<RunningSettingView> createState() => _RunningSettingViewState();
}

class _RunningSettingViewState extends State<RunningSettingView> {
  List settingArr = [
    {"name": "GPS", "type": "switch", "value": "false"},
    {"name": "Auto Push", "type": "switch", "value": "false"},
    {"name": "Pause run for calls", "type": "switch", "value": "false"},
    {"name": "Audio Feedback", "type": "slider", "value": "50"},
    {"name": "Time", "type": "slider", "value": "50"},
    {"name": "Distance", "type": "slider", "value": "50"},
    {"name": "Voice Volume", "type": "switch", "value": "true"},
    {"name": "Time", "type": "switch", "value": "false"},
    {"name": "Distance", "type": "switch", "value": "false"},
    {"name": "Pace", "type": "switch", "value": "false"},
    {"name": "Speed", "type": "switch", "value": "false"},
    {"name": "Calories", "type": "switch", "value": "false"},
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
          } else if (tObj["type"] == "slider") {
            return SettingSliderRow(
              tObj: tObj,
              onChanged: (newVal) {
                setState(() {
                  settingArr[index]["value"] = newVal.toString();
                });
              },
            );
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
    );
  }
}
