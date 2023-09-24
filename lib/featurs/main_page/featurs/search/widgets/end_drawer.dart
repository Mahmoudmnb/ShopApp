import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/featurs/main_page/data_source/data_source.dart';
import 'package:shop_app/featurs/main_page/featurs/home/blocs/discount/discount_products_bloc.dart';
import 'package:shop_app/injection.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../cubit/sreach_cubit.dart';

class EndDrawer extends StatelessWidget {
  final String searchWord;
  final String fromPage;
  final String? oldCategoryName;
  final TextEditingController searchController;
  const EndDrawer(
      {super.key,
      required this.searchController,
      this.oldCategoryName,
      required this.searchWord,
      required this.fromPage});
  @override
  Widget build(BuildContext context) {
    var cubit = SearchCubit.get(context);
    void hidTextFromField() {
      searchController.text = '';
      context
          .read<DiscountProductsBloc>()
          .add(ChangeIsSearchEvent(isSearch: false));
    }

    Widget sb({double width = 0, double height = 0}) {
      return SizedBox(
        height: height,
        width: width,
      );
    }

    return Drawer(
      child: Container(
        padding: EdgeInsets.only(
            top: fromPage == 'SearchPage' ? 1.h : 5.h, left: 1.w, right: 1.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filter",
                  style: TextStyle(fontSize: 10.sp, fontFamily: 'DM Sans'),
                ),
                Image(
                  image: const AssetImage('assets/images/Filter_big.png'),
                  height: 7.w,
                )
              ],
            ),
          ),
          sb(height: fromPage == 'SearchPage' ? 1.h : 2.h),
          const Divider(thickness: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Category",
                style: TextStyle(
                    color: const Color(0xFF7E7E7E),
                    fontSize: 6.sp,
                    fontFamily: 'DM Sans'),
              ),
              sb(height: fromPage == 'SearchPage' ? 1.h : 2.h),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFFEDEDED),
                    borderRadius: BorderRadius.circular(10)),
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    String selectedCategory = cubit.selectedCategory;
                    if (state is ResetFilter) {
                      selectedCategory = cubit.selectedCategory;
                    } else if (state is SetSelectedCategory) {
                      selectedCategory = cubit.selectedCategory;
                    }
                    return DropdownButton(
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (value) {
                        cubit.setSelectedCategory(value!);
                      },
                      value: selectedCategory,
                      hint: const Text("Choose category"),
                      items: [
                        DropdownMenuItem(
                          value: "All",
                          child: const Text("All"),
                          onTap: () {
                            // Category = 'Drinks';
                          },
                        ),
                        DropdownMenuItem(
                          value: "suits",
                          child: const Text('Suits'),
                          onTap: () {
                            // Category = 'Main';
                          },
                        ),
                        DropdownMenuItem(
                          value: "shirt",
                          child: const Text('Shirt'),
                          onTap: () {
                            // Category = 'Sweetes';
                          },
                        ),
                        DropdownMenuItem(
                          value: "pants",
                          child: const Text("Pants"),
                          onTap: () {
                            // Category = 'Aprrtie';
                          },
                        ),
                        DropdownMenuItem(
                          value: "sweaters",
                          child: const Text("Sweaters"),
                          onTap: () {
                            // Category = 'Aprrtie';
                          },
                        ),
                        DropdownMenuItem(
                          value: "t-shirts",
                          child: const Text("T-Shirts"),
                          onTap: () {
                            // Category = 'Aprrtie';
                          },
                        ),
                        DropdownMenuItem(
                          value: "jackets",
                          child: const Text("Jackets"),
                          onTap: () {
                            // Category = 'Aprrtie';
                          },
                        ),
                        DropdownMenuItem(
                          value: "shorts",
                          child: const Text("Shorts"),
                          onTap: () {
                            // Category = 'Aprrtie';
                          },
                        ),
                        DropdownMenuItem(
                          value: "sportswear",
                          child: const Text("SportsWear"),
                          onTap: () {
                            // Category = 'Aprrtie';
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              sb(height: fromPage == 'SearchPage' ? 1.h : 2.h),
              Text(
                "Price",
                style: TextStyle(
                    color: const Color(0xFF7E7E7E),
                    fontSize: 6.sp,
                    fontFamily: 'DM Sans'),
              ),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  SfRangeValues values = cubit.valuesOfFilterPrice;
                  if (state is ResetFilter) {
                    values = cubit.valuesOfFilterPrice;
                  }
                  return SfRangeSlider(
                    shouldAlwaysShowTooltip: true,
                    dragMode: SliderDragMode.both,
                    min: 0,
                    max: 100,
                    values: values,
                    stepSize: 1,
                    interval: 20,
                    activeColor: Colors.black,
                    enableTooltip: true,
                    onChanged: (SfRangeValues values) {
                      cubit.changeValueofFilterPrice(values);
                    },
                  );
                },
              ),
              Text(
                "Colors",
                style: TextStyle(
                    color: const Color(0xFF7E7E7E),
                    fontSize: 6.sp,
                    fontFamily: 'DM Sans'),
              ),
              sb(height: fromPage == 'SearchPage' ? 1.h : 2.h),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  List<bool> filterColors = cubit.filterColors;
                  if (state is ResetFilter) {
                    filterColors = cubit.filterColors;
                  }
                  return SizedBox(
                    height: 7.w,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => sb(width: 2.w),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: cubit.colors.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          cubit.selectFilterColor(index);
                        },
                        child: Container(
                          width: 7.w,
                          height: 7.w,
                          decoration: BoxDecoration(
                              border: filterColors[index]
                                  ? Border.all(color: Colors.blue, width: 2)
                                  : null,
                              color: cubit.colors[index],
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                    ),
                  );
                },
              ),
              sb(height: fromPage == 'SearchPage' ? 1.h : 2.h),
              Text(
                "Rating",
                style: TextStyle(
                    color: const Color(0xFF7E7E7E),
                    fontSize: 6.sp,
                    fontFamily: 'DM Sans'),
              ),
              sb(height: fromPage == 'SearchPage' ? 1.h : 2.h),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  List<bool> filterRating = cubit.filterRating;
                  if (state is ResetFilter) {
                    filterRating = cubit.filterRating;
                  }
                  return Container(
                    padding: EdgeInsets.only(left: 2.w),
                    height: 12.w,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => sb(width: 4.w),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          cubit.selectFilterRating(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(0, 4),
                                    color: Colors.black.withOpacity(.25))
                              ],
                              color: filterRating[index]
                                  ? const Color(0xFF33302E)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          width: 12.w,
                          height: 12.w,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: filterRating[index]
                                      ? Colors.white
                                      : const Color(0xFF33302E),
                                  size: 3.w,
                                ),
                                Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    color: filterRating[index]
                                        ? Colors.white
                                        : const Color(0xFF33302E),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                  );
                },
              ),
              sb(height: fromPage == 'SearchPage' ? 1.h : 2.h),
              Text(
                "Discount",
                style: TextStyle(
                    color: const Color(0xFF7E7E7E),
                    fontSize: 6.sp,
                    fontFamily: 'DM Sans'),
              ),
              sb(height: fromPage == 'SearchPage' ? 1.h : 2.h),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  List<bool> filterDiscount = cubit.filterDiscount;
                  if (state is ResetFilter) {
                    filterDiscount = cubit.filterDiscount;
                  }
                  return SizedBox(
                    height: 15.h,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.discount.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          cubit.selectFilterDiscount(index);
                        },
                        child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color: filterDiscount[index]
                                    ? const Color(0xFF33302E)
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 4),
                                      color: Colors.black.withOpacity(.25),
                                      blurRadius: 4)
                                ],
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                                child: Text(
                              '${cubit.discount[index]}%',
                              style: TextStyle(
                                fontFamily: 'DM Sans',
                                color: filterDiscount[index]
                                    ? Colors.white
                                    : const Color(0xFF33302E),
                              ),
                            ))),
                      ),
                    ),
                  );
                },
              ),
              sb(height: fromPage == 'SearchPage' ? 1.h : 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                      onPressed: () async {
                        if (fromPage == 'categoryView') {
                          await cubit.reset(searchWord, false);
                          cubit.setSelectedCategory(
                              oldCategoryName!.toLowerCase());
                          cubit.changeCategoryViewSearch(false);
                          await cubit
                              .searchInCategory(null, oldCategoryName!)
                              .then((value) {
                            log(value.toString());
                          });
                          searchController.text = '';
                        }
                        if (fromPage == 'seeAll') {
                          cubit.reset(searchWord, false);
                          cubit.setSelectedCategory('All');
                          hidTextFromField();
                          sl
                              .get<DataSource>()
                              .getDiscountsProducts()
                              .then((allDiscountProducts) {
                            context.read<DiscountProductsBloc>().add(
                                GetAllDiscountEvent(
                                    allDiscountProducts: allDiscountProducts));
                          });
                        } else {
                          await cubit.reset(searchWord, true);
                        }
                      },
                      child: const Text('Reset')),
                  MaterialButton(
                      onPressed: () async {
                        if (fromPage == 'categoryView') {
                          log(fromPage);
                          if (searchWord.isEmpty) {
                            var data = await cubit.searchInCategory(
                                null, cubit.selectedCategory);
                            log(data.toString());
                          } else {
                            var data = await cubit.searchInCategory(
                                searchWord, cubit.selectedCategory);
                            log(data.toString());
                          }
                        }
                        if (fromPage == 'seeAll') {
                          if (searchWord.isEmpty) {
                            await cubit
                                .searchInDiscounts(null)
                                .then((searchResult) {
                              context.read<DiscountProductsBloc>().add(
                                  SearchInDiscount(searchResult: searchResult));
                            });
                          } else {
                            log(searchWord);
                            await cubit
                                .searchInDiscounts(searchWord)
                                .then((searchResult) {
                              context.read<DiscountProductsBloc>().add(
                                  SearchInDiscount(searchResult: searchResult));
                            });
                          }
                        } else {
                          cubit.search(searchWord);
                        }
                      },
                      color: const Color(0xFF33302E),
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'DM Sans'),
                      ))
                ],
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
