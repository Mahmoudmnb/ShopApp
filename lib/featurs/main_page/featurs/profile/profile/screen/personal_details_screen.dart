import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailNameController.dispose();
    phoneNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
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
                  "Personal Details",
                  style: TextStyle(fontSize: 10.sp, fontFamily: 'Tenor Sans'),
                )
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                const Spacer(),
                Stack(
                  alignment: const Alignment(1.2, 1.2),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                      child: Image(
                          height: 16.h,
                          width: 16.h,
                          image: const AssetImage(
                              'assets/images/profileimage.jpg')),
                    ),
                    Container(
                      height: 6.h,
                      width: 6.h,
                      padding: EdgeInsets.only(top: 1.h),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              color: Colors.black.withOpacity(.25),
                              blurRadius: 4,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image(
                          height: 6.h,
                          width: 6.h,
                          image: const AssetImage("assets/images/Pen.png")),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Row(
              children: [
                Expanded(
                    child: Text(
                  "First Name",
                  style: TextStyle(
                      color: Color(0xFFA5A5A5), fontFamily: 'DM Sans'),
                )),
                Expanded(
                    child: Text(
                  "Last Name",
                  style: TextStyle(
                      color: Color(0xFFA5A5A5), fontFamily: 'DM Sans'),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(right: 4.w),
                  child: TextField(
                    controller: firstNameController,
                  ),
                )),
                Expanded(
                    child: TextField(
                  controller: lastNameController,
                )),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Email",
                textAlign: TextAlign.start,
                style:
                    TextStyle(color: Color(0xFFA5A5A5), fontFamily: 'DM Sans'),
              ),
            ),
            TextField(
              controller: emailNameController,
            ),
            SizedBox(
              height: 10.h,
            ),
            const Row(
              children: [
                Expanded(
                    child: Text(
                  "Gender",
                  style: TextStyle(
                      color: Color(0xFFA5A5A5), fontFamily: 'DM Sans'),
                )),
                Expanded(
                    child: Text(
                  "Phone",
                  style: TextStyle(
                      color: Color(0xFFA5A5A5), fontFamily: 'DM Sans'),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(right: 4.w),
                  child: const TextField(),
                )),
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration:
                      const InputDecoration(hintText: '(+963)922222222'),
                  controller: phoneNameController,
                )),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 1.6.h),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Save",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 8.sp),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
