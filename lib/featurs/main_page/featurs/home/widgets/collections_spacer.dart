import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionsSpacer extends StatelessWidget {
  final String collectoinTitle;
  final Function() onTap;
  const CollectionsSpacer({
    super.key,
    required this.onTap,
    required this.collectoinTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Row(
        children: [
          Text(collectoinTitle,
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 8.sp,
                color: const Color(0xff6D6D6D),
              )),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text('See All',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 7.sp,
                      color: const Color(0xff6D6D6D),
                    )),
                const SizedBox(width: 5),
                const Icon(
                  Icons.arrow_forward,
                  color: Color(0xff6D6D6D),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
