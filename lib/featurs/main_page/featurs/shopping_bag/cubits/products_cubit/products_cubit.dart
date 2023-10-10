import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/product_item.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  List<ProductItem> list = [
    const ProductItem(
      title: 'Flyday shirt1',
      brand: 'Zara',
      color: Color(0xFF44565C),
      amountOfProduct: 2,
      price: 34,
      size: 'L',
    ),
    const ProductItem(
      title: 'Flyday shirt2',
      brand: 'Zara',
      color: Color(0xFF44565C),
      amountOfProduct: 2,
      price: 34,
      size: 'L',
    ),
    const ProductItem(
      title: 'Flyday shirt3',
      brand: 'Zara',
      color: Color(0xFF44565C),
      amountOfProduct: 2,
      price: 34,
      size: 'L',
    ),
    const ProductItem(
      title: 'Flyday shirt4',
      brand: 'Zara',
      color: Color(0xFF44565C),
      amountOfProduct: 2,
      price: 34,
      size: 'L',
    ),
    const ProductItem(
      title: 'Flyday shirt5',
      brand: 'Zara',
      color: Color(0xFF44565C),
      amountOfProduct: 2,
      price: 34,
      size: 'L',
    ),
    const ProductItem(
      title: 'Flyday shirt7',
      brand: 'Zara',
      color: Color(0xFF44565C),
      amountOfProduct: 2,
      price: 34,
      size: 'L',
    ),
  ];

  void removeElement(int index) {
    list.removeAt(index);
    emit(ProductsRemoveElement());
  }

  void addElement(ProductItem item) {
    list.add(item);
    emit(ProductsAddElement());
  }

  void fetchData() {
    emit(ProductsFetchData());
  }
}
