import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../home/models/product_model.dart';
import '../../../search/cubit/sreach_cubit.dart';
import '../../cubits/product_screen/cubit.dart';
import '../product_view_widgets.dart';

class ProductDetails extends StatelessWidget {
  final ProductCubit cubit;
  final ProductModel product;
  final Function(List<Map<String, dynamic>>) getAvrOfStars;
  final double avrOfStars;
  final List<String> sizes;
  final List<Color> colors;
  final List<Map<String, dynamic>> similarProducts;
  final String searchWord;
  final String categoryName;
  final SearchCubit searchCubit;
  final String fromPage;

  const ProductDetails(
      {super.key,
      required this.fromPage,
      required this.cubit,
      required this.product,
      required this.getAvrOfStars,
      required this.colors,
      required this.sizes,
      required this.avrOfStars,
      required this.similarProducts,
      required this.searchCubit,
      required this.searchWord,
      required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      initialChildSize: 0.49,
      minChildSize: 0.49,
      builder: (context, scrollController) => SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        child: Container(
          width: 100.w,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.w, right: 1.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 3.h),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFFDFDFDF),
                            ),
                            width: 30.w,
                            height: 0.6.h,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: .5,
                                    fontFamily: 'Tenor Sans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 6.5.sp,
                                  ),
                                ),
                                SizedBox(width: 1.w),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 3.0, bottom: 1),
                                          child: Icon(
                                            Icons.star,
                                            size: 6.sp,
                                            color: const Color(0xFFFFC120),
                                          ),
                                        ),
                                      ),
                                      // !here is the evaluation
                                      TextSpan(
                                        text: avrOfStars.toStringAsFixed(2),
                                        style: TextStyle(
                                          color: const Color(0xFF6D6D6D),
                                          fontSize: 4.5.sp,
                                          letterSpacing: .2,
                                          fontFamily: 'DM Sans',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 18.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    child: const Icon(Icons.remove, size: 14),
                                    onTap: () {
                                      cubit.removeAmountOfProduct();
                                    },
                                  ),
                                  BlocBuilder<ProductCubit, ProductStates>(
                                    builder: (context, state) {
                                      String amountOfProducts =
                                          cubit.amountOfProduct.toString();
                                      if (state is ChangeProductAmountState) {
                                        amountOfProducts =
                                            cubit.amountOfProduct.toString();
                                      }
                                      return Text(
                                        amountOfProducts,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                        ),
                                      );
                                    },
                                  ),
                                  InkWell(
                                    child: const Icon(Icons.add, size: 14),
                                    onTap: () {
                                      cubit.addAmountOfProduct();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            product.makerCompany,
                            style: TextStyle(
                              color: const Color(0xFF9B9B9B),
                              fontSize: 7.sp,
                              fontFamily: 'Tenor Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.06,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        SizedBox(
                          width: 98.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Color',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7.sp,
                                      fontFamily: 'Tenor Sans',
                                      fontWeight: FontWeight.bold,
                                      height: 1.06,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  // !Color
                                  SizedBox(
                                    height: 3.4.h,
                                    width: 40.w,
                                    child: SetColor(
                                      colors: colors,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7.sp,
                                      fontFamily: 'Tenor Sans',
                                      fontWeight: FontWeight.bold,
                                      height: 1.06,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  //! Size
                                  SizedBox(
                                    height: 3.4.h,
                                    width: 35.w,
                                    child: SetSize(sizes: sizes),
                                  ),
                                ],
                              ),
                              SizedBox(width: 1.h),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 7.sp,
                            fontFamily: 'Tenor Sans',
                            fontWeight: FontWeight.bold,
                            height: 1.06,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            product.discription,
                            style: TextStyle(
                              wordSpacing: 1,
                              color: const Color(0xFF6C6C6C),
                              fontSize: 6.sp,
                              fontFamily: 'Tenor Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.06,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: const Divider(),
                        ),
                        SizedBox(height: 2.h),
                        ReviewsCard(
                            cubit: cubit,
                            avrOfStars: avrOfStars,
                            getAvrOfStars: getAvrOfStars)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              SimilarProductsCard(
                categoryName: categoryName,
                fromPage: fromPage,
                cubit: cubit,
                searchCubit: searchCubit,
                searchWord: searchWord,
                product: product,
              ),
              SizedBox(height: 13.h),
            ],
          ),
        ),
      ),
    );
  }
}
