import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopCollectionImage extends StatelessWidget {
  const TopCollectionImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.w),
      height: 25.h,
      width: 100.w,
      child: Row(
        children: [
          Container(
              alignment: Alignment.bottomLeft,
              height: 45.w,
              width: 45.w,
              padding: EdgeInsets.only(left: 3.w, bottom: 3.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/1.png'))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Beach ',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          color: Colors.white,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 3),
                  Text('Collection',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          color: Colors.white,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.bold)),
                ],
              )),
          SizedBox(width: 3.w),
          Container(
              alignment: Alignment.bottomLeft,
              height: 45.w,
              width: 45.w,
              padding: EdgeInsets.only(left: 3.w, bottom: 3.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/1.png'))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Athletes ',
                    style: TextStyle(
                        fontFamily: 'DMSans-Regular',
                        color: Colors.white,
                        fontSize: 7.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Collection',
                    style: TextStyle(
                        fontFamily: 'DMSans-Regular',
                        color: Colors.white,
                        fontSize: 7.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
