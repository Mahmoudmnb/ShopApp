import 'package:flutter/material.dart';
import 'package:sanadprojecttest/profile/screen/personal_details_screen.dart';
import 'package:sanadprojecttest/profile/screen/shopping_address.dart';
import 'package:sizer_pro/sizer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(12)),
              child: Image(
                  height: 14.h,
                  width: 14.h,
                  image: const AssetImage('assets/images/profileimage.jpg')),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "MahmoudAboAli",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: const Color(0xFFC9C9C9))),
              child: Column(children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PersonalDetails(),
                    ));
                  },
                  leading: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.all(10),
                    child: Image(
                        height: 2.h,
                        width: 2.h,
                        image: const AssetImage("assets/images/proficon.png")),
                  ),
                  title: Container(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "Personal Details",
                      style: TextStyle(
                          fontSize: 7.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ShoppingAddress(),
                    ));
                  },
                  leading: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.all(10),
                    child: Image(
                        height: 2.h,
                        width: 2.h,
                        image: const AssetImage("assets/images/Frame.png")),
                  ),
                  title: Container(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "Shipping Address",
                      style: TextStyle(
                          fontSize: 7.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.all(10),
                    child: Image(
                        height: 2.h,
                        width: 2.h,
                        image: const AssetImage("assets/images/card.png")),
                  ),
                  title: Container(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "My Card",
                      style: TextStyle(
                          fontSize: 7.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.all(10),
                    child: Image(
                        height: 2.h,
                        width: 2.h,
                        image: const AssetImage("assets/images/bag.png")),
                  ),
                  title: Container(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "My Order",
                      style: TextStyle(
                          fontSize: 7.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.all(10),
                    child: Image(
                        height: 2.h,
                        width: 2.h,
                        image: const AssetImage(
                            "assets/images/Favorite_fill.png")),
                  ),
                  title: Container(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "My Wishlist",
                      style: TextStyle(
                          fontSize: 7.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.all(10),
                    child: Image(
                        height: 2.h,
                        width: 2.h,
                        image: const AssetImage("assets/images/star.png")),
                  ),
                  title: Container(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "Rate this app",
                      style: TextStyle(
                          fontSize: 7.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Log Out",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "DM Sans"),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
          ]),
        ),
      ),
    );
  }
}
