import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:workout_fitness/common_widget/PlanRow.dart';
import 'package:workout_fitness/view/menu/yoga_view.dart';

import '../common/color_extension.dart';

class Drawer_Navigation extends StatelessWidget {
  const Drawer_Navigation({
    super.key,
    required this.media,
    required this.planArr,
  });

  final Size media;
  final List planArr;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: media.width,
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Stack(
          children: [
            Container(
              width: media.width * 0.78,
              decoration: BoxDecoration(color: TColor.white),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: kTextTabBarHeight,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(22.5),
                              child: Image.asset(
                                "assets/img/u1.png",
                                width: 45,
                                height: 45,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Training Plan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: TColor.secondaryText,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                        color: Colors.black26,
                        height: 1,
                      ),
                      Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              itemCount: planArr.length,
                              itemBuilder: (context, index) {
                                var itemObj = planArr[index] as Map? ?? {};
                                return PlanRow(
                                  mObj: itemObj,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    if (index == 1) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const YogaView()));
                                    }
                                  },
                                );
                              })),
                      const Divider(
                        color: Colors.black26,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        height: kTextTabBarHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Switch Account',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: TColor.secondaryText,
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.asset(
                                "assets/img/next.png",
                                width: 15,
                                height: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: kToolbarHeight - 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Image.asset(
                            "assets/img/meun_close.png",
                            width: 20,
                            height: 20,
                          )),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
