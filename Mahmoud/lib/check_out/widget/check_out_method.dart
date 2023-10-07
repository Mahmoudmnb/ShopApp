import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanadprojecttest/check_out/cubit/check_out_cubit.dart';
import 'package:sizer_pro/sizer.dart';

class CheckOutMethodCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  const CheckOutMethodCard(
      {super.key,
      required this.title,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        CheckOutCubit cubit = CheckOutCubit.get(context);
        return Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(0, 11),
                blurRadius: 11,
                color: Colors.black.withOpacity(0.04))
          ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: MaterialButton(
            padding:
                EdgeInsets.only(left: 2.w, top: 1.h, right: 4.w, bottom: 2.h),
            onPressed: () {
              cubit.changeAddress(title);
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Radio(
                          activeColor: Colors.black,
                          value: title,
                          groupValue: cubit.selectMethod,
                          onChanged: (value) {
                            cubit.changeMethod(value!);
                          }),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DM Sans'),
                    ),
                    Spacer(),
                    Container(
                      // padding: EdgeInsets.only(bottom: 1.h),
                      child: Text(
                        price,
                        style: TextStyle(
                            fontSize: 6.sp,
                            fontFamily: 'Tenor Sans',
                            color: const Color(0xFFD57676)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 14.w,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                          fontSize: 5.sp,
                          color: const Color(0xFF828282),
                          fontFamily: 'Tenor Sans'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
