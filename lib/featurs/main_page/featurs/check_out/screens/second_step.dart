import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/featurs/main_page/featurs/check_out/widget/add_card.dart';

import '../cubit/check_out_cubit.dart';
import '../widget/calculate_card.dart';
import '../widget/payment_method_card.dart';
import '../widget/point.dart';
import 'third_step.dart';

class CheckOutScreen2 extends StatelessWidget {
  const CheckOutScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> payment = ['Card', 'Paypal', 'Pay'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 60.h),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image(
                      height: 40.w,
                      width: 40.w,
                      image: const AssetImage("assets/images/backicon.png"),
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Check out",
                  style: TextStyle(fontSize: 18.sp, fontFamily: 'Tenor Sans'),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Image(
                              height: 24.h,
                              image: const AssetImage(
                                  'assets/images/location.png')),
                          SizedBox(
                            width: 10.w,
                          ),
                          const CheckOutPoint(),
                          const CheckOutPoint(),
                          const CheckOutPoint(),
                          const CheckOutPoint(),
                          const CheckOutPoint(),
                          SizedBox(
                            width: 10.w,
                          ),
                          Image(
                              height: 18.h,
                              image:
                                  const AssetImage('assets/images/card.png')),
                          SizedBox(
                            width: 10.w,
                          ),
                          const CheckOutPoint(),
                          const CheckOutPoint(),
                          const CheckOutPoint(),
                          const CheckOutPoint(),
                          const CheckOutPoint(),
                          SizedBox(
                            width: 10.w,
                          ),
                          Image(
                              height: 25.h,
                              image: const AssetImage(
                                  'assets/images/grey_check_out.png')),
                          const Spacer(),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25.h),
                        width: double.infinity,
                        child: Text(
                          "Payment",
                          style: TextStyle(
                              color: const Color(0xFF939393),
                              fontSize: 22.sp,
                              fontFamily: 'DM Sans'),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PaymentMethodCard(
                            title: payment[0],
                          ),
                          PaymentMethodCard(
                            title: payment[1],
                          ),
                          PaymentMethodCard(
                            title: payment[2],
                          )
                        ],
                      ),
                      const AddCardForPayming(),
                    ]),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  const CalculateCard(),
                  SizedBox(
                    height: 15.h,
                  ),
                  BlocConsumer<CheckOutCubit, CheckOutState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      CheckOutCubit cubit = CheckOutCubit.get(context);
                      return Row(
                        children: [
                          SizedBox(
                            width: 50.w,
                          ),
                          Checkbox(
                              activeColor: const Color(0xFF5ECE7B),
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
                        builder: (context) => const CheckOutScreen3(),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 24.h, horizontal: 25.w),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 13.h,
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
                            fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
