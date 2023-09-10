import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';

import 'cubit/sreach_cubit.dart';

class SearchResultScreen extends StatefulWidget {
  final List<Map<String, dynamic>> rearchResult;
  const SearchResultScreen({super.key, required this.rearchResult});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late TextEditingController searchCon;
  @override
  void initState() {
    searchCon = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // var cubit = SearchCubit.get(context);
        // TextEditingController controller = cubit.SearchController;
        return SafeArea(
            child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.h,
                    padding: EdgeInsets.only(left: 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, .2),
                              blurRadius: .4,
                              color: Colors.black)
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
                    width: 20.w,
                  ),
                  Expanded(
                      child: TextField(
                    controller: searchCon,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                      onTap: () {
                        searchCon.clear();
                      },
                      child: Icon(
                        Icons.search,
                        size: 25.w,
                      ),
                    )),
                  ))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 53.w,
                  ),
                  const Text(
                    "150 items founded",
                    style: TextStyle(color: Color(0xFF979797), fontSize: 18),
                  ),
                  const Spacer(),
                  const Icon(Icons.compare_arrows_rounded)
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  // shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .42.h,
                    crossAxisSpacing: 20.w,
                    // mainAxisSpacing: 20.w
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(boxShadow: const [
                          BoxShadow(
                              offset: Offset(0.1, 5),
                              color: Colors.black54,
                              blurRadius: 4)
                        ], borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          alignment: const Alignment(.80, -.89),
                          children: [
                            Image.asset(
                              "assest/images/Stepper3.jpg",
                              fit: BoxFit.cover,
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
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Zara",
                            style: TextStyle(fontSize: 20.w),
                          ),
                          const Spacer(),
                          const Text(
                            "50.00\$",
                            style: TextStyle(color: Color(0xFFD57676)),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Supply Havana Suit",
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
