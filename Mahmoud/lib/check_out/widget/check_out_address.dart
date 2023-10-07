import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanadprojecttest/check_out/cubit/check_out_cubit.dart';
import 'package:sizer_pro/sizer.dart';

class CheckOutAddressCard extends StatelessWidget {
  final String title;
  final String description;
  const CheckOutAddressCard(
      {super.key, required this.title, required this.description});

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
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Radio(
                      activeColor: Colors.black,
                      value: title,
                      groupValue: cubit.selectAddress,
                      onChanged: (value) {
                        cubit.changeAddress(value!);
                      }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DM Sans'),
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          color: Color(0xFF828282),
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
