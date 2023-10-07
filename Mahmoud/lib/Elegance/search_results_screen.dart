import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanadprojecttest/Elegance/end_drawer.dart';
import 'package:sizer_pro/sizer.dart';

import 'cubit/sreach_cubit.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        TextEditingController controller = cubit.SearchController;
        return SafeArea(
            child: Scaffold(
          endDrawer: EndDrawer(),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(children: [
              SizedBox(
                height: 3.w,
              ),
              Row(
                children: [
                  Container(
                    height: 6.w,
                    width: 6.w,
                    padding: EdgeInsets.only(left: 1.5.w),
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
                        Navigator.of(context).pop();
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
                    controller: controller,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                      onTap: () {
                        controller.clear();
                      },
                      child: const Icon(
                        Icons.search,
                      ),
                    )),
                  ))
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "150 items founded",
                    style: TextStyle(
                        color: const Color(0xFF979797), fontSize: 8.sp),
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
              SizedBox(
                height: 3.h,
              ),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  // shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .5,
                    crossAxisSpacing: 20,
                    // mainAxisSpacing: 20.w
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            color: index % 2 == 1 ? Colors.orange : Colors.blue,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 4),
                                  color: Colors.black.withOpacity(.25),
                                  blurRadius: 2)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          alignment: const Alignment(.80, -.89),
                          children: [
                            Image.asset(
                              "assets/images/man.png",
                              fit: BoxFit.cover,
                              height: 40.h,
                              width: 25.h,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  color: Colors.pink,
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 5.h,
                        child: const Row(
                          children: [
                            Text(
                              "Zara",
                              style: TextStyle(fontSize: 20),
                            ),
                            Spacer(),
                            Text(
                              "50.00\$",
                              style: TextStyle(color: Color(0xFFD57676)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                        width: double.infinity,
                        child: const Text(
                          "Supply Havana Suit",
                          maxLines: 1,
                          style: TextStyle(color: Color(0xFF828282)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
      },
    );
  }
}
