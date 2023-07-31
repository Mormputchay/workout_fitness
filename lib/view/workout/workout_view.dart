import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/BottomNavigation.dart';
import 'package:workout_fitness/common_widget/round_button.dart';
import 'package:workout_fitness/view/workout/workout_detail_view.dart';

import '../../appbar/appbar2.dart';
import '../../data/list.dart';

class WorkOutView extends StatefulWidget {
  const WorkOutView({super.key});
  @override
  State<WorkOutView> createState() => _WorkOutViewState();
}

class _WorkOutViewState extends State<WorkOutView> {
  int selctTab = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Work Out",
          color_txt: Colors.black,
          color: TColor.white,
          colorBack: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: workArr1.length,
            itemBuilder: (context, index) {
              var wObj = workArr1[index] as Map? ?? {};
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
                          vertical: 25, horizontal: 20),
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
                                                  const WorkOutDetailView()));
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
      bottomNavigationBar: const BottomAppBar(
        elevation: 1,
        child: BottomNavigation(),
      ),
    );
  }
}
