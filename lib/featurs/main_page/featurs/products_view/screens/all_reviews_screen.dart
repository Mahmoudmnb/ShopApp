import 'package:flutter/material.dart';
import 'package:shop_app/core/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/review_model.dart';
import '../widgets/product_view_widgets.dart';

class AllReviewsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> reviews;
  const AllReviewsScreen({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Row(
                children: [
                  CustomIconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'All Reviews',
                    style: TextStyle(
                      color: const Color(0xFF171717),
                      fontSize: 9.sp,
                      fontFamily: 'Tenor Sans',
                      fontWeight: FontWeight.w600,
                      height: 1.06,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 75.0),
              child: Text(
                '${reviews.length} Review',
                style: TextStyle(
                  color: const Color(0xFF979797),
                  fontSize: 7.sp,
                  fontFamily: 'Tenor Sans',
                  fontWeight: FontWeight.w400,
                  height: 1.06,
                  letterSpacing: 1,
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  ReviewModel review = ReviewModel.fromMap(reviews[index]);
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 10, bottom: 15),
                    child: CustomListTile(
                      //* this width (100% - 120) becasue this card has a custom padding :)
                      //* (bannan don't kill me please ^_^)
                      width: 75.w,
                      username: review.userName,
                      date: getOffsetDate(review.date),
                      description: review.description,
                      stars: review.stars,
                      imgUrl: review.userImage,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  String getOffsetDate(String date) {
    DateTime dateTime = Constant.stringToDate(date);
    DateTime currentDatetime = DateTime.now();
    if (dateTime.year != currentDatetime.year) {
      return '${currentDatetime.year - dateTime.year} year ago';
    } else if (dateTime.month != currentDatetime.month) {
      return '${currentDatetime.month - dateTime.month} month ago';
    } else if (dateTime.day != currentDatetime.day) {
      return '${currentDatetime.day - dateTime.day} days ago';
    } else if (dateTime.hour != currentDatetime.hour) {
      return '${currentDatetime.hour - dateTime.hour} hours ago';
    } else {
      return '${currentDatetime.minute - dateTime.minute} minute ago';
    }
  }
}
