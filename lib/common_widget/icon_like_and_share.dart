import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share/share.dart';
import 'package:workout_fitness/common/color_extension.dart';

class Icon_Like_And_Share extends StatefulWidget {
  @override
  State<Icon_Like_And_Share> createState() => _Icon_Like_And_ShareState();
}

class _Icon_Like_And_ShareState extends State<Icon_Like_And_Share> {
  bool clickLike = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          IgnorePointer(
            ignoring: true,
            child: RatingBar.builder(
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 25,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: TColor.primary,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                setState(() {
                  clickLike = !clickLike;
                });
              },
              icon: Image.asset(
                "assets/img/like.png",
                width: 20,
                height: 20,
                color: (clickLike == true) ? Colors.purpleAccent : Colors.grey,
              )),
          IconButton(
              onPressed: () {
                Share.share(
                    "https://www.uistore.design/items/cafit-workout-ui-kit/");
              },
              icon: Image.asset(
                "assets/img/share.png",
                width: 20,
                height: 20,
              ))
        ],
      ),
    );
  }
}
