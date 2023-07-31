import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:workout_fitness/data/notArr.dart';

import '../../appbar/appbar2.dart';
import '../../common/color_extension.dart';
import '../../common_widget/BottomNavigation.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  DateTime nowTime = DateTime.now();
  DateTime targetDate = DateTime.now();
  List dateArr = [
    DateTime(2023, 7, 2),
    DateTime(2023, 7, 14),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar2(
          title: "Schedule",
          color_txt: Colors.white,
          color: TColor.primary,
          colorBack: TColor.white,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.MMMM().format(targetDate).toUpperCase(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            DateFormat.y().format(targetDate),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          targetDate =
                              DateTime(targetDate.year, targetDate.month - 1);
                        });
                      },
                      icon: Image.asset(
                        "assets/img/black_fo.png",
                        width: 15,
                        height: 15,
                        color: TColor.secondaryText.withOpacity(0.7),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          targetDate =
                              DateTime(targetDate.year, targetDate.month + 1);
                        });
                      },
                      icon: Image.asset(
                        "assets/img/next_go.png",
                        width: 15,
                        height: 15,
                        color: TColor.secondaryText.withOpacity(0.7),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Stack(
                children: [
                  CalendarCarousel(
                    todayButtonColor: TColor.primary,
                    todayBorderColor: TColor.primary,
                    selectedDayButtonColor: TColor.primary,
                    selectedDayBorderColor: TColor.primary,
                    onDayPressed: (DateTime date, List events) {
                      // this.setState(() => nowTime = date);
                    },
                    onCalendarChanged: (date) {
                      setState(() {
                        targetDate = date;
                      });
                    },
                    selectedDayTextStyle: TextStyle(
                        color: TColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    daysTextStyle: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    weekDayFormat: WeekdayFormat.narrow,
                    weekdayTextStyle:
                        TextStyle(color: TColor.gray, fontSize: 20),
                    weekendTextStyle: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    thisMonthDayBorderColor: Colors.transparent,
                    showHeader: false,
                    customDayBuilder: (
                      bool isSelectable,
                      int index,
                      bool isSelectedDay,
                      bool isToday,
                      bool isPrevMonthDay,
                      TextStyle textStyle,
                      bool isNextMonthDay,
                      bool isThisMonthDay,
                      DateTime day,
                    ) {
                      var selectObj = dateArr.firstWhere(
                          (eDate) =>
                              day.day == eDate.day &&
                              day.month == eDate.month &&
                              day.year == eDate.year,
                          orElse: () => null);

                      if (selectObj != null) {
                        return Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            day.day.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        );
                      }
                    },
                    weekFormat: false,
                    height: 340.0,
                    selectedDateTime: nowTime,
                    targetDateTime: targetDate,
                    daysHaveCircularBorder: true,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 33),
                    child: Divider(
                      color: Colors.black26,
                      height: 1,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                "Note",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                shrinkWrap: true,
                itemCount: notArr.length,
                itemBuilder: (context, index) {
                  var iObj = notArr[index] as Map? ?? {};
                  return Container(
                    padding: const EdgeInsets.only(bottom: 15, left: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            iObj["day"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Text(
                          iObj["detail"],
                          style: TextStyle(
                              color: TColor.secondaryText, fontSize: 16),
                        ))
                      ],
                    ),
                  );
                })
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
