import 'package:flutter/material.dart';
import 'package:shop_app/featurs/auth/pages/auth_page.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SteperScreen extends StatefulWidget {
  const SteperScreen({super.key});

  @override
  State<SteperScreen> createState() => _SteperScreenState();
}

class _SteperScreenState extends State<SteperScreen> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: pageController,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/splash1.png',
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Have a charming  look!',
                      style: TextStyle(
                          fontFamily: 'Tiro Gurmukhi',
                          color: Colors.white,
                          fontSize: 9.sp)),
                  const SizedBox(height: 15),
                  Text(
                      'Step into a world of timeless style and unparalleled sophistication with our application',
                      style: TextStyle(
                          fontFamily: 'Bentham',
                          color: Colors.white,
                          fontSize: 6.5.sp)),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const AuthPage(),
                          ));
                        },
                        style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5)),
                            backgroundColor: MaterialStatePropertyAll(
                                const Color(0xffB3B3B3).withOpacity(0.31))),
                        child: Text('Skip',
                            style: TextStyle(
                                fontFamily: 'Bentham',
                                color: Colors.white.withOpacity(0.73),
                                fontSize: 10.sp)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.linear);
                        },
                        style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5)),
                            backgroundColor: MaterialStatePropertyAll(
                                const Color(0xffB3B3B3).withOpacity(0.31))),
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontFamily: 'Bentham',
                              color: Colors.white.withOpacity(0.73),
                              fontSize: 10.sp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/splash2.png',
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Find your perfect style',
                      style: TextStyle(
                          fontFamily: 'Tiro Gurmukhi',
                          color: Colors.white,
                          fontSize: 9.sp)),
                  const SizedBox(height: 15),
                  Text(
                    'With a huge collection of elegant clothes, you must find what you need',
                    style: TextStyle(
                        fontFamily: 'Bentham',
                        color: Colors.white,
                        fontSize: 6.5.sp),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const AuthPage(),
                          ));
                        },
                        style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5)),
                            backgroundColor: MaterialStatePropertyAll(
                                const Color(0xffB3B3B3).withOpacity(0.31))),
                        child: Text('Let’s start',
                            style: TextStyle(
                                fontFamily: 'Bentham',
                                color: Colors.white.withOpacity(0.73),
                                fontSize: 10.sp)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
            bottom: 18.h,
            left: 43.w,
            child: SmoothPageIndicator(controller: pageController, count: 2))
      ]),
    );
  }
}
