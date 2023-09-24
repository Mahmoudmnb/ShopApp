import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer_pro/sizer.dart';

import '../../injection.dart';
import 'data_source/data_source.dart';
import 'featurs/home/pages/home_page.dart';
import 'featurs/home/widgets/main_page_drawer.dart';
import 'featurs/home/widgets/main_page_tab_bar.dart';
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
      body: TabBarView(controller: tabController, children: [
        FutureBuilder(
          future: sl.get<DataSource>().getDiscountProducts(),
          builder: (context, snapshot) => snapshot.hasData
              ? HomePage(disCountProducts: snapshot.data!)
              : const SizedBox.shrink(),
        ),
        const SearchScreen(),
        const Center(
          child: Text('Purches'),
        ),
        const Center(
          child: Text('Profile'),
        )
      ]),
      bottomNavigationBar: MainPageTabBar(
        tabController: tabController,
      ),
      drawer: const MainPageDrawer(),
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
    title: Text(
      'Home',
      style: GoogleFonts.dmSans(fontSize: 12.sp),
    ),
  );
}
