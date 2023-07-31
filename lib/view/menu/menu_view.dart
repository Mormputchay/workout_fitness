import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/meun_cell.dart';
import 'package:workout_fitness/view/exercise/exercise_view2.dart';
import 'package:workout_fitness/view/home/home_view.dart';
import 'package:workout_fitness/view/meal_plan/meal_plan_view2.dart';
import 'package:workout_fitness/view/running/running_view.dart';
import 'package:workout_fitness/view/schedule/suchedule_view.dart';
import 'package:workout_fitness/view/settings/setting_view.dart';
import 'package:workout_fitness/view/tips/tips_view.dart';
import 'package:workout_fitness/view/weight/weight_view.dart';

import '../../common_widget/Drawer_Navigation.dart';
import '../../data/menuArr.dart';
import '../../data/planArr1.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer_Navigation(media: media, planArr: planArr1),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: media.width * 0.6,
              collapsedHeight: kToolbarHeight + 20,
              flexibleSpace: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    "assets/img/1.png",
                    width: media.width,
                    height: media.width * 0.8,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.8,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                              color: TColor.white,
                              borderRadius: BorderRadius.circular(27)),
                          alignment: Alignment.center,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                "assets/img/u1.png",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Code For Any",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: TColor.white,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(
                                height: 4,
                              ),
                              Text("Profile",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: TColor.white,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ];
        },
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1),
          itemCount: menuArr.length,
          itemBuilder: ((context, index) {
            var mObj = menuArr[index] as Map? ?? {};
            return MenuCell(
              mObj: mObj,
              onPressed: () {
                switch (mObj["tag"].toString()) {
                  case "1":
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()));
                    break;
                  case "2":
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WeightView()));
                    break;
                  case "3":
                    Scaffold.of(context).openDrawer();
                    break;
                  case "5":
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MealPlaView2()));
                  case "6":
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScheduleView()));
                  case "7":
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RunningView()));
                  case "8":
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExerciseView2()));
                  case "9":
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TipsView()));
                  case "10":
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingView()));
                  default:
                }
              },
            );
          }),
        ),
      ),
    );
  }
}
