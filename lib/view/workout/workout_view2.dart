import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/BottomNavigation.dart';
import 'package:workout_fitness/view/workout/workout_detail_view.dart';

import '../../appbar/appbar2.dart';
import '../../data/list.dart';

class WorkOutView2 extends StatefulWidget {
  const WorkOutView2({super.key});
  @override
  State<WorkOutView2> createState() => _WorkOutView2State();
}

class _WorkOutView2State extends State<WorkOutView2> {
  int selctTab = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Work Out",
          color_txt: Colors.white,
          color: TColor.primary,
          colorBack: TColor.white,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: ListView.builder(
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
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.5)),
                      ),
                      Image.asset(
                        "assets/img/play.png",
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
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
                                      builder: (context) => WorkOutDetailView(
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
      bottomNavigationBar: const BottomAppBar(
        elevation: 1,
        child: BottomNavigation(),
      ),
    );
  }
}
