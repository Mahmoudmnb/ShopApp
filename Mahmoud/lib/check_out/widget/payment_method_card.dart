import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanadprojecttest/check_out/cubit/check_out_cubit.dart';
import 'package:sizer_pro/sizer.dart';

class PaymentMethodCard extends StatelessWidget {
  final String title;
  const PaymentMethodCard({super.key, required this.title});

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
                EdgeInsets.only(left: 2.w, top: 1.h, right: 4.w, bottom: 1.h),
            onPressed: () {
              cubit.changeAddress(title);
            },
            child: Row(
              children: [
                Radio(
                    activeColor: Colors.black,
                    value: title,
                    groupValue: cubit.selectPayment,
                    onChanged: (value) {
                      cubit.changePayment(value!);
                    }),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DM Sans'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
