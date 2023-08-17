import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/BottomNavigation.dart';
import 'package:workout_fitness/common_widget/Tab_button.dart';
import 'package:workout_fitness/common_widget/round_button.dart';
import 'package:workout_fitness/data/planArr2.dart';
import 'package:workout_fitness/view/workout/workout_detail_view.dart';

import '../../appbar/appbar2.dart';

class MealPlaView extends StatefulWidget {
  const MealPlaView({super.key});
  @override
  State<MealPlaView> createState() => _MealPlaViewState();
}

class _MealPlaViewState extends State<MealPlaView> {
  int isActiveTab = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Meal Pla",
          color_txt: Colors.black,
          color: TColor.white,
          colorBack: Colors.black,
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
                    child: TabButton(
                  title: "Water",
                  onPressed: () {
                    setState(() {
                      isActiveTab = 0;
                    });
                  },
                  isActive: isActiveTab == 0,
                )),
                Expanded(
                    child: TabButton(
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
          Expanded(
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                scrollDirection: Axis.vertical,
                itemCount: planArr2.length,
                itemBuilder: (context, index) {
                  var wObj = planArr2[index] as Map? ?? {};
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: media.width * 0.5,
                    decoration: BoxDecoration(
                        color: TColor.gray,
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Image.asset(
                          wObj["image"].toString(),
                          width: media.width,
                          height: media.width * 0.5,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: media.width,
                          height: media.width * 0.5,
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.black.withOpacity(0.7)
                                : TColor.gray.withOpacity(0.35),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wObj["title"],
                                style: TextStyle(
                                    color: TColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                wObj["name"],
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                wObj["subtitle"],
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      width: 100,
                                      height: 30,
                                      child: RoundButton(
                                        title: "see more",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WorkOutDetailView(
                                                        eObj: wObj,
                                                      )));
                                        },
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
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
