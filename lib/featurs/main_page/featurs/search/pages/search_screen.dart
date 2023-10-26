import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../injection.dart';
import '../../../cubit/main_page_cubit.dart';
import '../../../data_source/data_source.dart';
import '../cubit/sreach_cubit.dart';
import '../widgets/category_card.dart';
import '../widgets/end_drawer.dart';
import '../widgets/popular_search.dart';
import '../widgets/recent_search.dart';
import 'search_results_screen.dart';

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
    context.read<MainPageCubit>().changePageIndex(1);
    var cubit = SearchCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: EndDrawer(
        searchWord: searchController.text,
        fromPage: 'SearchPage',
        searchController: searchController,
      ),
      drawer: const Drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 12.w),
            child: Column(children: [
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      clipBehavior: Clip.antiAlias,
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          bool isSearch = cubit.isSearch;
                          return TextField(
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            onSubmitted: (value) async {
                              search(cubit);
                            },
                            controller: searchController,
                            onTap: () {
                              cubit.startSreaching(true);
                              cubit.getSearchHistory();
                            },
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color(0xFF9B9B9B),
                                    fontFamily: 'Tenor Sans'),
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    search(cubit);
                                  },
                                  icon: Icon(
                                    color: const Color(0xFFA4A4A4),
                                    Icons.search,
                                    size: 30.sp,
                                  ),
                                ),
                                suffixIcon: isSearch
                                    ? GestureDetector(
                                        child: const Icon(
                                          Icons.close,
                                          color: Color(0xff6C6C6C),
                                        ),
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          cubit.startSreaching(false);
                                          searchController.clear();
                                        },
                                      )
                                    : const SizedBox.shrink(),
                                fillColor: const Color(0xFFEAEAEA),
                                filled: true,
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none),
                          );
                        },
                      ),
                    ),
                  ),
                  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        cubit.openDrawer(context);
                      },
                      child: Container(
                        height: 45.h,
                        width: 45.w,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFEAEAEA),
                        ),
                        margin: const EdgeInsets.all(10),
                        child: Image(
                          image:
                              const AssetImage('assets/images/Filter_big.png'),
                          height: 27.h,
                          width: 27.h,
                        ),
                      ),
                    );
                  })
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    bool isSearch = cubit.isSearch;
                    if (state is SearchingState) {
                      isSearch = cubit.isSearch;
                    }
                    return isSearch
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 7.w),
                            child: Column(children: [
                              SizedBox(height: 15.h),
                              RecentSearch(
                                selectHistorySearch: (String selected) {
                                  searchController.text = selected;
                                },
                                cubit: cubit,
                              ),
                              SizedBox(height: 30.h),
                              PopularSearch(cubit: cubit),
                            ]),
                          )
                        : Container(
                            margin: EdgeInsets.symmetric(horizontal: 7.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Categories",
                                    style: TextStyle(
                                        color: const Color(0xFF6D6D6D),
                                        fontFamily: 'Tenor Sans',
                                        fontSize: 20.sp),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                GridView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          childAspectRatio: 0.78,
                                          crossAxisSpacing: 10.h,
                                          mainAxisSpacing: 5),
                                  children: [
                                    CategoryCard(
                                      categroyName: 'Shirt',
                                      categoryImageUrl:
                                          'assets/icons/shirt.png',
                                      searchCubit: cubit,
                                      searchWord: searchController.text,
                                    ),
                                    CategoryCard(
                                      categroyName: 'Sweaters',
                                      categoryImageUrl:
                                          'assets/icons/Sweaters.png',
                                      searchCubit: cubit,
                                      searchWord: searchController.text,
                                    ),
                                    CategoryCard(
                                      categroyName: 'T-shirts',
                                      categoryImageUrl:
                                          'assets/icons/T-shirts.png',
                                      searchCubit: cubit,
                                      searchWord: searchController.text,
                                    ),
                                    CategoryCard(
                                      categroyName: 'Jackets',
                                      categoryImageUrl:
                                          'assets/icons/Jackets.png',
                                      searchCubit: cubit,
                                      searchWord: searchController.text,
                                    ),
                                    CategoryCard(
                                      categroyName: 'Shorts',
                                      categoryImageUrl:
                                          'assets/icons/Shorts.png',
                                      searchCubit: cubit,
                                      searchWord: searchController.text,
                                    ),
                                    CategoryCard(
                                      categroyName: 'Pants',
                                      categoryImageUrl:
                                          'assets/icons/Pants.png',
                                      searchCubit: cubit,
                                      searchWord: searchController.text,
                                    ),
                                    CategoryCard(
                                      categroyName: 'Suits',
                                      categoryImageUrl:
                                          'assets/icons/Suits.png',
                                      searchCubit: cubit,
                                      searchWord: searchController.text,
                                    ),
                                    CategoryCard(
                                      categroyName: 'Sportswear',
                                      categoryImageUrl:
                                          'assets/icons/Sportswear.png',
                                      searchCubit: cubit,
                                      searchWord: searchController.text,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  "Collections",
                                  style: TextStyle(
                                      fontFamily: 'Tenor Sans',
                                      fontSize: 20.sp,
                                      color: const Color(0xFF6D6D6D)),
                                ),
                                SizedBox(height: 15.h),
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 30.h),
                                  shrinkWrap: true,
                                  itemCount: 3,
                                  itemBuilder: (context, index) => Container(
                                    height: 123.h,
                                    width: 337.w,
                                    color: const Color(0xFFD7D7D7),
                                  ),
                                )
                              ],
                            ),
                          );
                  },
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  search(SearchCubit cubit) async {
    if (searchController.text.isNotEmpty) {
      sl.get<DataSource>().setSearchHistory(searchController.text);
      List<Map<String, dynamic>> searchProduts =
          await cubit.search(searchController.text.trim());
      moveToSearchResultPage(searchProduts, cubit);
    }
  }

  moveToSearchResultPage(
      List<Map<String, dynamic>> searchProduts, SearchCubit cubit) {
    cubit.isSearch = false;
    Navigator.of(context)
        .push(MaterialPageRoute(
      builder: (context) => SearchResultScreen(
          fromPage: 'SearchPage',
          searchProducts: searchProduts,
          searchWord: searchController.text),
    ))
        .then((value) {
      if (value != null && value['searchWord'] != null) {
        searchController.text = value['searchWord'];
      }
    });
  }
}
