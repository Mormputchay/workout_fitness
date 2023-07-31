import 'package:flutter/material.dart';
import 'package:workout_fitness/appbar/appbar2.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/connect_row.dart';

class ConnectView extends StatefulWidget {
  final Function(Map) disSelect;
  const ConnectView({super.key, required this.disSelect});
  @override
  State<ConnectView> createState() => _ConnectViewState();
}

class _ConnectViewState extends State<ConnectView> {
  int selectIndex = 0;
  List connectArr = [
    {
      "name": "Connect to Facebook",
      "icon": "assets/img/fb.png",
      "color": const Color(0xff6F82FE)
    },
    {
      "name": "Connect to Twitter",
      "icon": "assets/img/twitter.png",
      "color": const Color(0xff70C0FC)
    },
    {
      "name": "Connect to LinkedIn",
      "icon": "assets/img/Linkedin.png",
      "color": const Color(0xff68CCFF)
    },
    {
      "name": "Connect to Pinterest",
      "icon": "assets/img/pinterest.png",
      "color": const Color(0xffFF6475)
    },
    {
      "name": "Connect to Reddit",
      "icon": "assets/img/reddit.png",
      "color": TColor.primary
    },
    {
      "name": "Connect to Tumblr",
      "icon": "assets/img/tumblr.png",
      "color": const Color(0xff64B5FF)
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Connected",
          color_txt: Colors.white,
          color: TColor.primary,
          colorBack: TColor.white,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              "Choose to Connect social network",
              style: TextStyle(fontSize: 20, color: TColor.secondaryText),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: connectArr.length,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              itemBuilder: (context, index) {
                var tObj = connectArr[index] as Map? ?? {};
                return ConnectRow(
                  tObj: tObj,
                  isActive: selectIndex == index,
                  onPress: () {
                    setState(() {
                      selectIndex = index;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
