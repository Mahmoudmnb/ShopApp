import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/models/product_model.dart';

import '../../../../../../injection.dart';
import '../../../../data_source/data_source.dart';

part 'states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());
  bool isFavorite = false;
  int indexOfColor = 0;
  int indexOfSize = 0;
  int amountOfProduct = 1;
  Future<void> changeFavorite(int id) async {
    isFavorite = !isFavorite;
    await setFavorateProductInDataBase(id, isFavorite).then((value) {});
    emit(ChangeProductFavoriteState());
  }

  void addAmountOfProduct() {
    amountOfProduct++;
    emit(ChangeProductAmountState());
  }

  void removeAmountOfProduct() {
    if (amountOfProduct > 1) amountOfProduct--;
    emit(ChangeProductAmountState());
  }

  void changeIndexOfSize(int index) {
    indexOfSize = index;
    emit(ChangeProductSizeState());
  }

  void changeIndexOfColor(int index) {
    indexOfColor = index;
    emit(ChangeProductColorState());
  }

  //! mnb
  List<Map<String, dynamic>> reviws = [];
  List<Map<String, dynamic>> similarProducts = [];
  double widthOfPrice = 145;
  bool hidden = false;
  bool b = true;
  void changeWidthOfPrice() {
    emit(ChangeWidthOfPrice());
  }

  Future<void> setFavorateProductInDataBase(int id, bool value) async {
    await sl.get<DataSource>().setFavorateProduct(id, value);
  }

  Future<void> getReviws(int id) async {
    reviws = await sl.get<DataSource>().getReviews(id);
    emit(GetReviews());
  }

  Future<void> getSimilarProducts(ProductModel product) async {
    similarProducts = await sl.get<DataSource>().getSimilarProducts(product);
  }

  Future<Map<String, dynamic>> getProductById(int id) async {
    return sl.get<DataSource>().getProductById(id);
  }
}
