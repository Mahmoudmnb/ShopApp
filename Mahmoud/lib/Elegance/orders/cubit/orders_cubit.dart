import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  static OrdersCubit get(context) => BlocProvider.of(context);
  String kindOfOrder = 'Pending';
  changeKingOfOrder(String kind) {
    kindOfOrder = kind;
    emit(ChangKindOfOrderState());
  }
}
