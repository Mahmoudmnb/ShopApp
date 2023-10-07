import 'package:flutter/material.dart';
import 'package:sanadprojecttest/profile/model/shopping_address_model.dart';
import 'package:sanadprojecttest/profile/widgets/shopping_address_card.dart';
import 'package:sizer_pro/sizer.dart';

class ShoppingAddress extends StatelessWidget {
  ShoppingAddress({super.key});
  @override
  Widget build(BuildContext context) {
    List addressInfo = [
      shoppingAddressModel(
          title: 'My Home', description: " 123 Building, Main Street"),
      shoppingAddressModel(
          title: 'My Office', description: " 123 Building, Main Street"),
    ];
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.h),
            child: Column(
              children: [
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
                      "Shopping Address",
                      style:
                          TextStyle(fontSize: 10.sp, fontFamily: 'Tenor Sans'),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 2.h,
                    ),
                    itemCount: addressInfo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ShoppingAddressCard(
                          title: addressInfo[index].title,
                          description: addressInfo[index].description);
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 1.6.h),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Add new address",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 8.sp),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                )
              ],
            )));
  }
}