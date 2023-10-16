import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanadprojecttest/Elegance/orders/cubit/orders_cubit.dart';
import 'package:sanadprojecttest/Elegance/orders/widgets/order_card.dart';

import '../model/card_model.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});
  @override
  Widget build(BuildContext context) {
    List<CardModel> Pending = [
      CardModel(
          KingOfOrder: 'Pending',
          Quantity: 2,
          Subtotal: 40,
          TrackingNumber: 'lskfdlsj',
          numb: '1580',
          orderDate: DateTime(2023, 9, 2),
          dueDate: DateTime(2023, 9, 20)),
      CardModel(
          KingOfOrder: 'Pending',
          Quantity: 2,
          Subtotal: 40,
          TrackingNumber: 'lskfdlsj',
          numb: '1580',
          orderDate: DateTime(2023, 9, 2),
          dueDate: DateTime(2023, 9, 20)),
      CardModel(
          KingOfOrder: 'Pending',
          Quantity: 2,
          Subtotal: 40,
          TrackingNumber: 'lskfdlsj',
          numb: '1580',
          orderDate: DateTime(2023, 9, 2),
          dueDate: DateTime(2023, 9, 20))
    ];
    List<CardModel> Delivered = [
      CardModel(
          KingOfOrder: 'Delivered',
          Quantity: 2,
          Subtotal: 40,
          TrackingNumber: 'lskfdlsj',
          numb: '1580',
          orderDate: DateTime(2023, 9, 2),
          dueDate: DateTime(2023, 9, 20)),
      CardModel(
          KingOfOrder: 'Delivered',
          Quantity: 2,
          Subtotal: 40,
          TrackingNumber: 'lskfdlsj',
          numb: '1580',
          orderDate: DateTime(2023, 9, 2),
          dueDate: DateTime(2023, 9, 20)),
      CardModel(
          KingOfOrder: 'Delivered',
          Quantity: 2,
          Subtotal: 40,
          TrackingNumber: 'lskfdlsj',
          numb: '1580',
          orderDate: DateTime(2023, 9, 2),
          dueDate: DateTime(2023, 9, 20)),
      CardModel(
          KingOfOrder: 'Delivered',
          Quantity: 2,
          Subtotal: 40,
          TrackingNumber: 'lskfdlsj',
          numb: '1580',
          orderDate: DateTime(2023, 9, 2),
          dueDate: DateTime(2023, 9, 20)),
    ];
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OrdersCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 18.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.h),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.menu,
                          size: 25.w,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 25.w,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      "My Orders",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.sp),
                    )),
                    SizedBox(
                      width: 40.w,
                    ),
                    GestureDetector(
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.favorite)),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    const Divider(),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            cubit.changeKingOfOrder('Pending');
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.h),
                            width: 150.w,
                            decoration: BoxDecoration(
                                border: cubit.kindOfOrder == "Pending"
                                    ? const Border(
                                        bottom: BorderSide(
                                            color: Color(0xFF3D3D3D), width: 1))
                                    : const Border()),
                            child: Text(
                              "Pending",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "DM Sans",
                                  fontSize: 18.sp,
                                  color: cubit.kindOfOrder == "Pending"
                                      ? const Color(0xFF3D3D3D)
                                      : const Color(0xFF9B9B9B),
                                  shadows: [
                                    Shadow(
                                        offset: const Offset(0, 4),
                                        blurRadius: 4,
                                        color: Colors.black.withOpacity(.25))
                                  ]),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            cubit.changeKingOfOrder('Delivered');
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.h),
                            width: 150.w,
                            decoration: BoxDecoration(
                                border: cubit.kindOfOrder == "Delivered"
                                    ? const Border(
                                        bottom: BorderSide(
                                            color: Color(0xFF3D3D3D), width: 1))
                                    : const Border()),
                            child: Text(
                              "Delivered",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "DM Sans",
                                  fontSize: 18.sp,
                                  color: cubit.kindOfOrder == "Delivered"
                                      ? const Color(0xFF3D3D3D)
                                      : const Color(0xFF9B9B9B),
                                  shadows: [
                                    Shadow(
                                        offset: const Offset(0, 4),
                                        blurRadius: 4,
                                        color: Colors.black.withOpacity(.25))
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15.h,
                    ),
                    // shrinkWrap: true,
                    itemCount: cubit.kindOfOrder == "Pending"
                        ? Pending.length
                        : Delivered.length,
                    itemBuilder: (context, index) => BuildOrderCard(
                        card: cubit.kindOfOrder == "Pending"
                            ? Pending[index]
                            : Delivered[index]),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
