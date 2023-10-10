import 'package:flutter/material.dart';
import 'package:shop_app/core/constant.dart';
import 'package:sizer_pro/sizer.dart';

import '../model/card_model.dart';

class BuildOrderCard extends StatelessWidget {
  final CardModel card;
  const BuildOrderCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 11),
                blurRadius: 24,
                color: Colors.black.withOpacity(.09))
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Order #${card.orderNumber}",
          style: TextStyle(
              fontFamily: "DM Sans",
              fontSize: 7.sp,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4)
              ]),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
              // flex: 6,
              child: Row(
                children: [
                  Text(
                    "Order date:",
                    style: TextStyle(
                        fontFamily: 'Tenor Sans',
                        color: const Color(0xFF828282),
                        fontSize: 5.8.sp),
                  ),
                  SizedBox(width: 0.5.w),
                  Text(
                    "${Constant.stringToDate(card.orderDate).day}/${Constant.stringToDate(card.orderDate).month}/${Constant.stringToDate(card.orderDate).year}",
                    style: TextStyle(color: Colors.black, fontSize: 4.3.sp),
                  ),
                ],
              ),
            ),
            SizedBox(width: 1.w),
            Expanded(
              // flex: 4,
              child: Row(
                children: [
                  Text(
                    "due date",
                    style: TextStyle(
                        fontFamily: 'Tenor Sans',
                        color: const Color(0xFF828282),
                        fontSize: 6.sp),
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    "${Constant.stringToDate(card.dueDate).day}/${Constant.stringToDate(card.dueDate).month}/${Constant.stringToDate(card.dueDate).year}",
                    style: TextStyle(color: Colors.black, fontSize: 4.5.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // flex: 6,
              child: Row(
                children: [
                  Text(
                    "Quantity:",
                    style: TextStyle(
                        fontSize: 6.sp,
                        fontFamily: 'Tenor Sans',
                        color: const Color(0xFF828282)),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    "${card.quantity}",
                    style: TextStyle(
                        fontFamily: 'Tenor Sans',
                        color: Colors.black,
                        fontSize: 5.sp),
                  ),
                ],
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(
              // flex: 4,
              child: Row(
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                        fontSize: 6.sp,
                        fontFamily: 'Tenor Sans',
                        color: const Color(0xFF828282)),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    "${card.subtotal}\$",
                    style: TextStyle(
                        fontSize: 6.sp,
                        fontFamily: 'Tenor Sans',
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Text(
              "Tracking number:",
              style: TextStyle(
                  fontSize: 6.sp,
                  fontFamily: 'Tenor Sans',
                  color: const Color(0xFF828282)),
            ),
            SizedBox(width: 2.w),
            Text(
              card.trackingNumber,
              style: TextStyle(
                  fontSize: 6.sp,
                  fontFamily: 'Tenor Sans',
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              card.isDelevered ? 'Delevered' : 'Pending',
              style: TextStyle(
                  fontFamily: 'Tenor Sans',
                  color: card.isDelevered
                      ? const Color(0xFFD57676)
                      : const Color(0xFF76D5AD),
                  fontSize: 8.sp),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(.25))
                  ],
                  border: Border.all(color: const Color(0xFF434343))),
              child: Text(
                "Details",
                style: TextStyle(fontFamily: 'Tenor Sans', fontSize: 6.sp),
              ),
            )
          ],
        )
      ]),
    );
  }
}
