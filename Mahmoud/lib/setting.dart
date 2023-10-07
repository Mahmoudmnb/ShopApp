import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.h),
        child: Column(children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image(
                    height: 11.w,
                    width: 11.w,
                    image: const AssetImage("assets/images/backicon.png"),
                  )),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "Setting",
                style: TextStyle(fontSize: 10.sp, fontFamily: 'Tenor Sans'),
              )
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          buildListTile(
              title: 'Language',
              url: "assets/images/language.png",
              ontap: () {}),
          buildListTile(
              title: 'Terms of Use',
              url: "assets/images/terms.png",
              ontap: () {}),
          buildListTile(
              title: 'Pricavy Policy',
              url: "assets/images/policy.png",
              ontap: () {}),
          buildListTile(
              title: 'Chat support',
              url: "assets/images/support.png",
              ontap: () {}),
        ]),
      ),
    );
  }

  Widget buildListTile(
      {required String title, required String url, required Function ontap}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        children: [
          Image(height: 4.h, width: 4.h, image: AssetImage(url)),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 7.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        ],
      ),
    );
  }
}
