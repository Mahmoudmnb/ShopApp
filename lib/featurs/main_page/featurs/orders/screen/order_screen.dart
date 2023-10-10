import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubit/main_page_cubit.dart';
import '../cubit/orders_cubit.dart';
import '../model/card_model.dart';
import '../widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    OrdersCubit ordersCubit = OrdersCubit.get(context);
    context.read<MainPageCubit>().changePageIndex(2);

    List<CardModel> pending = [
      CardModel(
          isDelevered: false,
          quantity: 2,
          subtotal: 40,
          trackingNumber: 'lskfdlsj',
          orderNumber: '1580',
          orderDate: Constant.dateToString(DateTime(2023, 9, 2)),
          dueDate: Constant.dateToString(DateTime(2023, 9, 20))),
      CardModel(
          isDelevered: false,
          quantity: 2,
          subtotal: 40,
          trackingNumber: 'lskfdlsj',
          orderNumber: '1580',
          orderDate: Constant.dateToString(DateTime(2023, 9, 2)),
          dueDate: Constant.dateToString(DateTime(2023, 9, 20))),
      CardModel(
          isDelevered: false,
          quantity: 2,
          subtotal: 40,
          trackingNumber: 'lskfdlsj',
          orderNumber: '1580',
          orderDate: Constant.dateToString(DateTime(2023, 9, 2)),
          dueDate: Constant.dateToString(DateTime(2023, 9, 20)))
    ];
    List<CardModel> delivered = [
      CardModel(
          isDelevered: true,
          quantity: 2,
          subtotal: 40,
          trackingNumber: 'lskfdlsj',
          orderNumber: '1580',
          orderDate: Constant.dateToString(DateTime(2023, 9, 2)),
          dueDate: Constant.dateToString(DateTime(2023, 9, 20))),
      CardModel(
          isDelevered: true,
          quantity: 2,
          subtotal: 40,
          trackingNumber: 'lskfdlsj',
          orderNumber: '1580',
          orderDate: Constant.dateToString(DateTime(2023, 9, 2)),
          dueDate: Constant.dateToString(DateTime(2023, 9, 20))),
      CardModel(
          isDelevered: true,
          quantity: 2,
          subtotal: 40,
          trackingNumber: 'lskfdlsj',
          orderNumber: '1580',
          orderDate: Constant.dateToString(DateTime(2023, 9, 2)),
          dueDate: Constant.dateToString(DateTime(2023, 9, 20))),
      CardModel(
          isDelevered: true,
          quantity: 2,
          subtotal: 40,
          trackingNumber: 'lskfdlsj',
          orderNumber: '1580',
          orderDate: Constant.dateToString(DateTime(2023, 9, 2)),
          dueDate: Constant.dateToString(DateTime(2023, 9, 20))),
    ];
    return Scaffold(
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  children: [
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ordersCubit.changeKingOfOrder('Pending');
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 1.h),
                            width: 44.w,
                            decoration: BoxDecoration(
                                border: ordersCubit.kindOfOrder == "Pending"
                                    ? const Border(
                                        bottom: BorderSide(
                                            color: Color(0xFF3D3D3D), width: 1))
                                    : const Border()),
                            child: Text(
                              "Pending",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "DM Sans",
                                  fontSize: 10.sp,
                                  color: ordersCubit.kindOfOrder == "Pending"
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
                            ordersCubit.changeKingOfOrder('Delivered');
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 1.h),
                            width: 44.w,
                            decoration: BoxDecoration(
                                border: ordersCubit.kindOfOrder == "Delivered"
                                    ? const Border(
                                        bottom: BorderSide(
                                            color: Color(0xFF3D3D3D), width: 1))
                                    : const Border()),
                            child: Text(
                              "Delivered",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "DM Sans",
                                  fontSize: 10.sp,
                                  color: ordersCubit.kindOfOrder == "Delivered"
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
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 2.h,
                    ),
                    // shrinkWrap: true,
                    itemCount: ordersCubit.kindOfOrder == "Pending"
                        ? pending.length
                        : delivered.length,
                    itemBuilder: (context, index) => BuildOrderCard(
                        card: ordersCubit.kindOfOrder == "Pending"
                            ? pending[index]
                            : delivered[index]),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
