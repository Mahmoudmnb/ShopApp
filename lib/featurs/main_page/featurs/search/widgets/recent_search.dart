import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../../injection.dart';
import '../../../data_source/data_source.dart';
import '../cubit/sreach_cubit.dart';

class RecentSearch extends StatelessWidget {
  final SearchCubit cubit;
  final Function(String selected) selectHistorySearch;
  RecentSearch(
      {super.key, required this.cubit, required this.selectHistorySearch}) {
    cubit.getSearchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            "Recent search",
            style: TextStyle(color: const Color(0xFF888888), fontSize: 8.sp),
          ),
        ),
        SizedBox(height: 3.h),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            List<Map<String, dynamic>> searchHistory = cubit.searchHistory;

            if (state is SearchHistory) {
              searchHistory = cubit.searchHistory;
            }
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                height: 2.h,
              ),
              shrinkWrap: true,
              itemCount: searchHistory.length < 3 ? searchHistory.length : 3,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    selectHistorySearch(searchHistory[index]['word']);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Color(0xFFF0EFEF),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        searchHistory[index]['word'],
                        style: const TextStyle(color: Color(0xFF515151)),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            sl.get<DataSource>().deleteWordFormSearchHistory(
                                searchHistory[index]['word']);
                            cubit.getSearchHistory();
                          },
                          child: const Icon(Icons.close))
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
