import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/check_out_cubit.dart';

class PaymentMethodCard extends StatelessWidget {
  final String title;
  const PaymentMethodCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        CheckOutCubit cubit = CheckOutCubit.get(context);
        return GestureDetector(
          onTap: () {
            cubit.changePayment(title);
          },
          child: Container(
            width: 100.w,
            height: 40.h,
            decoration: BoxDecoration(
                boxShadow: [
                  cubit.selectPayment == title
                      ? BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25))
                      : const BoxShadow(color: Color(0xFFF0EFEF))
                ],
                color: cubit.selectPayment == title
                    ? Colors.black
                    : const Color(0xFFF0EFEF),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'Tenor Sans',
                  fontSize: 16,
                  color: cubit.selectPayment == title
                      ? Colors.white
                      : Colors.black),
            )),
          ),
        );
      },
    );
  }
}
