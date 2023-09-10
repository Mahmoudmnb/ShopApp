import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/featurs/home/data_source/data_source.dart';
import 'package:shop_app/injection.dart';

part 'sreach_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SreachInitial());

  static SearchCubit get(context) => BlocProvider.of(context);
  bool Sreach = false;
  startSreaching(bool sreach) {
    Sreach = sreach;
    emit(SearchingState());
  }

  openDrawer(context) {
    print(Scaffold.hasDrawer(context));
    Scaffold.of(context).openEndDrawer();
    emit(OpenDrawerState());
  }

  search(String search) async {
    List<Map<String, dynamic>> searchResult =
        await sl.get<DataSource>().searchProducts(search);
    emit(SearchResults(searchResult: searchResult));
  }
}
