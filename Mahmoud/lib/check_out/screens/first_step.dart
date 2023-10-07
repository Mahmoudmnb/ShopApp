import 'package:flutter/material.dart';
import 'package:sanadprojecttest/check_out/screens/second_step.dart';
import 'package:sanadprojecttest/check_out/widget/check_out_address.dart';
import 'package:sanadprojecttest/check_out/widget/check_out_method.dart';
import 'package:sanadprojecttest/check_out/widget/code_textfild.dart';
import 'package:sanadprojecttest/check_out/widget/point.dart';
import 'package:sanadprojecttest/profile/model/shopping_address_model.dart';
import 'package:sizer_pro/sizer.dart';

class CheckOutScreen1 extends StatelessWidget {
  const CheckOutScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    List addressInfo = [
      shoppingAddressModel(
          title: 'My Home', description: " 123 Building, Main Street"),
      shoppingAddressModel(
          title: 'My Office', description: " 123 Building, Main Street"),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    height: 3.h,
                    image: const AssetImage('assets/images/greycard.png')),
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
                    image:
                        const AssetImage('assets/images/grey_check_out.png')),
                const Spacer(),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 2.h),
              width: double.infinity,
              child: Text(
                "Shopping Address",
                style: TextStyle(
                    color: const Color(0xFF939393),
                    fontSize: 10.sp,
                    fontFamily: 'DM Sans'),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                height: 2.h,
              ),
              itemCount: addressInfo.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckOutAddressCard(
                    title: addressInfo[index].title,
                    description: addressInfo[index].description);
              },
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 2.h),
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 11),
                      blurRadius: 11,
                      color: Colors.black.withOpacity(0.04))
                ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  " +  Add Another Address",
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.h),
              width: double.infinity,
              child: Text(
                "Shopping Method",
                style: TextStyle(
                    color: const Color(0xFF939393),
                    fontSize: 10.sp,
                    fontFamily: 'DM Sans'),
              ),
            ),
            const CheckOutMethodCard(
                price: 'Free ',
                title: "In store pick-up",
                description: "Up until 30 days after placing order"),
            SizedBox(height: 2.h),
            const CheckOutMethodCard(
                price: '\$4.99',
                title: "Standard delivery",
                description: "Delivery by Mon, April 5th"),
            SizedBox(height: 2.h),
            const CheckOutMethodCard(
                price: '\$9.99',
                title: "Express delivery",
                description: "Same-day delivery"),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.h),
              width: double.infinity,
              child: Text(
                "Coupon Code",
                style: TextStyle(
                    color: const Color(0xFF939393),
                    fontSize: 10.sp,
                    fontFamily: 'DM Sans'),
              ),
            ),
            CodeTextFeild(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CheckOutScreen2(),
                ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 3.h),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 1.6.h),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Continue to payment",
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
      ),
    );
  }
}
