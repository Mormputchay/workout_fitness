import 'package:flutter/material.dart';
import 'package:workout_fitness/appbar/appbar2.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/language_row.dart';

class SelectLanguageView extends StatefulWidget {
  final Function(Map) disSelect;
  const SelectLanguageView({super.key, required this.disSelect});
  @override
  State<SelectLanguageView> createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
  int selectIndex = 0;
  List languageArr = [
    {"name": "English"},
    {"name": "Spanish"},
    {"name": "Hindi"},
    {"name": "Arabic"},
    {"name": "Portuguese"},
    {"name": "Bengali"},
    {"name": "Russian"},
    {"name": "Vietnamese"},
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Language",
          color_txt: Colors.white,
          color: TColor.primary,
          colorBack: TColor.white,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: ListView.separated(
        itemCount: languageArr.length,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        itemBuilder: (context, index) {
          var tObj = languageArr[index] as Map? ?? {};
          return LanguageRow(
            tObj: tObj,
            isActive: selectIndex == index,
            onPress: () {
              setState(() {
                selectIndex = index;
              });
            },
          );
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
