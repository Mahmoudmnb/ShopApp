import 'package:flutter/material.dart';
import 'package:sanadprojecttest/Elegance/orders/model/card_model.dart';
import 'package:sizer_pro/sizer.dart';

class BuildOrderCard extends StatelessWidget {
  final CardModel card;
  const BuildOrderCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
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
          "Order #${card.numb}",
          style: TextStyle(
              fontFamily: "DM Sans",
              fontSize: 8.sp,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4)
              ]),
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            Expanded(
              // flex: 6,
              child: Row(
                children: [
                  Text(
                    "Order date",
                    style: TextStyle(
                        fontFamily: 'Tenor Sans',
                        color: Color(0xFF828282),
                        fontSize: 5.5.sp),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "${card.orderDate.day}/${card.orderDate.month}/${card.orderDate.year}",
                    style: TextStyle(color: Colors.black, fontSize: 5.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              // flex: 4,
              child: Row(
                children: [
                  Text(
                    "due date",
                    style: TextStyle(
                        fontFamily: 'Tenor Sans',
                        color: const Color(0xFF828282),
                        fontSize: 5.5.sp),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "${card.dueDate.day}/${card.dueDate.month}/${card.dueDate.year}",
                    style: TextStyle(color: Colors.black, fontSize: 5.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // flex: 6,
              child: Row(
                children: [
                  const Text(
                    "Quantity:",
                    style: TextStyle(
                        fontFamily: 'Tenor Sans', color: Color(0xFF828282)),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "${card.Quantity}",
                    style: const TextStyle(
                        fontFamily: 'Tenor Sans', color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              // flex: 4,
              child: Row(
                children: [
                  const Text(
                    "Subtotal",
                    style: TextStyle(
                        fontFamily: 'Tenor Sans', color: Color(0xFF828282)),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "${card.Subtotal}\$",
                    style: const TextStyle(
                        fontFamily: 'Tenor Sans', color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            const Text(
              "Tracking number:",
              style:
                  TextStyle(fontFamily: 'Tenor Sans', color: Color(0xFF828282)),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              card.TrackingNumber,
              style: const TextStyle(
                  fontFamily: 'Tenor Sans', color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              card.KingOfOrder,
              style: TextStyle(
                  fontFamily: 'Tenor Sans',
                  color: card.KingOfOrder == "Pending"
                      ?const Color(0xFFD57676)
                      :const Color(0xFF76D5AD),
                  fontSize: 8.sp),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(.25))
                  ],
                  border: Border.all(color: const Color(0xFF434343))),
              child: const Text(
                "Details",
                style: TextStyle(
                  fontFamily: 'Tenor Sans',
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
