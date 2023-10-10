import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubits/item_product_cubit/item_product_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.title,
    required this.brand,
    required this.color,
    required this.size,
    required this.price,
    required this.amountOfProduct,
  });
  final String title;
  final String brand;
  final Color color;
  final String size;
  final double price;
  final int amountOfProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 7.6335.w),
      width: 393.w, //- 2 * 7.6335.w,

      height: 117.h,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE3E3E3),
            offset: Offset(1, 3),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Image(
            image: const AssetImage('assets/images/elegance.png'),
            fit: BoxFit.cover,
            width: 81.w,
            height: 852.h,
          ),
          SizedBox(width: 20.w),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 1.06,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                Text(
                  'Brand: $brand',
                  style: TextStyle(
                    color: const Color(0xFF9B9B9B),
                    fontSize: 12.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.06,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(text: 'Color:  '),
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 3.5.h),
                          width: 10.w,
                          height: 10.w,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.w / 2)),
                          ),
                        ),
                      ),
                      //* I know this is a failed solution, but it's esay to do  ^_^ :)
                      TextSpan(
                        text: '  |',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      TextSpan(text: '  Size:  $size'),
                    ],
                  ),
                  style: TextStyle(
                    color: const Color(0xFF9B9B9B),
                    fontSize: 12.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.06,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 40.w),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$price\$',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 1.06,
                    letterSpacing: 1,
                  ),
                ),
                BlocProvider(
                  create: (context) => ItemProductCubit(),
                  child: BlocBuilder<ItemProductCubit, ItemProductState>(
                    builder: (context, state) {
                      log('product');
                      ItemProductCubit cubit =
                          BlocProvider.of<ItemProductCubit>(context);
                      return Container(
                        width: 57.w,
                        height: 25.5.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: cubit.removeAmount,
                              child: Icon(Icons.remove, size: 14.sp),
                            ),
                            Text(
                              cubit.amountOfProduct.toString(),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            InkWell(
                              onTap: cubit.addAmount,
                              child: Icon(Icons.add, size: 14.sp),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
