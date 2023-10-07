import 'package:flutter/material.dart';
import 'package:sanadprojecttest/check_out/screens/first_step.dart';
import 'package:sizer_pro/sizer.dart';

import '../widget/point.dart';

class CheckOutScreen3 extends StatelessWidget {
  const CheckOutScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.h),
        child: Column(children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image(
                    height: 11.w,
                    width: 11.w,
                    image: const AssetImage("assets/images/backicon.png"),
                  )),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "Check out",
                style: TextStyle(fontSize: 10.sp, fontFamily: 'Tenor Sans'),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              const Spacer(),
              Image(
                  height: 3.h,
                  image: const AssetImage('assets/images/location.png')),
              SizedBox(
                width: 2.w,
              ),
              const Point(),
              const Point(),
              const Point(),
              const Point(),
              const Point(),
              SizedBox(
                width: 2.w,
              ),
              Image(
                  height: 2.h,
                  image: const AssetImage('assets/images/card.png')),
              SizedBox(
                width: 2.w,
              ),
              const Point(),
              const Point(),
              const Point(),
              const Point(),
              const Point(),
              SizedBox(
                width: 2.w,
              ),
              Image(
                  height: 3.h,
                  image: const AssetImage('assets/images/check_out.png')),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Order Completed",
            style: TextStyle(
                fontFamily: "DM Sans",
                fontWeight: FontWeight.w600,
                fontSize: 10.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          Image(
              height: 15.h,
              image: AssetImage('assets/images/check-circle.png')),
          SizedBox(
            height: 10.h,
          ),
          const Text(
            "Thank you for your purchase.",
            style: TextStyle(fontFamily: 'DM Sans', color: Color(0xFF3D3D3D)),
          ),
          const Text(
            "You can veiw your order in 'My Orders' section",
            style: TextStyle(fontFamily: 'DM Sans', color: Color(0xFF3D3D3D)),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => CheckOutScreen1(),
                  ),
                  (route) => false);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 1.6.h,
              ),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Continue Shopping",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 8.sp),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
