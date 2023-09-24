import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../home/models/product_model.dart';
import '../../../search/cubit/sreach_cubit.dart';
import '../../cubits/product_screen/cubit.dart';
import '../../screens/product_view_secreens.dart';
import '../product_view_widgets.dart';

class SimilarProductsCard extends StatelessWidget {
  final ProductModel product;
  final String searchWord;
  final SearchCubit searchCubit;
  final ProductCubit cubit;
  const SimilarProductsCard(
      {super.key,
      required this.cubit,
      required this.product,
      required this.searchCubit,
      required this.searchWord});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: const Color(0xFFFAFAFA),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Text(
                  'Similar Items',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 7.sp,
                    fontFamily: 'Tenor Sans',
                    fontWeight: FontWeight.w600,
                    height: 1.06,
                    letterSpacing: 0.20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF9B9B9B),
                  ),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 6.sp,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.05,
                    ),
                  ),
                  onPressed: () {
                    cubit.getSimilarProducts(product);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => SimilarItemsScreen(
                          searchCubit: searchCubit,
                          product: product,
                          searchWord: searchWord,
                          similarProducts: cubit.similarProducts,
                          productCubit: cubit,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              SizedBox(
                width: 100.w,
                height: 30.h,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  shrinkWrap: true,
                  itemCount: cubit.similarProducts.length < 6
                      ? cubit.similarProducts.length
                      : 6,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 10),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, int index) {
                    ProductModel product =
                        ProductModel.fromMap(cubit.similarProducts[index]);
                    return CustomCard(
                      width: 33.w,
                      height: 27.h,
                      product: product,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
