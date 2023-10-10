import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/product_screen/cubit.dart';
import '../screens/all_reviews_screen.dart';
import '../screens/similar_items_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/set_color.dart';
import '../widgets/set_size.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool b = true;
  double widthOfPrice = 200;
  bool hidden = false;
  bool isDiscount = true;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    // this line for change color of status bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // the color of status bar
      statusBarColor: Colors.white,
      // the color of icons in Android
      statusBarIconBrightness: Brightness.dark,
      // the color of icons in IOS
      statusBarBrightness: Brightness.dark,
    ));
    return Sizer(
      builder: (
        BuildContext context,
        Orientation orientation,
        DeviceType deviceType,
      ) =>
          BlocProvider<ProductCubit>(
        create: (context) => ProductCubit(),
        child: BlocConsumer<ProductCubit, ProductStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ProductCubit cubit = BlocProvider.of<ProductCubit>(context);
            return SafeArea(
              child: Scaffold(
                body: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      SizedBox(
                        height: 54.1.h,
                        width: 100.w,
                        child: PageView.builder(
                          controller: controller,
                          itemBuilder: (_, __) => const Image(
                            image: AssetImage('asset/images/photo1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 35,
                        child: CustomIconButton(
                          icon: const Icon(Icons.arrow_back_ios_rounded),
                          onPressed: () {
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 35,
                        child: CustomIconButton(
                          icon: Icon(
                            cubit.isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            color: cubit.isFavorite
                                ? const Color(0xFFFF6E6E)
                                : null,
                          ),
                          onPressed: () {
                            cubit.changeFavorite();
                          },
                        ),
                      ),
                      Positioned(
                        top: 372,
                        child: SmoothPageIndicator(
                          count: 3,
                          effect: ExpandingDotsEffect(
                            dotWidth: 6,
                            dotHeight: 6,
                            activeDotColor: Colors.white,
                            dotColor: Colors.white.withOpacity(.61),
                          ),
                          controller: controller,
                          onDotClicked: (index) {
                            log(index.toString());
                          },
                        ),
                      ),
                      //todo: this widget to get the status of DraggaablesScrollSheet and change the status of DraggaablesScrollSheet
                      NotificationListener<DraggableScrollableNotification>(
                        onNotification:
                            (DraggableScrollableNotification notification) {
                          cubit.changeHeightScreen(notification.extent);
                          return true;
                        },
                        //* this widget is very good it is like model bottom sheet
                        //* and more flexible and you have to use it with [Stack]
                        child: DraggableScrollableSheet(
                          snap: true,
                          initialChildSize: 0.49,
                          minChildSize: 0.49,
                          builder: (context, scrollController) =>
                              SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            controller: scrollController,
                            child: Container(
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          cubit.isFullScreen ? 15 : 0),
                                      topRight: Radius.circular(
                                          cubit.isFullScreen ? 15 : 0))),
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 17),
                                            Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color:
                                                      const Color(0xFFDFDFDF),
                                                ),
                                                width: 74,
                                                height: 4,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    Text(
                                                      'Navy shirt',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        letterSpacing: .5,
                                                        fontFamily:
                                                            'Tenor Sans',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24,
                                                      ),
                                                    ),
                                                    SizedBox(width: 13),
                                                    Text.rich(
                                                      TextSpan(
                                                        children: [
                                                          WidgetSpan(
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          3.0,
                                                                      bottom:
                                                                          1),
                                                              child: Icon(
                                                                Icons.star,
                                                                size: 14,
                                                                color: Color(
                                                                    0xFFFFC120),
                                                              ),
                                                            ),
                                                          ),
                                                          // !here is the evaluation
                                                          TextSpan(
                                                            text: '4.6 (86)',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF6D6D6D),
                                                              fontSize: 12,
                                                              letterSpacing: .2,
                                                              fontFamily:
                                                                  'DM Sans',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: 70,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFEEEEEE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        child: const Icon(
                                                            Icons.remove,
                                                            size: 14),
                                                        onTap: () {
                                                          cubit
                                                              .removeAmountOfProduct();
                                                        },
                                                      ),
                                                      // !here you have to put the amount of product
                                                      Text(
                                                        '${cubit.amountOfProduct}',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                      InkWell(
                                                        child: const Icon(
                                                            Icons.add,
                                                            size: 14),
                                                        onTap: () {
                                                          cubit
                                                              .addAmountOfProduct();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            const Padding(
                                              padding: EdgeInsets.only(left: 2),
                                              child: Text(
                                                'Zara',
                                                style: TextStyle(
                                                  color: Color(0xFF9B9B9B),
                                                  fontSize: 16,
                                                  fontFamily: 'Tenor Sans',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.06,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              width: 100.w - 50,
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Colour',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontFamily:
                                                              'Tenor Sans',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          height: 1.06,
                                                          letterSpacing: 1,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      // !Color
                                                      SizedBox(
                                                        height: 22,
                                                        width: 35.w,
                                                        child: const SetColor(
                                                          colors: [
                                                            Color(0xFF181E27),
                                                            Color(0xFF44565C),
                                                            Color(0xFFE4E4E4),
                                                            Color(0xFF6D4F44),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 60),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Size',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontFamily:
                                                              'Tenor Sans',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          height: 1.06,
                                                          letterSpacing: 1,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      //! Size
                                                      SizedBox(
                                                        height: 22,
                                                        width: 35.w,
                                                        child: const SetSize(
                                                          sizes: [
                                                            'm',
                                                            'L',
                                                            'XL',
                                                            'XX',
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 10),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 28),
                                            const Text(
                                              'Description',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Tenor Sans',
                                                fontWeight: FontWeight.bold,
                                                height: 1.06,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            SizedBox(
                                              width: 100.w,
                                              child: const Text(
                                                'A classic crewneck men\'s T-shirt made from soft cotton fabric, featuring a minimalist design and a comfortable fit for everyday wear.',
                                                style: TextStyle(
                                                  wordSpacing: 1,
                                                  color: Color(0xFF6C6C6C),
                                                  fontSize: 16,
                                                  fontFamily: 'Tenor Sans',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.06,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 30),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: const Divider(),
                                            ),
                                            const SizedBox(height: 22),
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // !here you have to put number of reviews
                                                Text(
                                                  'Review (86)',
                                                  style: TextStyle(
                                                    color: Color(0xFF0C1A30),
                                                    fontSize: 18,
                                                    fontFamily: 'Tenor Sans',
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.33,
                                                    letterSpacing: 0.20,
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      WidgetSpan(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 3),
                                                          child: Icon(
                                                              Icons.star,
                                                              color: Color(
                                                                  0xFFFFC120),
                                                              size: 20),
                                                        ),
                                                      ),
                                                      // !here put average of elvaulation
                                                      TextSpan(
                                                        text: '4.6',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'Tenor Sans',
                                                          letterSpacing: .2,
                                                          color:
                                                              Color(0xFF0C1A30),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            // !Cards of reviews
                                            CustomListTile(
                                              //* this width (100% - 120px) becasue this card has a custom padding :)
                                              //* (bannan don't kill me please ^_^)
                                              width: 100.w - 120,
                                              username: "Fatima Mesho",
                                              date: '3 months ago',
                                              description:
                                                  'Great shirt, perfect fit! The design is stylish and versatile.',
                                              stars: 4,
                                            ),
                                            CustomListTile(
                                              //* this width (100% - 120px) becasue it has a custom padding :)
                                              //* (bannan don't kill me please ^_^)
                                              width: 100.w - 120,
                                              username: "Fatima Mesho",
                                              date: '3 months ago',
                                              description:
                                                  'Great shirt, perfect fit! The design is stylish and versatile.',
                                              stars: 4,
                                            ),
                                            CustomListTile(
                                              //* this width (100% - 120px) becasue it has a custom padding :)
                                              //* (bannan don't kill me please ^_^)
                                              width: 100.w - 120,
                                              username: "Fatima Mesho",
                                              date: '3 months ago',
                                              description:
                                                  'Great shirt, perfect fit! The design is stylish and versatile.',
                                              stars: 4,
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              width: 100.w,
                                              height: 50,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            const AllReviewsScreen()),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Color(0xFF0C1A30),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    foregroundColor:
                                                        const Color(0xFF0C1A30),
                                                    backgroundColor:
                                                        const Color(
                                                            0xFFFFFFFF)),
                                                child: const Text(
                                                  'See All Review',
                                                  style: TextStyle(
                                                    color: Color(0xFF0C1A30),
                                                    fontSize: 15,
                                                    fontFamily: 'DM Sans',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.43,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  //! Similar items
                                  Container(
                                    width: 100.w,
                                    color: const Color(0xFFFAFAFA),
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 25.0),
                                              child: Text(
                                                'Similar Items',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'Tenor Sans',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.06,
                                                  letterSpacing: 0.20,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 25),
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  foregroundColor:
                                                      const Color(0xFF9B9B9B),
                                                ),
                                                child: const Text(
                                                  'See All',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'DM Sans',
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.05,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SimilarItemsScreen(),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 17),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100.w,
                                              height: 21.422.h,
                                              child: ListView.separated(
                                                shrinkWrap: true,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemBuilder: (_, int index) {
                                                  if (index == 0) {
                                                    //* fist card
                                                    return Row(
                                                      children: [
                                                        const SizedBox(
                                                            width: 25),
                                                        CustomCard(
                                                            width: 29.5.w,
                                                            height: 16.54.h),
                                                      ],
                                                    );
                                                    //* last card
                                                  } else if (index == 4) {
                                                    return Row(
                                                      children: [
                                                        CustomCard(
                                                            width: 29.5.w,
                                                            height: 16.54.h),
                                                        const SizedBox(
                                                            width: 25),
                                                      ],
                                                    );
                                                  }
                                                  return CustomCard(
                                                      width: 29.5.w,
                                                      height: 16.54.h);
                                                },
                                                itemCount: 5,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                separatorBuilder: (BuildContext
                                                            context,
                                                        int index) =>
                                                    const SizedBox(width: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 73),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // !Add to Cart button
                      Positioned(
                        // top: 88.h,
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.only(
                              bottom: 15, top: 8, right: 25, left: 25),
                          color: Colors.white,
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cubit.hiddenPrice
                                  ? const SizedBox()
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Total Price',
                                              style: TextStyle(
                                                  color: Color(0xFFAAAAAA),
                                                  fontSize: 10,
                                                  fontFamily: 'DM Mono',
                                                  letterSpacing: 1.0,
                                                  wordSpacing: 1),
                                            ),
                                            Text(
                                              '198.00',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'DM Sans',
                                                fontWeight: FontWeight.w700,
                                                height: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 6),
                                        !isDiscount
                                            ? const SizedBox()
                                            : Text(
                                                '\$250.00',
                                                style: TextStyle(
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor:
                                                      const Color(0xFF000000)
                                                          .withOpacity(.57),
                                                  color:
                                                      const Color(0xFFD47676),
                                                  fontSize: 14,
                                                  fontFamily: 'DM Sans',
                                                  fontWeight: FontWeight.w700,
                                                  height: 1,
                                                ),
                                              ),
                                      ],
                                    ),
                              AnimatedContainer(
                                height: 50,
                                width: cubit.widthOfButton,
                                duration: const Duration(milliseconds: 200),
                                child: CustomButton(
                                  child: const Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                          image: AssetImage(
                                              'asset/images/icon.png')),
                                      SizedBox(width: 15),
                                      Text(
                                        'Add to cart',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
