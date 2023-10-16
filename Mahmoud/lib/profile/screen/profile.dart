import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanadprojecttest/Elegance/orders/screen/orders.dart';
import 'package:sanadprojecttest/profile/screen/personal_details_screen.dart';
import 'package:sanadprojecttest/profile/screen/shopping_address.dart';

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
              height: 80.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(12)),
              child: Image(
                  height: 100.h,
                  width: 100.h,
                  image: const AssetImage('assets/images/profileimage.jpg')),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "MahmoudAboAli",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              padding: EdgeInsets.symmetric(vertical: 15.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: const Color(0xFFC9C9C9))),
              child: Column(children: [
                BuildListTile(
                  context,
                  "assets/images/proficon.png",
                  "Personal Details",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PersonalDetails(),
                    ));
                  },
                ),
                BuildListTile(
                  context,
                  "assets/images/Frame.png",
                  "Shopping Address",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ShoppingAddress(),
                    ));
                  },
                ),
                BuildListTile(
                  context,
                  "assets/images/card.png",
                  "My Card",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ShoppingAddress(),
                    ));
                  },
                ),
                BuildListTile(
                  context,
                  "assets/images/bag.png",
                  "My Order",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyOrders(),
                    ));
                  },
                ),
                BuildListTile(
                  context,
                  "assets/images/Favorite_fill.png",
                  "My Wishlist",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyOrders(),
                    ));
                  },
                ),
                BuildListTile(
                  context,
                  "assets/images/star.png",
                  "Rate this app",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyOrders(),
                    ));
                  },
                ),
              ]),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15.h),
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
              height: 12.h,
            ),
          ]),
        ),
      ),
    );
  }

  Widget BuildListTile(
      BuildContext context, String url, String title, Function() ontap) {
    return ListTile(
      onTap: ontap,
      leading: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFECECEC),
            borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.all(10),
        child: Image(height: 15.h, width: 15.h, image: AssetImage(url)),
      ),
      title: Container(
        padding: EdgeInsets.only(left: 20.w),
        child: Text(
          title,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
    );
  }
}
