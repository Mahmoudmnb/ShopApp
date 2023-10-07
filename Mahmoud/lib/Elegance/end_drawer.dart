import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanadprojecttest/Elegance/cubit/sreach_cubit.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget sb({double width = 0, double height = 0}) {
      return SizedBox(
        height: height,
        width: width,
      );
    }

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        const List Discount = [10, 15, 20, 30, 50, 70];

        const List colors = [
          Color(0xFF181E27),
          Color(0xFF44565C),
          Color(0xFF6D4F44),
          Color(0xFF6D6D6D),
          Color(0xFF7E7E7E),
          Color(0xFFCE8722),
          Color(0xFFDC4447),
          Color(0xFFDFA8A9),
          Color(0xFFE4E4E4),
        ];
        var cubit = SearchCubit.get(context);
        return Drawer(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filter",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Image(
                      image: const AssetImage('assets/images/Filter_big.png'),
                      height: 8.w,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Category",
                        style: TextStyle(
                            color: const Color(0xFF7E7E7E), fontSize: 6.sp),
                      ),
                      sb(height: 2.h),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xFFEDEDED),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          underline: Container(),
                          isExpanded: true,
                          onChanged: (value) {},
                          value: 'Suits',
                          hint: const Text("Choose category"),
                          items: [
                            DropdownMenuItem(
                              value: "Suits",
                              child: const Text('Suits'),
                              onTap: () {
                                // Category = 'Main';
                              },
                            ),
                            DropdownMenuItem(
                              value: "Sweetes",
                              child: const Text('Sweetes'),
                              onTap: () {
                                // Category = 'Sweetes';
                              },
                            ),
                            DropdownMenuItem(
                              value: "Aprrtie",
                              child: const Text("Aprrtie"),
                              onTap: () {
                                // Category = 'Aprrtie';
                              },
                            ),
                            DropdownMenuItem(
                              value: "Drinks",
                              child: const Text("Drinks"),
                              onTap: () {
                                // Category = 'Drinks';
                              },
                            ),
                            DropdownMenuItem(
                              value: "Candies",
                              child: const Text("Candies"),
                              onTap: () {
                                // Category = 'Candies';
                              },
                            ),
                            DropdownMenuItem(
                              value: "Vegin",
                              child: const Text("Vegin"),
                              onTap: () {
                                // Category = 'Vegin';
                              },
                            ),
                          ],
                        ),
                      ),
                      sb(height: 30),
                      Text(
                        "Price",
                        style: TextStyle(
                            color: const Color(0xFF7E7E7E), fontSize: 6.sp),
                      ),
                      SfRangeSlider(
                        shouldAlwaysShowTooltip: true,
                        dragMode: SliderDragMode.both,
                        min: 0,
                        max: 100,
                        values: cubit.valuesOfFilterPrice,
                        stepSize: 1,
                        interval: 20,
                        activeColor: Color(0xFF33302E),
                        // showTicks: true,
                        // showLabels: true,
                        enableTooltip: true,
                        onChanged: (SfRangeValues values) {
                          cubit.changeValueofFilterPrice(values);
                        },
                      ),
                      // Row(
                      //   children: [
                      //     sb(width: 4.w + (cubit.minprice * 42.5 / 100).w),
                      //     Text('${cubit.minprice.round()}\$'),
                      //     sb(width: (cubit.maxprice * 42.5 / 100).w),
                      //     Text('${cubit.maxprice.round()}\$')
                      //   ],
                      // ),
                      sb(height: 1.h),
                      Text(
                        "Color",
                        style: TextStyle(
                            color: const Color(0xFF7E7E7E), fontSize: 6.sp),
                      ),
                      sb(height: 1.h),
                      SizedBox(
                        height: 3.h,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => sb(width: 2.w),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: colors.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              cubit.selectFilterColor(index);
                            },
                            child: Container(
                              width: 3.h,
                              height: 3.h,
                              decoration: BoxDecoration(
                                  border: cubit.FilterColors[index]
                                      ? Border.all(color: Colors.blue, width: 2)
                                      : Border(),
                                  color: colors[index],
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                        ),
                      ),
                      sb(height: 3.h),
                      Text(
                        "Rating",
                        style: TextStyle(
                            color: const Color(0xFF7E7E7E), fontSize: 6.sp),
                      ),
                      sb(height: 1.h),
                      SizedBox(
                        height: 8.w,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => sb(width: 3.w),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              cubit.selectFilterRating(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                        color: Colors.black.withOpacity(.25))
                                  ],
                                  color: cubit.FilterRating[index]
                                      ? Color(0xFF33302E)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              width: 8.w,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: cubit.FilterRating[index]
                                          ? Colors.white
                                          : const Color(0xFF33302E),
                                      size: 3.w,
                                    ),
                                    Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color: cubit.FilterRating[index]
                                            ? Colors.white
                                            : const Color(0xFF33302E),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      sb(height: 3.h),
                      Text(
                        "Discount",
                        style: TextStyle(
                            color: const Color(0xFF7E7E7E), fontSize: 6.sp),
                      ),
                      Container(
                        height: 20.h,
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: Discount.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              cubit.selectFilterDiscount(index);
                            },
                            child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    color: cubit.FilterDiscount[index]
                                        ? Color(0xFF33302E)
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
                                  '${Discount[index]}%',
                                  style: TextStyle(
                                    color: cubit.FilterDiscount[index]
                                        ? Colors.white
                                        : const Color(0xFF33302E),
                                  ),
                                ))),
                          ),
                        ),
                      ),
                      sb(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                              onPressed: () {}, child: const Text('Reset')),
                          MaterialButton(
                              onPressed: () {},
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
      },
    );
  }
}
