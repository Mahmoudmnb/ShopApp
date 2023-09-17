part of 'discount_products_bloc.dart';

@immutable
sealed class DiscountProductsEvent {}

class GetDiscountProducts extends DiscountProductsEvent {
  final List<Map<String, dynamic>> discountProducts;
  GetDiscountProducts({required this.discountProducts});
}
