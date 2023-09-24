part of 'discount_products_bloc.dart';

@immutable
sealed class DiscountProductsState {}

final class DiscountProductsInitial extends DiscountProductsState {}

final class DiscountProductsData extends DiscountProductsState {
  final List<Map<String, dynamic>> discountProducts;
  DiscountProductsData({required this.discountProducts});
}
