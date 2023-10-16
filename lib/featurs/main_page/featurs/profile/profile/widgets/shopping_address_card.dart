import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/profile_cubit.dart';

class ShoppingAddressCard extends StatelessWidget {
  final String title;
  final String description;
  const ShoppingAddressCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                  GestureDetector(
                    onTap: () {
                      log("edit the $title");
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2),
                      margin: EdgeInsets.only(right: 2.w, top: 2.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xFFD57676))),
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            fontSize: 3.sp,
                            fontFamily: 'Tenor Sans',
                            color: const Color(0xFFD57676)),
                      ),
                    ),
                  )
                ]),
          ),
        );
      },
    );
  }
}
