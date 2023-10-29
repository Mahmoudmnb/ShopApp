import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNuberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController addressNameController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNuberController.dispose();
    emailAddressController.dispose();
    addressNameController.dispose();
    postalCodeController.dispose();
    cityController.dispose();
    countryController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 60.h),
        child: Column(children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image(
                    height: 40.w,
                    width: 40.w,
                    image: const AssetImage("assets/images/backicon.png"),
                  )),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Add New Address",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'Tenor Sans',
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Expanded(
              child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              buildTextFeild('FirstName', firstNameController),
              buildTextFeild('LastName', lastNameController),
              buildTextFeild('Phone Number', phoneNuberController),
              buildTextFeild('Email Address', emailAddressController),
              buildTextFeild('Address Name', addressNameController),
              buildTextFeild('Postal code', postalCodeController),
              buildTextFeild('City', cityController),
              buildTextFeild('Country', countryController),
              buildTextFeild('Address', addressController),
            ],
          )),
          Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15.h),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Add new address",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "DM Sans"),
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildTextFeild(String title, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      height: 50.h,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            label: Text(title),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
