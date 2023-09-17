import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../home/models/product_model.dart';
import '../../search/cubit/sreach_cubit.dart';
import '../../search/pages/search_results_screen.dart';
import '../cubits/product_screen/cubit.dart';
import '../widgets/product_view_widgets.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel product;
  final String searchWord;
  final SearchCubit searchCubit;
  final ProductCubit cubit;

  const ProductScreen(
      {super.key,
      required this.searchWord,
      required this.product,
      required this.searchCubit,
      required this.cubit});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  //! mnb
  bool isDiscount = true;
  late PageController pageController;
  late ProductModel product;
  List<Color> colors = [];
  List<String> sizes = [];
  List<String> imagesUrl = [];
  double avrOfStars = 0;
  late ProductCubit cubit;
  @override
  void initState() {
    // this line for change color of status bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // the color of status bar
      statusBarColor: Colors.white,
      // the color of icons in Android
      statusBarIconBrightness: Brightness.dark,
      // the color of icons in IOS
      statusBarBrightness: Brightness.dark,
    ));
    pageController = PageController();
    product = widget.product;
    List<String> c = product.colors.split('|');
    sizes = product.sizes.split('|');
    for (var element in c) {
      colors.add(Color(int.parse(element)));
    }
    imagesUrl = product.imgUrl.split('|');
    isDiscount = product.disCount > 0;
    cubit = widget.cubit;
    cubit.isFavorite = product.isFavorate;
    getAvrOfStars(cubit.reviws);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await widget.searchCubit.search(widget.searchWord.trim()).then((value) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SearchResultScreen(
                searchWord: widget.searchWord,
                fromPage: 'ProductView',
                searchProducts: value),
          ));
        });
        return false;
      },
      child: SafeArea(
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
                      controller: pageController,
                      itemCount: imagesUrl.length,
                      itemBuilder: (_, int index) => Image(
                        image: AssetImage(imagesUrl[index].trim()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 35,
                    child: CustomIconButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () async {
                        await widget.searchCubit
                            .search(widget.searchWord.trim())
                            .then((value) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => SearchResultScreen(
                                searchWord: widget.searchWord,
                                fromPage: 'ProductView',
                                searchProducts: value),
                          ));
                        });
                      },
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 35,
                    child: BlocBuilder<ProductCubit, ProductStates>(
                      builder: (context, state) {
                        bool isFavorate = cubit.isFavorite;
                        if (state is ChangeProductFavoriteState) {
                          isFavorate = cubit.isFavorite;
                        }
                        return CustomIconButton(
                          icon: Icon(
                            isFavorate
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            color: isFavorate ? const Color(0xFFFF6E6E) : null,
                          ),
                          onPressed: () {
                            cubit.changeFavorite(product.id);
                          },
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 45.h,
                    child: SmoothPageIndicator(
                      count: imagesUrl.length,
                      effect: ExpandingDotsEffect(
                        dotWidth: 6,
                        dotHeight: 6,
                        activeDotColor: Colors.white,
                        dotColor: Colors.white.withOpacity(.61),
                      ),
                      controller: pageController,
                      onDotClicked: (index) {
                        log(index.toString());
                      },
                    ),
                  ),
                  //todo: this widget to get the status of DraggaablesScrollSheet and change the status of DraggaablesScrollSheet
                  NotificationListener<DraggableScrollableNotification>(
                      onNotification:
                          (DraggableScrollableNotification notification) {
                        if (notification.extent == 1) {
                          cubit.widthOfPrice = 1.w;
                          cubit.hidden = true;
                          cubit.changeWidthOfPrice();
                        } else if (notification.extent == 0.49) {
                          cubit.widthOfPrice = 43.w;
                          cubit.hidden = false;
                          cubit.changeWidthOfPrice();
                        }
                        if (notification.extent >= 0.999) {
                          cubit.b = false;
                        } else {
                          cubit.b = true;
                        }
                        return cubit.b;
                      },
                      //* this widget is very good it is like model bottom sheet
                      //* and more flexible and you have to use it with [Stack]
                      child: ProductDetails(
                        colors: colors,
                        sizes: sizes,
                        cubit: cubit,
                        getAvrOfStars: getAvrOfStars,
                        product: product,
                        avrOfStars: avrOfStars,
                        similarProducts: cubit.similarProducts,
                        searchCubit: widget.searchCubit,
                        searchWord: widget.searchWord,
                      )),
                ],
              ),
            ),
            bottomSheet: BlocBuilder<ProductCubit, ProductStates>(
              builder: (context, state) {
                bool hidden = cubit.hidden;
                double widthOfPrice = cubit.widthOfPrice;
                if (state is ChangeWidthOfPrice) {
                  hidden = cubit.hidden;
                  widthOfPrice = cubit.widthOfPrice;
                }
                return AddToCartBottomSheet(
                  isDiscount: isDiscount,
                  product: product,
                  widthOfPrice: widthOfPrice,
                  hidden: hidden,
                );
              },
            )),
      ),
    );
  }

  //!mnb
  void getAvrOfStars(List<Map<String, dynamic>> reviews) {
    int totalStars = 0;
    for (var element in reviews) {
      totalStars += element['stars'] as int;
    }
    if (totalStars != 0) {
      avrOfStars = totalStars / reviews.length * 1.0;
    } else {
      avrOfStars = 0;
    }
  }
}
