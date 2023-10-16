import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisCountImage extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String productName;
  final String discount;
  final String makerCompany;
  const DisCountImage({
    Key? key,
    required this.makerCompany,
    required this.imageUrl,
    required this.price,
    required this.productName,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 38.w,
          height: 22.h,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    imageUrl.split('|')[0],
                  ))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                height: 4.h,
                width: 38.w,
                child: Text(
                  '$discount %',
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 7.sp,
                      color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              ' $makerCompany',
              style: TextStyle(
                  fontFamily: 'DM Sans',
                  color: const Color(0xff393939),
                  fontSize: 5.sp,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '$price\$',
              style: TextStyle(
                  fontFamily: 'DM Sans',
                  color: const Color(0xffD57676),
                  fontSize: 5.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Text(
          ' $productName',
          style: TextStyle(
              fontFamily: 'DM Sans',
              color: const Color(0xff828282),
              fontSize: 4.sp),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
