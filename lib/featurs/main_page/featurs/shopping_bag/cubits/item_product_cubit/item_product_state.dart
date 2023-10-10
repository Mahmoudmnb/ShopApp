part of 'item_product_cubit.dart';

@immutable
sealed class ItemProductState {}

final class ItemProductInitial extends ItemProductState {}

class ItemProductAddAmount extends ItemProductState {}
class ItemProductRemoveAmount extends ItemProductState {}