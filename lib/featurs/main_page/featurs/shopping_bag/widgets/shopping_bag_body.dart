import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubits/products_cubit/products_cubit.dart';
import 'custom_app_bar.dart';
import 'info_card.dart';

class ShoppingBagBody extends StatelessWidget {
  const ShoppingBagBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: const Divider(color: Color(0xFFC6C6C6)),
        ),
        SizedBox(height: 34.h),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SizedBox(
                //* I use this way because it is a Stack and
                //* with Stack can't use Expanded
                //* so I use SizedBox to fill the screen
                //*(screenSize - appBarSize)
                height: 852.h - 147.88616.h,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ...List.generate(
                        BlocProvider.of<ProductsCubit>(context).list.length,
                        (int index) => Padding(
                          padding: EdgeInsets.only(bottom: 28.h),
                          child: Dismissible(
                            onDismissed: (direction) {
                              BlocProvider.of<ProductsCubit>(context)
                                  .removeElement(index);
                            },
                            background: Container(
                              padding: EdgeInsets.only(left: 19.65.w),
                              alignment: Alignment.centerLeft,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
                            ),
                            secondaryBackground: Container(
                              // margin: EdgeInsets.only(left: 7.6335.w),
                              padding: EdgeInsets.only(right: 19.65.w),
                              alignment: Alignment.centerRight,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
                            ),
                            key: ValueKey<String>(
                                BlocProvider.of<ProductsCubit>(context)
                                    .list[index]
                                    .title),
                            child: BlocProvider.of<ProductsCubit>(context)
                                .list[index],
                          ),
                        ),
                      ),
                      SizedBox(height: 34.h),
                      const InfoCard(productPrice: 100, shipping: 10),
                      SizedBox(height: 270.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
