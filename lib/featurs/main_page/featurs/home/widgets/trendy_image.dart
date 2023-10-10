import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendyImage extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String productName;
  final String percent;
  const TrendyImage({
    Key? key,
    required this.imageUrl,
    required this.price,
    required this.productName,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 38.w,
            height: 22.h,
            child: Container(
              width: 38.w,
              height: 22.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/1.png',
                      ))),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            productName,
            style: TextStyle(fontFamily: 'DM Sans', fontSize: 4.sp),
            overflow: TextOverflow.ellipsis,
          ),
          Text(price,
              style: TextStyle(
                  fontFamily: 'DM Sans', color: Colors.grey, fontSize: 6.sp)),
        ],
      ),
    );
  }
}
