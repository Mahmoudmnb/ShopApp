import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/featurs/home/data_source/data_source.dart';
import 'package:shop_app/injection.dart';
import 'package:sizer_pro/sizer.dart';

import 'cubit/sreach_cubit.dart';
import 'end_drawer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return Scaffold(
          endDrawer: const EndDrawer(),
          drawer: const Drawer(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 30),
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
                            print('submiteed');
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => const SearchResultScreen(),
                            // ));
                          },
                          controller: searchController,
                          onTap: () {
                            cubit.startSreaching(true);
                          },
                          decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle:
                                  const TextStyle(color: Color(0xFF9B9B9B)),
                              prefixIcon: IconButton(
                                onPressed: () async {
                                  
                                  // if (searchController.text.isNotEmpty) {
                                  //   List<Map<String, dynamic>> searchProduts =
                                  //       await sl
                                  //           .get<DataSource>()
                                  //           .searchProducts(
                                  //               searchController.text.trim());
                                  //   print(searchProduts);
                                  // }
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) =>
                                  //       SearchResultScreen(rearchResult: data),
                                  // ));
                                },
                                icon: const Icon(
                                  color: Color(0xFFA4A4A4),
                                  Icons.search,
                                  size: 25,
                                ),
                              ),
                              suffixIcon: cubit.Sreach
                                  ? GestureDetector(
                                      child: const Icon(Icons.close),
                                      onTap: () {
                                        cubit.startSreaching(false);
                                        searchController.clear();
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
                          margin: const EdgeInsets.all(10),
                          child: const Image(
                              image:
                                  AssetImage('assets/images/filter_big.jpg')),
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
                          SizedBox(
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
                          SizedBox(
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
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: .4.h,
                                    crossAxisSpacing: 3.w,
                                    mainAxisSpacing: 1.h),
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
                            SizedBox(
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
                                      childAspectRatio: 0.78,
                                      crossAxisSpacing: 3.h,
                                      mainAxisSpacing: 20),
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(20),
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
                                  const Text("Shirts"),
                                ],
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
