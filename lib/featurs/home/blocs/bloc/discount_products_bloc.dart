import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'discount_products_event.dart';
part 'discount_products_state.dart';

class DiscountProductsBloc
    extends Bloc<DiscountProductsEvent, DiscountProductsState> {
  DiscountProductsBloc() : super(DiscountProductsInitial()) {
    on<DiscountProductsEvent>((event, emit) {
      if (event is GetDiscountProducts) {
        emit(DiscountProductsData(discountProducts: event.discountProducts));
      }
    });
  }
}
