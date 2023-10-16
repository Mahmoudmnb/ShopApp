import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDetails extends StatefulWidget {
  PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController PhoneNameController = TextEditingController();
  TextEditingController EmailNameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    FirstNameController.dispose();
    LastNameController.dispose();
    EmailNameController.dispose();
    PhoneNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
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
                  width: 8.w,
                ),
                Text(
                  "Personal Details",
                  style: TextStyle(fontSize: 18.sp, fontFamily: 'Tenor Sans'),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
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
                          height: 130.h,
                          width: 130.h,
                          image: const AssetImage(
                              'assets/images/profileimage.jpg')),
                    ),
                    Container(
                      height: 40.h,
                      width: 40.h,
                      padding: EdgeInsets.only(top: 8.h),
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
                      child: const Image(
                          image: AssetImage("assets/images/Pen.png")),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: 80.h,
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
                  padding: EdgeInsets.only(right: 16.w),
                  child: TextField(
                    controller: FirstNameController,
                  ),
                )),
                Expanded(
                    child: TextField(
                  controller: LastNameController,
                )),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              width: double.infinity,
              child: const Text(
                "Email",
                textAlign: TextAlign.start,
                style:
                    TextStyle(color: Color(0xFFA5A5A5), fontFamily: 'DM Sans'),
              ),
            ),
            Container(
                child: TextField(
              controller: EmailNameController,
            )),
            SizedBox(
              height: 80.h,
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
                  padding: EdgeInsets.only(right: 16.w),
                  child: const TextField(),
                )),
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration:
                      const InputDecoration(hintText: '(+963)922222222'),
                  controller: PhoneNameController,
                )),
              ],
            ),
            SizedBox(
              height: 80.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 13.h),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Save",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
