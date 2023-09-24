import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';

import '../cubit/sreach_cubit.dart';
import '../pages/category_view_page.dart';

class CategoryCard extends StatelessWidget {
  final String categroyName;
  final String categoryImageUrl;
  final SearchCubit searchCubit;
  final String searchWord;
  const CategoryCard(
      {super.key,
      required this.searchCubit,
      required this.categoryImageUrl,
      required this.searchWord,
      required this.categroyName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        searchCubit.selectedCategory = categroyName.toLowerCase();
        context
            .read<SearchCubit>()
            .searchInCategory(null, categroyName.toLowerCase())
            .then((value) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryViewPage(
                searchWord: searchWord,
                categoryProducts: value,
                categoryName: categroyName),
          ));
        });
      },
      child: Column(
        children: [
          Container(
            width: 17.w,
            height: 17.w,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF3D3D3D), width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(categoryImageUrl),
          ),
          SizedBox(height: 1.h),
          Expanded(
            child: Text(
              categroyName,
              style: TextStyle(fontSize: 4.2.sp,fontFamily: 'Tenor Sans'),
            ),
          ),
        ],
      ),
    );
  }
}
