import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanadprojecttest/check_out/cubit/check_out_cubit.dart';
import 'package:sanadprojecttest/check_out/screens/third_step.dart';
import 'package:sanadprojecttest/check_out/widget/calculate_card.dart';
import 'package:sanadprojecttest/check_out/widget/payment_method_card.dart';
import 'package:sanadprojecttest/check_out/widget/point.dart';
import 'package:sizer_pro/sizer.dart';

class CheckOutScreen2 extends StatelessWidget {
  const CheckOutScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> Payment = ['Credit Card', 'Paypal', 'Visa', 'Google play'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                      style:
                          TextStyle(fontSize: 10.sp, fontFamily: 'Tenor Sans'),
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
                        image: const AssetImage(
                            'assets/images/grey_check_out.png')),
                    const Spacer(),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 2.h),
                  width: double.infinity,
                  child: Text(
                    "Payment",
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
                  itemCount: Payment.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PaymentMethodCard(
                      title: Payment[index],
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 2.w, top: 2.h, right: 4.w, bottom: 2.h),
                  margin: EdgeInsets.symmetric(vertical: 2.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 11),
                            blurRadius: 11,
                            color: Colors.black.withOpacity(0.04))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "   +  Add Card",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DM Sans'),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 1.h,
            ),
            CalculateCard(),
            SizedBox(
              height: 2.h,
            ),
            BlocConsumer<CheckOutCubit, CheckOutState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                CheckOutCubit cubit = CheckOutCubit.get(context);
                return Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Checkbox(
                        activeColor: Color(0xFF5ECE7B),
                        value: cubit.agree,
                        onChanged: (value) {
                          cubit.changeAgree(value!);
                        }),
                    const Text("I agree to"),
                    GestureDetector(
                      child: Container(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide())),
                          child: const Text("Terms and conditions")),
                    )
                  ],
                );
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CheckOutScreen3(),
                ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 1.6.h,
                ),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Place Order",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 8.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
