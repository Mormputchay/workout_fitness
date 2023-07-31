import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/BottomNavigation.dart';

import '../../appbar/appbar2.dart';
import '../../common_widget/Tab_button.dart';

class MealPlaView2 extends StatefulWidget {
  const MealPlaView2({super.key});
  @override
  State<MealPlaView2> createState() => _MealPlaView2State();
}

class _MealPlaView2State extends State<MealPlaView2> {
  int isActiveTab = 0;
  List workArr = [
    {
      "name": "Breafast",
      "title": "vegetable, Sandwich",
      "image": "assets/img/f1.png"
    },
    {
      "name": "Snack",
      "title": "Boat, nut, butter",
      "image": "assets/img/f2.png"
    },
    {
      "name": "Breafast",
      "title": "vegetable, Sandwich",
      "image": "assets/img/f3.png",
    },
    {
      "name": "Snack",
      "title": "Boat, nut, butter",
      "image": "assets/img/f4.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Meal Plan",
          color_txt: Colors.white,
          color: TColor.primary,
          colorBack: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: TColor.white, boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
            ]),
            child: Row(
              children: [
                Expanded(
                    child: TabButton2(
                  title: "Water",
                  onPressed: () {
                    setState(() {
                      isActiveTab = 0;
                    });
                  },
                  isActive: isActiveTab == 0,
                )),
                Expanded(
                    child: TabButton2(
                  title: "Food",
                  onPressed: () {
                    setState(() {
                      isActiveTab = 1;
                    });
                  },
                  isActive: isActiveTab == 1,
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/img/black_fo.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Sunday, AUG 26",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/img/next_go.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                  itemCount: workArr.length,
                  itemBuilder: (context, index) {
                    var wObj = workArr[index] as Map? ?? {};
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(color: TColor.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              wObj["image"].toString(),
                              width: media.width,
                              height: media.width * 0.55,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            wObj["name"],
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            wObj["title"],
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 1,
        child: BottomNavigation(),
      ),
    );
  }
}
