import 'local_data_source.dart';

class DataSource {
  LocalDataSource localDataSource;
  DataSource({required this.localDataSource});

  Future<List<Map<String, Object?>>> getDiscountProducts() {
    return localDataSource.getDiscountProducts();
  }

  Future<List<Map<String, Object?>>> searchProducts(String search) async {
    return localDataSource.searchProducts(search);
  }
}
