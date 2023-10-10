import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/sreach_cubit.dart';

class PopularSearch extends StatelessWidget {
  final SearchCubit cubit;
  const PopularSearch({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            "Popular search",
            style: TextStyle(
                color: const Color(0xFF888888),
                fontSize: 8.sp,
                fontFamily: 'DM Sans'),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
      ],
    );
  }
}
