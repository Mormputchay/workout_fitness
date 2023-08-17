import 'package:flutter/material.dart';
import 'package:workout_fitness/appbar/appbar3.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/common_widget/BottomNavigation.dart';
import 'package:workout_fitness/common_widget/response_row.dart';

import '../../common_widget/icon_like_and_share.dart';
import '../../data/responseArr.dart';
import '../../data/workArr.dart';

class WorkOutDetailView extends StatefulWidget {
  final Map eObj;
  const WorkOutDetailView({super.key, required this.eObj});
  @override
  State<WorkOutDetailView> createState() => _WorkOutDetailViewState();
}

class _WorkOutDetailViewState extends State<WorkOutDetailView> {
  bool clickLike = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar3(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.eObj["image"].toString(),
              width: media.width,
              height: media.width * 0.55,
              fit: BoxFit.cover,
            ),
            Icon_Like_And_Share(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Recommended",
                style: TextStyle(
                    fontSize: 18,
                    color: TColor.secondaryText,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: media.width * 0.26,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: workArr.length,
                  itemBuilder: (context, index) {
                    var wObj = workArr[index] as Map? ?? {};
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      width: media.width * 0.28,
                      decoration: BoxDecoration(color: TColor.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                wObj["image"].toString(),
                                width: media.width,
                                height: media.width * 0.15,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: media.width,
                                height: media.width * 0.15,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  wObj["name"],
                                  style: TextStyle(
                                      color: TColor.secondaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Text(
                "17 Responses",
                style: TextStyle(
                    fontSize: 18,
                    color: TColor.secondaryText,
                    fontWeight: FontWeight.w700),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              shrinkWrap: true,
              itemCount: responseArr.length,
              itemBuilder: ((context, index) {
                var rObj = responseArr[index] as Map? ?? {};
                return ResponsesRow(
                  rObj: rObj,
                );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 1,
        child: BottomNavigation(),
      ),
    );
  }
}
