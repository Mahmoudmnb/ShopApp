import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../home/models/product_model.dart';
import 'product_view_custom_button.dart';

class AddToCartBottomSheet extends StatelessWidget {
  final bool isDiscount;
  final ProductModel product;
  final bool hidden;
  final double widthOfPrice;
  const AddToCartBottomSheet(
      {super.key,
      required this.isDiscount,
      required this.product,
      required this.hidden,
      required this.widthOfPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15, top: 8, right: 15, left: 10),
      color: Colors.white,
      width: 100.w,
      height: 10.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(children: [
            AnimatedContainer(
                width: widthOfPrice,
                duration: const Duration(milliseconds: 200)),
            hidden
                ? const SizedBox()
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                                color: const Color(0xFFAAAAAA),
                                fontSize: 5.sp,
                                fontFamily: 'DM Mono',
                                letterSpacing: 1.0,
                                wordSpacing: 1),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            isDiscount
                                ? '${(1 - product.disCount / 100) * product.price} \$'
                                : product.price.toString(),
                            style: TextStyle(
                              fontSize: 6.sp,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      !isDiscount
                          ? const SizedBox()
                          : Text(
                              '\$${product.price}',
                              style: TextStyle(
                                textBaseline: TextBaseline.alphabetic,
                                decoration: TextDecoration.lineThrough,
                                decorationColor:
                                    const Color(0xFF000000).withOpacity(.57),
                                color: const Color(0xFFD47676),
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                                height: 1,
                              ),
                            ),
                    ],
                  ),
          ]),
          SizedBox(width: hidden ? 0 : 3.w),
          Expanded(
            child: ProductViewCustomButton(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('assets/images/icon.png')),
                  SizedBox(width: 2.w),
                  Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 5.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
