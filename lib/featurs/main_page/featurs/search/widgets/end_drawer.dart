import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../cubit/sreach_cubit.dart';

class EndDrawer extends StatelessWidget {
  final String searchWord;
  final String fromPage;
  const EndDrawer(
      {super.key, required this.searchWord, required this.fromPage});
  @override
  Widget build(BuildContext context) {
    var cubit = SearchCubit.get(context);
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
                  style: TextStyle(fontSize: 10.sp),
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
                style:
                    TextStyle(color: const Color(0xFF7E7E7E), fontSize: 6.sp),
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
                    }
                    return DropdownButton(
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (value) {
                        cubit.selectedCategory = value!;
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
                      ],
                    );
                  },
                ),
              ),
              sb(height: fromPage == 'SearchPage' ? 1.h : 2.h),
              Text(
                "Price",
                style:
                    TextStyle(color: const Color(0xFF7E7E7E), fontSize: 6.sp),
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
                style:
                    TextStyle(color: const Color(0xFF7E7E7E), fontSize: 6.sp),
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
                style:
                    TextStyle(color: const Color(0xFF7E7E7E), fontSize: 6.sp),
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
                style:
                    TextStyle(color: const Color(0xFF7E7E7E), fontSize: 6.sp),
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
                      onPressed: () {
                        cubit.reset(searchWord);
                      },
                      child: const Text('Reset')),
                  MaterialButton(
                      onPressed: () {
                        cubit.search(searchWord);
                      },
                      color: const Color(0xFF33302E),
                      child: const Text(
                        'Apply',
                        style: TextStyle(color: Colors.white),
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
