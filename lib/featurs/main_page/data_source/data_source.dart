import '../featurs/home/models/product_model.dart';
import 'local_data_source.dart';

class DataSource {
  LocalDataSource localDataSource;
  DataSource({required this.localDataSource});
  Future<Map<String, dynamic>> getProductById(int id) async {
    return localDataSource.getProductById(id);
  }

  Future<List<Map<String, dynamic>>> getSimilarProducts(
      ProductModel product) async {
    return localDataSource.getSimilarProducts(product);
  }

  Future<List<Map<String, dynamic>>> getReviews(int id) async {
    return localDataSource.getReviews(id);
  }

  Future<List<Map<String, Object?>>> getDiscountProducts() {
    return localDataSource.getDiscountProducts();
  }

  Future<List<Map<String, Object?>>> searchProducts({
    required String search,
    required double minPrice,
    required double maxPrice,
    required List<bool> discountFilter,
    required String selectedCategory,
    required List<bool> ratingFilter,
    required List<bool> colorFilter,
  }) async {
    return localDataSource.searchProducts(
      discountfilter: discountFilter,
      search: search,
      minPrice: minPrice,
      maxPrice: maxPrice,
      selectedCategory: selectedCategory,
      ratingFilter: ratingFilter,
      colorFilter: colorFilter,
    );
  }

  Future<void> setSearchHistory(String searchWord) {
    return localDataSource.setSearchHistory(searchWord);
  }

  Future<List<Map<String, dynamic>>> getSearchHistory() async {
    return localDataSource.getSearchHistory();
  }

  Future<void> deleteWordFormSearchHistory(String word) async {
    return localDataSource.deleteWordFormSearchHistory(word);
  }

  Future<void> setFavorateProduct(int id, bool value) async {
    localDataSource.setFavorateProduct(id, value);
  }
}
