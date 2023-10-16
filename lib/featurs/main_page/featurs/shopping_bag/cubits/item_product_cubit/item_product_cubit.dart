import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'item_product_state.dart';

class ItemProductCubit extends Cubit<ItemProductState> {
  ItemProductCubit() : super(ItemProductInitial());
  int amountOfProduct = 1;
  void addAmount() {
    log('addAmount');
    if (amountOfProduct < 100) amountOfProduct++;
    emit(ItemProductAddAmount());
  }

  void removeAmount() {
    log('removeAmount');
    if (amountOfProduct > 1) amountOfProduct--;
    emit(ItemProductRemoveAmount());
  }
}
