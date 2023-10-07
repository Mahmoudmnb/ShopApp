import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanadprojecttest/Elegance/search_results_screen.dart';
import 'package:sizer_pro/sizer.dart';

import 'cubit/sreach_cubit.dart';
import 'end_drawer.dart';

class Search1 extends StatelessWidget {
  const Search1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        TextEditingController searchcontroller = cubit.SearchController;
        return Scaffold(
          endDrawer: const EndDrawer(),
          drawer: const Drawer(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.menu,
                            size: 7.w,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            size: 8.w,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "Discover",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12.sp),
                      )),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Icon(Icons.favorite)),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Container(
                        height: 6.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        clipBehavior: Clip.antiAlias,
                        child: TextField(
                          onSubmitted: (value) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SearchResultScreen(),
                            ));
                          },
                          controller: searchcontroller,
                          onTap: () {
                            cubit.StartSreaching(true);
                          },
                          decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle:
                                  const TextStyle(color: Color(0xFF9B9B9B)),
                              prefixIcon: const Icon(
                                color: Color(0xFFA4A4A4),
                                Icons.search,
                                size: 25,
                              ),
                              suffixIcon: cubit.Sreach
                                  ? GestureDetector(
                                      child: const Icon(Icons.close),
                                      onTap: () {
                                        cubit.StartSreaching(false);
                                        searchcontroller.clear();
                                      },
                                    )
                                  : Container(),
                              fillColor: const Color(0xFFEAEAEA),
                              filled: true,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          cubit.openDrawer(context);
                        },
                        child: Container(
                          height: 6.h,
                          padding: const EdgeInsets.all(10),
                          color: const Color(0xFFEAEAEA),
                          child: const Image(
                              image:
                                  AssetImage('assets/images/Filter_big.png')),
                          margin: const EdgeInsets.all(10),
                        ),
                      );
                    })
                  ],
                ),
                cubit.Sreach
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Column(children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              "Recent search",
                              style: TextStyle(
                                  color: const Color(0xFF888888),
                                  fontSize: 10.sp),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 2.h,
                            ),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    color: Color(0xFFF0EFEF),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Suits",
                                    style: TextStyle(color: Color(0xFF515151)),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                      onTap: () {},
                                      child: const Icon(Icons.close))
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              "Popular search",
                              style: TextStyle(
                                  color: const Color(0xFF888888),
                                  fontSize: 10.sp),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 6,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF0EFEF),
                                  borderRadius: BorderRadius.circular(3)),
                              child: const Center(child: Text("Trendy")),
                            ),
                          ),
                        ]),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              width: double.infinity,
                              child: Text(
                                "Categories",
                                style: TextStyle(
                                    color: const Color(0xFF6D6D6D),
                                    fontSize: 12.sp),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 8,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      childAspectRatio: .75,
                                      crossAxisSpacing: 3.w,
                                      mainAxisSpacing: 3.w),
                              itemBuilder: (context, index) => SizedBox(
                                height: 12.h,
                                width: 9.h,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 9.h,
                                      width: 9.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFF3D3D3D),
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(Icons.insert_emoticon),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    SizedBox(
                                        height: 3.h,
                                        child: const Text("Shirts")),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Collections",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF6D6D6D)),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 30,
                              ),
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) => Container(
                                height: 100,
                                width: double.infinity,
                                color: const Color(0xFFD7D7D7),
                              ),
                            )
                          ],
                        ),
                      ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
