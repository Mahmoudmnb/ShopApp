part of 'discount_products_bloc.dart';

@immutable
sealed class DiscountProductsState {}

final class DiscountProductsInitial extends DiscountProductsState {}

final class DiscountProductsData extends DiscountProductsState {
  final List<Map<String, dynamic>> discountProducts;
  DiscountProductsData({required this.discountProducts});
}

final class IsSearchState extends DiscountProductsState {
  final bool isSearch;
  IsSearchState({required this.isSearch});
}

final class SearchInDiscountResult extends DiscountProductsState {
  final List<Map<String, dynamic>> searchResult;
  SearchInDiscountResult({required this.searchResult});
}

final class AllDiscountProductState extends DiscountProductsState {
  final List<Map<String, dynamic>> allDiscountProducts;
  AllDiscountProductState({required this.allDiscountProducts});
}
