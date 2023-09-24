import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../../injection.dart';
import '../../../data_source/data_source.dart';
import '../../home/models/product_model.dart';
import '../../products_view/cubits/product_screen/cubit.dart';
import '../../products_view/screens/product_screen.dart';
import '../cubit/sreach_cubit.dart';
import '../widgets/end_drawer.dart';

class SearchResultScreen extends StatefulWidget {
  final List<Map<String, dynamic>> searchProducts;
  final String searchWord;
  final String fromPage;
  const SearchResultScreen(
      {super.key,
      required this.fromPage,
      required this.searchProducts,
      required this.searchWord});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late TextEditingController searchController;
  late List<Map<String, dynamic>> searchProducts;
  @override
  void initState() {
    searchController = TextEditingController(text: widget.searchWord);
    searchProducts = widget.searchProducts;
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
        searchWord: searchController.text,
        fromPage: 'SearchResult',
        searchController: searchController,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(children: [
          SizedBox(
            height: 3.w,
          ),
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
                    Navigator.of(context)
                        .pop({'searchWord': searchController.text});
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                )),
              ),
              SizedBox(
                width: 4.w,
              ),
              Expanded(
                  child: TextField(
                controller: searchController,
                onSubmitted: (value) {
                  search(cubit);
                },
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                  onTap: () {
                    searchController.clear();
                  },
                  child: IconButton(
                    onPressed: () {
                      search(cubit);
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                )),
              ))
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  int length = searchProducts.length;
                  if (state is SearchResults) {
                    length = state.searchResult.length;
                  }
                  return Text(
                    "$length items founded",
                    style: TextStyle(
                        fontFamily: 'Tenor Sans',
                        color: const Color(0xFF979797),
                        fontSize: 7.sp),
                  );
                },
              ),
              const Spacer(),
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    cubit.openDrawer(context);
                  },
                  child: Image(
                    image: const AssetImage('assets/images/Filter_big.png'),
                    height: 4.h,
                  ),
                );
              }),
              SizedBox(
                width: 2.w,
              )
            ],
          ),
          SizedBox(height: 3.h),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchResults) {
                searchProducts = state.searchResult;
              }
              return Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: searchProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .5,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    ProductModel product =
                        ProductModel.fromMap(searchProducts[index]);
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
                                searchCubit: cubit,
                                fromPage: 'SearchReasults',
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
                                        color: Colors.pink,
                                        onPressed: () {
                                          cubit.setFavorateProduct(
                                              product.id, !product.isFavorite);
                                          cubit.search(searchController.text);
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
                                  style: TextStyle(
                                      fontSize: 6.sp, fontFamily: 'Tenor Sans'),
                                ),
                                const Spacer(),
                                Text(
                                  "${product.price} \$",
                                  style: TextStyle(
                                      fontFamily: 'Tenor Sans',
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
                              style: const TextStyle(
                                  fontFamily: 'Tenor Sans',
                                  color: Color(0xFF828282)),
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

  search(SearchCubit cubit) async {
    if (searchController.text.isNotEmpty) {
      sl.get<DataSource>().setSearchHistory(searchController.text);
      await cubit.search(searchController.text.trim());
    }
  }
}
