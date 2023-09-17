import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';

import '../blocs/discount/discount_products_bloc.dart';
import '../models/product_model.dart';
import '../widgets/collections_spacer.dart';
import '../widgets/discount_image.dart';
import '../widgets/recommended_image.dart';
import '../widgets/top_collection_image.dart';
import '../widgets/trendy_image.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, Object?>> disCountProducts;
  const HomePage({super.key, required this.disCountProducts});

  @override
  Widget build(BuildContext context) {
    context
        .read<DiscountProductsBloc>()
        .add(GetDiscountProducts(discountProducts: disCountProducts));
    return ListView(
      children: [
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 20.h,
          width: 100.w,
          child: Image.asset(
            'assets/images/Capture.PNG',
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 10),
        CollectionsSpacer(onTap: () {}, collectoinTitle: 'Discount'),
        //! Discount products
        Container(
            padding: EdgeInsets.only(left: 1.w, top: 1.h),
            width: 100.w,
            height: 32.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    disCountProducts.length < 6 ? disCountProducts.length : 6,
                itemBuilder: (context, index) {
                  ProductModel product =
                      ProductModel.fromMap(disCountProducts[index]);
                  return DisCountImage(
                      makerCompany: product.makerCompany,
                      imageUrl: product.imgUrl,
                      price: product.price.toString(),
                      productName: product.name,
                      discount: product.disCount.toString());
                })),
        CollectionsSpacer(onTap: () async {}, collectoinTitle: 'Trendy'),
        //! Trendy products
        Container(
          padding: EdgeInsets.only(left: 3.w, top: 1.h),
          width: 100.w,
          height: 30.h,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            const TrendyImage(
                imageUrl: 'assets/images/1.png',
                percent: '50 %',
                price: '17 \$',
                productName: 'Wite contton Shirt'),
            SizedBox(width: 2.w),
            const TrendyImage(
                imageUrl: 'assets/images/1.png',
                percent: '50 %',
                price: '17 \$',
                productName: 'Stripped contton Shirt'),
            SizedBox(width: 2.w),
            const TrendyImage(
                imageUrl: 'assets/images/1.png',
                percent: '50 %',
                price: '17 \$',
                productName: 'Grey contton Shirt'),
          ]),
        ),
        CollectionsSpacer(onTap: () {}, collectoinTitle: 'Recommended'),
        //! Recommended products
        SizedBox(
          width: 100.w,
          height: 12.h,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const RecommendedImage(
              imageUrl: 'assets/images/1.png',
              productPrice: '10 \$',
              productNamge: 'Coffee polo shirt',
            ),
          ),
        ),
        CollectionsSpacer(onTap: () {}, collectoinTitle: 'Top Collection'),
        //! Top collection
        const TopCollectionImage(),
      ],
    );
  }
}
