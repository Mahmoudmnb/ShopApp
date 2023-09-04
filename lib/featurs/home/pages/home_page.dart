import 'package:flutter/material.dart';
import 'package:shop_app/featurs/home/widgets/collections_spacer.dart';
import 'package:shop_app/featurs/home/widgets/recommended_image.dart';
import 'package:shop_app/featurs/home/widgets/top_collection_image.dart';
import 'package:shop_app/featurs/home/widgets/trendy_image.dart';
import 'package:sizer_pro/sizer.dart';

import '../widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 22.h,
          width: 100.w,
          margin: EdgeInsets.all(3.w),
          child: Image.asset(
            'assets/images/Capture.PNG',
            fit: BoxFit.fill,
            width: 80.w,
            height: 20.h,
          ),
        ),
        CollectionsSpacer(onTap: () {}, collectoinTitle: 'Discount'),
        Container(
          padding: EdgeInsets.only(left: 3.w, top: 1.h),
          width: 100.w,
          height: 28.h,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            const DisCountImage(
                imageUrl: 'assets/images/man.png',
                percent: '50 %',
                price: '17 \$',
                productName: 'Wite contton Shirt'),
            SizedBox(width: 2.w),
            const DisCountImage(
                imageUrl: 'assets/images/man.png',
                percent: '50 %',
                price: '17 \$',
                productName: 'Stripped contton Shirt'),
            SizedBox(width: 2.w),
            const DisCountImage(
                imageUrl: 'assets/images/man.png',
                percent: '50 %',
                price: '17 \$',
                productName: 'Grey contton Shirt'),
          ]),
        ),
        CollectionsSpacer(onTap: () {}, collectoinTitle: 'Trendy'),
        Container(
          padding: EdgeInsets.only(left: 3.w, top: 1.h),
          width: 100.w,
          height: 28.h,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            const TrendyImage(
                imageUrl: 'assets/images/man.png',
                percent: '50 %',
                price: '17 \$',
                productName: 'Wite contton Shirt'),
            SizedBox(width: 2.w),
            const TrendyImage(
                imageUrl: 'assets/images/man.png',
                percent: '50 %',
                price: '17 \$',
                productName: 'Stripped contton Shirt'),
            SizedBox(width: 2.w),
            const TrendyImage(
                imageUrl: 'assets/images/man.png',
                percent: '50 %',
                price: '17 \$',
                productName: 'Grey contton Shirt'),
          ]),
        ),
        CollectionsSpacer(onTap: () {}, collectoinTitle: 'Recommended'),
        SizedBox(
          width: 100.w,
          height: 12.h,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const RecommendedImage(
              imageUrl: 'assets/images/man.png',
              productPrice: '10 \$',
              productNamge: 'Coffee polo shirt',
            ),
          ),
        ),
        CollectionsSpacer(onTap: () {}, collectoinTitle: 'Top Collection'),
        TopCollectionImage(),
        SizedBox(
          height: 7.h,
        ),
      ],
    );
  }
}
