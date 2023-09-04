import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/featurs/home/pages/home_pages.dart';
import 'package:shop_app/featurs/home/widgets/home_widgets.dart';
import 'package:sizer_pro/sizer.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leadingWidth: 20.w,
        leading: Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
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
      ),
      body: TabBarView(controller: tabController, children: const [
        HomePage(),
        Center(
          child: Text('Search'),
        ),
        Center(
          child: Text('Purches'),
        ),
        Center(
          child: Text('Profile'),
        )
      ]),
      bottomSheet: MainPageTabBar(
        tabController: tabController,
      ),
      drawer: const MainPageDrawer(),
    );
  }
}
