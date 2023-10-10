import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../injection.dart';
import 'cubit/main_page_cubit.dart';
import 'data_source/data_source.dart';
import 'featurs/home/pages/home_page.dart';
import 'featurs/home/widgets/main_page_tab_bar.dart';
import 'featurs/orders/screen/order_screen.dart';
import 'featurs/profile/profile/screen/profile_screen.dart';
import 'featurs/search/pages/search_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar,
      body: TabBarView(
        controller: tabController,
        children: [
          FutureBuilder(
            future: sl.get<DataSource>().getDiscountsProducts(),
            builder: (context, snapshot) => snapshot.hasData
                ? HomePage(disCountProducts: snapshot.data!)
                : const SizedBox.shrink(),
          ),
          const SearchScreen(),
          const OrdersScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: MainPageTabBar(
        tabController: tabController,
      ),
    );
  }

  final AppBar _appBar = AppBar(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    leadingWidth: 25.w,
    leading: Row(
      children: [
        Builder(
          builder: (context) => IconButton(
              onPressed: () async {
                log(MediaQuery.of(context).textScaleFactor.toString());
                // Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.density_medium_rounded)),
        ),
        SizedBox(width: 2.w),
        const Icon(Icons.shopping_cart_outlined),
      ],
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 4.0.w),
        child: const Icon(Icons.favorite_border),
      )
    ],
    centerTitle: true,
    title: BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        int pageIndex = context.read<MainPageCubit>().pageIndex;
        return Text(
            pageIndex == 0
                ? 'Home'
                : pageIndex == 1
                    ? 'Discover'
                    : pageIndex == 2
                        ? 'My Orders'
                        : 'profile',
            style: TextStyle(
                fontFamily: 'DM Sans',
                fontSize: MediaQuery.of(context).textScaleFactor * 30));
      },
    ),
  );
}
