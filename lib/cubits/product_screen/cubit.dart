import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
part 'states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());
  bool isFavorite = false;
  bool isFullScreen = false;
  bool hiddenPrice = false;
  double widthOfButton = 50.w;
  int indexOfColor = 0;
  int indexOfSize = 0;
  int amountOfProduct = 1;
  void changeHeightScreen(double sizeScreen) {
    if (sizeScreen >= 0.6) {
      widthOfButton = 100.w - 50;
      hiddenPrice = true;
    } else {
      widthOfButton = 50.w;
      Future.delayed(const Duration(milliseconds: 200), () {
        hiddenPrice = false;
        emit(ChangeProductHeightScreenState());
      });
    }
    if (sizeScreen >= 0.999) {
      isFullScreen = false;
    } else {
      isFullScreen = true;
    }
    emit(ChangeProductHeightScreenState());
  }

  void changeFavorite() {
    isFavorite = !isFavorite;
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
}
