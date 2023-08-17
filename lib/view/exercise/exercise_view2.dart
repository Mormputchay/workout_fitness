import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/BottomNavigation.dart';
import 'package:workout_fitness/view/workout/workout_detail_view.dart';

import '../../appbar/appbar2.dart';
import '../../common_widget/Tab_button.dart';
import '../../data/list.dart';

class ExerciseView2 extends StatefulWidget {
  const ExerciseView2({super.key});
  @override
  State<ExerciseView2> createState() => _ExerciseView2State();
}

class _ExerciseView2State extends State<ExerciseView2> {
  int isActiveTab = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Exercise",
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
                  title: "Full Body",
                  onPressed: () {
                    setState(() {
                      isActiveTab = 0;
                    });
                  },
                  isActive: isActiveTab == 0,
                )),
                Expanded(
                    child: TabButton2(
                  title: "Foot",
                  onPressed: () {
                    setState(() {
                      isActiveTab = 1;
                    });
                  },
                  isActive: isActiveTab == 1,
                )),
                Expanded(
                    child: TabButton2(
                  title: "Arm",
                  onPressed: () {
                    setState(() {
                      isActiveTab = 2;
                    });
                  },
                  isActive: isActiveTab == 2,
                )),
                Expanded(
                    child: TabButton2(
                  title: "body",
                  onPressed: () {
                    setState(() {
                      isActiveTab = 3;
                    });
                  },
                  isActive: isActiveTab == 3,
                )),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: workArr2.length,
                itemBuilder: (context, index) {
                  var wObj = workArr2[index] as Map? ?? {};
                  return Container(
                    decoration: BoxDecoration(color: TColor.white),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              wObj["image"].toString(),
                              width: media.width,
                              height: media.width * 0.55,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: media.width,
                              height: media.width * 0.55,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            Image.asset(
                              "assets/img/play.png",
                              width: 60,
                              height: 60,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                wObj["name"],
                                style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WorkOutDetailView(
                                                  eObj: wObj,
                                                )));
                                  },
                                  icon: Image.asset("assets/img/more.png",
                                      width: 25, height: 25))
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
