import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathertask/config/theme_colors.dart';

import 'custom_text.dart';

class RatingBarWidget extends StatelessWidget {
  final double rate, iconSize, fontSize;
  final bool center, rateText;
  final bool ratingClick;
  final int itemCount;
  final bool checkReverse;
  final Function(dynamic)? onRating;

  const RatingBarWidget({
    this.rate = 3.0,
    this.iconSize = 14.5,
    this.fontSize = 10,
    this.center = false,
    this.rateText = true,
    this.ratingClick = false,
    this.onRating,
    this.itemCount = 5,
    this.checkReverse = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return checkReverse ? Row(
      mainAxisAlignment:
      center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        if (rateText)
          CustomText(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            text: "$rate",
            color: TColor.rating,
            fontSize: fontSize,
            fontW: FontWeight.w700,
          )
        else
          const SizedBox(),
        RatingBar.builder(
          tapOnlyMode: true,
          ignoreGestures: ratingClick,
          initialRating: rate,
          minRating: 1,
          unratedColor: const Color(0xffCACACA),
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: itemCount,
          itemSize: ScreenUtil().setSp(iconSize),
          itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: TColor.rating,
          ),
          onRatingUpdate: onRating!,
          // onRatingUpdate: onRating!,
        ),
      ],
    ) : Row(
      mainAxisAlignment:
          center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        RatingBar.builder(
          tapOnlyMode: true,
          ignoreGestures: ratingClick,
          initialRating: rate,
          minRating: 1,
          unratedColor: const Color(0xffCACACA),
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: itemCount,
          itemSize: ScreenUtil().setSp(iconSize),
          itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: TColor.color41,
          ),
          onRatingUpdate: onRating!,
          // onRatingUpdate: onRating!,
        ),
        if (rateText)
          CustomText(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            text: "$rate",
            color: TColor.text,
            fontSize: fontSize,
            fontW: FontWeight.w500,
          )
        else
          const SizedBox(),
      ],
    );
  }
}
