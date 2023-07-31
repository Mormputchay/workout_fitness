import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/round_button.dart';
import 'package:workout_fitness/view/login/step1_view.dart';

import '../../data/pageArr.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.primary,
      body: Stack(
        children: [
          Image.asset(
            "assets/img/on_board_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: PageView.builder(
                controller: controller,
                itemCount: pageArr.length,
                itemBuilder: (context, index) {
                  var pObj = pageArr[index] as Map? ?? {};
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        pObj["title"].toString(),
                        style: TextStyle(
                            color: TColor.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.25,
                      ),
                      Image.asset(
                        pObj["image"].toString(),
                        width: media.width * 0.8,
                        height: media.width * 0.8,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: media.width * 0.12,
                      ),
                      Text(
                        pObj["subtitle"].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                }),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageArr.map((pObj) {
                    var index = pageArr.indexOf(pObj);
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: selectPage == index
                              ? TColor.white
                              : TColor.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(6)),
                    );
                  }).toList(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: RoundButton(
                    title: "Start",
                    type: RoundButtonType.primaryText,
                    onPressed: () {
                      if (selectPage >= 2) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Step1View(),
                            ));
                      } else {
                        //Next Screen
                        setState(() {
                          selectPage = selectPage + 1;
                          controller.animateToPage(selectPage,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.bounceInOut);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: media.width * 0.07,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
