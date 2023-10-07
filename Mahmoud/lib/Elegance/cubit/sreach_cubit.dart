import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

part 'sreach_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SreachInitial());

  static SearchCubit get(context) => BlocProvider.of(context);
  List FilterRating = [false, false, false, false, false];
  List FilterDiscount = [false, false, false, false, false, false];
  List FilterColors = [false, false, false, false, false, false, false, false, false];
  bool Sreach = false;
  double minprice = 0;
  double maxprice = 0;
  SfRangeValues valuesOfFilterPrice = SfRangeValues(0, 80.0);
  TextEditingController SearchController = TextEditingController();
  StartSreaching(bool sreach) {
    Sreach = sreach;
    emit(SearchingState());
  }

  selectFilterColor(int index) {
    FilterColors[index] = !FilterColors[index];
    emit(FilterRatringState());
  }
  selectFilterRating(int index) {
    FilterRating[index] = !FilterRating[index];
    emit(FilterRatringState());
  }

  selectFilterDiscount(int index) {
    FilterDiscount[index] = !FilterDiscount[index];
    emit(FilterDiscountState());
  }

  changeValueofFilterPrice(SfRangeValues value) {
    valuesOfFilterPrice = value;
    minprice = value.start;
    maxprice = value.end;
    print(minprice);
    emit(changeValueOfFiltersPrice());
  }

  openDrawer(context) {
    print(Scaffold.hasDrawer(context));

    Scaffold.of(context).openEndDrawer();
    emit(OpenDrawerState());
  }
}
