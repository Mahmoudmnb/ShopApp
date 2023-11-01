import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/featurs/main_page/featurs/check_out/cubit/check_out_cubit.dart';

class AddCardForPayming extends StatefulWidget {
  const AddCardForPayming({super.key});

  @override
  State<AddCardForPayming> createState() => _AddCardForPaymingState();
}

class _AddCardForPaymingState extends State<AddCardForPayming> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        buildTextFeild(nameController, 'Name on card'),
        buildTextFeild(numberController, 'Card bumber'),
        buildTextFeild(expiryController, 'Expiry (MM/YY)'),
        buildTextFeild(cvvController, 'CVV'),
        BlocConsumer<CheckOutCubit, CheckOutState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = CheckOutCubit.get(context);
            return Row(
              children: [
                Checkbox(
                    side: const BorderSide(width: 1),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    value: cubit.saveCard,
                    onChanged: (value) {
                      cubit.savingCard(value!);
                    }),
                Text(
                  "Save card details for later",
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            );
          },
        )
      ],
    );
  }

  Widget buildTextFeild(TextEditingController controller, String title) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
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
