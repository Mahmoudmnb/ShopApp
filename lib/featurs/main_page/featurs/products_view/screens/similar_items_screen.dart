import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/models/product_model.dart';
import '../../search/cubit/sreach_cubit.dart';
import '../cubits/product_screen/cubit.dart';
import '../widgets/product_view_widgets.dart';
import 'product_screen.dart';

class SimilarItemsScreen extends StatelessWidget {
  final ProductCubit productCubit;
  final ProductModel product;
  final String searchWord;
  final String categoryName;
  final SearchCubit searchCubit;
  final List<Map<String, dynamic>> similarProducts;
  final String fromPage;

  const SimilarItemsScreen(
      {super.key,
      required this.fromPage,
      required this.similarProducts,
      required this.searchCubit,
      required this.product,
      required this.searchWord,
      required this.categoryName,
      required this.productCubit});

  @override
  Widget build(BuildContext context) {
    void navigateToProductScrean(ProductModel productModel) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ProductScreen(
          searchWord: searchWord,
          product: productModel,
          searchCubit: searchCubit,
          fromPage: fromPage,
          categoryName: categoryName,
          cubit: BlocProvider.of<ProductCubit>(context),
        ),
      ));
    }

    return WillPopScope(
      onWillPop: () async {
        productCubit.widthOfPrice = 145;
        productCubit.hidden = false;
        Map<String, dynamic> productMap =
            await productCubit.getProductById(product.id);
        navigateToProductScrean(ProductModel.fromMap(productMap));
        return false;
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.only(left: 7.w),
              child: Row(
                children: [
                  CustomIconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () async {
                      productCubit.widthOfPrice = 145;
                      productCubit.hidden = false;
                      Map<String, dynamic> productMap =
                          await productCubit.getProductById(product.id);
                      navigateToProductScrean(ProductModel.fromMap(productMap));
                    },
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'Similar Items',
                    style: TextStyle(
                      color: const Color(0xFF171717),
                      fontSize: 8.sp,
                      fontFamily: 'Tenor Sans',
                      fontWeight: FontWeight.w600,
                      height: 1.06,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 23.w),
              child: Text(
                '${similarProducts.length} items',
                style: TextStyle(
                  color: const Color(0xFF979797),
                  fontSize: 6.sp,
                  fontFamily: 'Tenor Sans',
                  fontWeight: FontWeight.w400,
                  height: 1.06,
                  letterSpacing: 1,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 100.w,
              height: 80.h,
              // ?if this فرشت with you
              // ? change the childAspectRation
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                //* _____________here_______________
                //* I calculate it and this is the answer :)
                childAspectRatio: 0.6373958,
                children: similarProducts
                    .map((e) => GestureDetector(
                        onTap: () async {
                          Map<String, dynamic> productsMap =
                              await productCubit.getProductById(e['id']);
                          ProductModel productModel =
                              ProductModel.fromMap(productsMap);
                          navigateToProductScrean(productModel);
                        },
                        child: SimilarItem(
                          product: ProductModel.fromMap(e),
                          productCubit: productCubit,
                        )))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
