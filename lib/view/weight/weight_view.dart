import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:workout_fitness/appbar/appbar2.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/BottomNavigation.dart';
import 'package:workout_fitness/common_widget/border_button.dart';
import 'package:workout_fitness/common_widget/text_Loreip.dart';

import '../../data/myWeightArr.dart';

class WeightView extends StatefulWidget {
  const WeightView({super.key});
  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  final controller = CarouselController();
  int activeIndex = 0;
  bool clickLike = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Check you process",
          color_txt: Colors.white,
          color: TColor.primary,
          colorBack: TColor.white,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: BorderButton(
                      title: "Check Process",
                      type: BorderButtonType.inactive,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: BorderButton(
                      title: "My Weight",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                "Add more photo to control your process",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.secondaryText, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                width: media.width,
                height: media.width * 0.9,
                child: CarouselSlider.builder(
                  carouselController: controller,
                  options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 0.5,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.65,
                      enlargeFactor: 0.4,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                  itemCount: myWeightArr.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int index) {
                    var dObj = myWeightArr[index] as Map? ?? {};
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2)),
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(dObj["image"].toString(),
                            width: double.maxFinite,
                            height: double.maxFinite,
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: previous,
                      icon: Image.asset(
                        "assets/img/black_fo.png",
                        width: 20,
                        height: 20,
                      )),
                  Expanded(
                    child: Text(
                      "Sunday, AUG 26",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: TColor.secondaryText,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  IconButton(
                      onPressed: next,
                      icon: Image.asset(
                        "assets/img/next_go.png",
                        width: 20,
                        height: 20,
                      )),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              width: 160,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: TColor.gray.withOpacity(0.5), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "74 kg",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Text_Loreip()
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 1,
        child: BottomNavigation(),
      ),
    );
  }

  void previous() =>
      controller.previousPage(duration: const Duration(milliseconds: 500));

  void next() =>
      controller.nextPage(duration: const Duration(milliseconds: 500));
}
