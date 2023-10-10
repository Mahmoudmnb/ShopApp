part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsRemoveElement extends ProductsState {}

class ProductsAddElement extends ProductsState {}

class ProductsFetchData extends ProductsState {}
