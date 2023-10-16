import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/models/product_model.dart';
import '../../products_view/cubits/product_screen/cubit.dart';
import '../../products_view/screens/product_screen.dart';
import '../../search/cubit/sreach_cubit.dart';
import '../../search/widgets/end_drawer.dart';
import '../blocs/discount/discount_products_bloc.dart';

class SeeAllProductsPage extends StatefulWidget {
  final List<Map<String, dynamic>> categoryProducts;
  final String categoryName;
  final String searchWord;
  const SeeAllProductsPage({
    super.key,
    required this.searchWord,
    required this.categoryName,
    required this.categoryProducts,
  });

  @override
  State<SeeAllProductsPage> createState() => _SeeAllProductsPageState();
}

class _SeeAllProductsPageState extends State<SeeAllProductsPage> {
  late TextEditingController searchController;
  late List<Map<String, dynamic>> categoryProducts;
  late String categoryName;
  //! new
  bool isSearch = false;
  @override
  void initState() {
    searchController = TextEditingController(text: widget.searchWord);
    categoryProducts = widget.categoryProducts;
    categoryName = widget.categoryName;
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = SearchCubit.get(context);
    return SafeArea(
        child: Scaffold(
      endDrawer: EndDrawer(
        oldCategoryName: widget.categoryName,
        searchWord: searchController.text,
        fromPage: 'seeAll',
        searchController: searchController,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(children: [
          SizedBox(height: 3.w),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 10.w,
                width: 10.w,
                padding: EdgeInsets.only(
                    left: 2.5.w, top: 1.w, bottom: 1.w, right: 1.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0.1, 2),
                          blurRadius: .4,
                          color: Colors.black.withOpacity(.25))
                    ]),
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    context
                        .read<DiscountProductsBloc>()
                        .add(ChangeIsSearchEvent(isSearch: false));
                    Navigator.of(context)
                        .pop({'searchWord': searchController.text});
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                )),
              ),
              SizedBox(width: 4.w),
              BlocBuilder<DiscountProductsBloc, DiscountProductsState>(
                builder: (context, state) {
                  if (state is IsSearchState) {
                    isSearch = state.isSearch;
                  }
                  return SizedBox(
                    width: 80.w,
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: isSearch ? 0.w : 40.w,
                          height: isSearch ? 0 : 4.h,
                          child: Text(
                            categoryName,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 8.sp,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: isSearch ? 80.w : 0,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            clipBehavior: Clip.antiAlias,
                            child: TextField(
                              onSubmitted: (value) async {
                                searchInDiscount(cubit);
                              },
                              controller: searchController,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle:
                                      const TextStyle(color: Color(0xFF9B9B9B)),
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      searchInDiscount(cubit);
                                    },
                                    icon: const Icon(
                                      color: Color(0xFFA4A4A4),
                                      Icons.search,
                                      size: 25,
                                    ),
                                  ),
                                  suffixIcon: GestureDetector(
                                    child: const Icon(Icons.close),
                                    onTap: () async {
                                      searchController.text = '';
                                      FocusScope.of(context).unfocus();
                                      context.read<DiscountProductsBloc>().add(
                                          ChangeIsSearchEvent(isSearch: false));
                                      cubit
                                          .searchInDiscounts(null)
                                          .then((allDiscountProducts) {
                                        context
                                            .read<DiscountProductsBloc>()
                                            .add(GetAllDiscountEvent(
                                                allDiscountProducts:
                                                    allDiscountProducts));
                                      });
                                    },
                                  ),
                                  fillColor: const Color(0xFFEAEAEA),
                                  filled: true,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: isSearch ? 0 : 40.w,
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                searchController.text = '';
                                context
                                    .read<DiscountProductsBloc>()
                                    .add(ChangeIsSearchEvent(isSearch: true));
                                FocusScope.of(context).requestFocus();
                              },
                              icon: AnimatedOpacity(
                                opacity: isSearch ? 0 : 1,
                                duration: const Duration(milliseconds: 300),
                                child: Icon(
                                  Icons.search,
                                  size: 10.sp,
                                ),
                              )),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              BlocBuilder<DiscountProductsBloc, DiscountProductsState>(
                builder: (context, state) {
                  int length = categoryProducts.length;
                  if (state is SearchInDiscountResult) {
                    length = state.searchResult.length;
                  } else if (state is AllDiscountProductState) {
                    length = state.allDiscountProducts.length;
                  }
                  return Text(
                    "$length items founded",
                    style: TextStyle(
                        color: const Color(0xFF979797), fontSize: 7.sp),
                  );
                },
              ),
              const Spacer(),
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    cubit.openDrawer(context);
                  },
                  child: Image(
                    image: const AssetImage('assets/images/Filter_big.png'),
                    height: 4.h,
                  ),
                );
              }),
              SizedBox(width: 2.w)
            ],
          ),
          SizedBox(height: 3.h),
          BlocBuilder<DiscountProductsBloc, DiscountProductsState>(
            builder: (context, state) {
              log(state.toString());
              if (state is SearchInDiscountResult) {
                categoryProducts = state.searchResult;
              } else if (state is AllDiscountProductState) {
                categoryProducts = state.allDiscountProducts;
              }
              return Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: categoryProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .5,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    ProductModel product =
                        ProductModel.fromMap(categoryProducts[index]);
                    return GestureDetector(
                      onTap: () {
                        ProductCubit productCubit =
                            BlocProvider.of<ProductCubit>(context);
                        productCubit.widthOfPrice = 145;
                        productCubit.hidden = false;
                        productCubit.getReviws(product.id).then((value) {
                          productCubit
                              .getSimilarProducts(product)
                              .then((value) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                categoryName: categoryName,
                                fromPage: 'seeAll',
                                searchCubit: cubit,
                                searchWord: searchController.text,
                                product: product,
                                cubit: BlocProvider.of<ProductCubit>(context),
                              ),
                            ));
                          });
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 4),
                                  color: Colors.black.withOpacity(.25),
                                  blurRadius: 2)
                            ], borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              alignment: const Alignment(.80, -.89),
                              children: [
                                Image.asset(
                                  product.imgUrl.split('|')[0].trim(),
                                  fit: BoxFit.cover,
                                  height: 35.h,
                                  width: 25.h,
                                ),
                                Positioned(
                                  right: 2.w,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                        color: const Color(0xffFF6E6E),
                                        onPressed: () {
                                          if (searchController.text == '') {
                                            cubit
                                                .setFavorateProduct(product.id,
                                                    !product.isFavorite)
                                                .then((value) {
                                              cubit
                                                  .searchInDiscounts(null)
                                                  .then((searchResult) {
                                                context
                                                    .read<
                                                        DiscountProductsBloc>()
                                                    .add(SearchInDiscount(
                                                        searchResult:
                                                            searchResult));
                                              });
                                            });
                                          } else {
                                            cubit
                                                .setFavorateProduct(product.id,
                                                    !product.isFavorite)
                                                .then((value) {
                                              cubit
                                                  .searchInDiscounts(
                                                      searchController.text)
                                                  .then((searchResult) {
                                                context
                                                    .read<
                                                        DiscountProductsBloc>()
                                                    .add(SearchInDiscount(
                                                        searchResult:
                                                            searchResult));
                                              });
                                            });
                                          }
                                        },
                                        icon: Icon(product.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_outline)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h),
                          SizedBox(
                            height: 5.h,
                            child: Row(
                              children: [
                                Text(
                                  product.makerCompany,
                                  style: TextStyle(fontSize: 6.sp),
                                ),
                                const Spacer(),
                                Text(
                                  "${product.price} \$",
                                  style: TextStyle(
                                      color: const Color(0xFFD57676),
                                      fontSize: 5.sp),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                            width: double.infinity,
                            child: Text(
                              product.name,
                              maxLines: 1,
                              style: const TextStyle(color: Color(0xFF828282)),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ]),
      ),
    ));
  }

  searchInDiscount(SearchCubit cubit) async {
    if (searchController.text != '') {
      cubit.searchInDiscounts(searchController.text).then((searchResult) {
        log(searchResult.toString());
        context
            .read<DiscountProductsBloc>()
            .add(SearchInDiscount(searchResult: searchResult));
      });
    }
  }
}
