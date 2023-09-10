import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer_pro/sizer.dart';

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
          width: 30.w,
          height: 22.h,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    imageUrl,
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
                width: 30.w,
                child: Text(
                  '$discount %',
                  style:
                      GoogleFonts.dmSans(fontSize: 10.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              '   $makerCompany',
              style: GoogleFonts.dmSans(
                  color: const Color(0xff393939),
                  fontSize: 6.sp,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '   $price .00 \$',
              style: GoogleFonts.dmSans(
                  color: const Color(0xffD57676), fontSize: 5.sp),
            ),
          ],
        ),
        Expanded(
          child: Text(
            '   $productName',
            style: GoogleFonts.dmSans(color: const Color(0xff828282)),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
