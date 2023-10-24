import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/data_base.dart';
import 'package:shop_app/featurs/main_page/featurs/orders/screen/orders.dart';
import 'package:shop_app/featurs/main_page/featurs/profile/screen/profile.dart';

import '../../injection.dart';
import 'cubit/main_page_cubit.dart';
import 'drawer/home_drawer.dart';
import 'data_source/data_source.dart';
import 'featurs/home/pages/home_page.dart';
import 'featurs/home/widgets/main_page_tab_bar.dart';
import 'featurs/search/pages/search_screen.dart';
import 'featurs/shopping_bag/cubits/products_cubit/products_cubit.dart';
import 'featurs/shopping_bag/screens/shopping_bag_screen.dart';

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
    final AppBar appBar = AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      leadingWidth: 150.w,
      leading: Row(
        children: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () async {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.density_medium_rounded,
                  size: 25.sp,
                )),
          ),
          SizedBox(width: 2.w),
          IconButton(
              onPressed: () async {
                await sl
                    .get<DataSource>()
                    .getAddToCartProducts()
                    .then((addToCartProducts) {
                  context.read<AddToCartCubit>().products = addToCartProducts;
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ShoppingBagScreen(),
                  ));
                });
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 25.sp,
              )),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 4.0.w),
          child: IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              MyDataBase().createAddToCartTable();
            },
          ),
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
              style: TextStyle(fontFamily: 'DM Sans', fontSize: 30.sp));
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      drawer: const Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: HomeDrawer()),
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
          const MyOrdersScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: MainPageTabBar(
        tabController: tabController,
      ),
    );
  }
}
