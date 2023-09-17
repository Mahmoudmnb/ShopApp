import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class MainPageTabBar extends StatelessWidget {
  final TabController tabController;
  const MainPageTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: TabBar(
          padding: const EdgeInsets.all(5),
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.transparent,
          labelColor: Colors.black,
          controller: tabController,
          tabs: const [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(Icons.shopping_basket_rounded),
            Icon(Icons.person)
          ]),
    );
  }
}
