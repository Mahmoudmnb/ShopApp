import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedImage extends StatelessWidget {
  final String productNamge;
  final String productPrice;
  final String imageUrl;
  const RecommendedImage(
      {super.key,
      required this.imageUrl,
      required this.productNamge,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color(0xffF1F1F1),
          borderRadius: BorderRadius.circular(15)),
      height: 30,
      width: 70.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              height: 12.h,
              width: 12.h,
            ),
          ),
          const SizedBox(width: 4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productNamge,
                  style: TextStyle(fontFamily: 'DM Sans', fontSize: 5.sp)),
              Text(productPrice,
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 5.sp,
                      color: Colors.grey))
            ],
          )
        ],
      ),
    );
  }
}
