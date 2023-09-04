import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer_pro/sizer.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30.w,
          height: 22.h,
          child: Container(
            width: 30.w,
            height: 22.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/man.png',
                    ))),
          ),
        ),
        Text(
          productName,
          style: GoogleFonts.dmSans(fontSize: 5.sp),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          price,
          style: GoogleFonts.dmSans(color: Colors.grey, fontSize: 6.sp),
        ),
      ],
    );
  }
}
