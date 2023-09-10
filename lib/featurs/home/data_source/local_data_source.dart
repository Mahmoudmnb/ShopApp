import 'package:sqflite/sqflite.dart';

import '../../../core/constant.dart';

class LocalDataSource {
  Future<List<Map<String, Object?>>> getDiscountProducts() async {
    Database db = await openDatabase(Constant.productDataBasePath);
    List<Map<String, Object?>> data = [];
    try {
      data = await db.rawQuery(
          'SELECT * FROM products WHERE discount > 0 ORDER BY discount DESC');
    } catch (e) {
      print(e);
    }
    return data;
  }

  Future<List<Map<String, Object?>>> searchProducts(String search) async {
    Database db = await openDatabase(Constant.productDataBasePath);
    List<Map<String, dynamic>> allProducts = await db.query('products');
    List<Map<String, dynamic>> searchResult = allProducts.where((element) {
      if ((element['name'])
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase()) ||
          (element['discription'])
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase()) ||
          (element['makerCompany'])
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase())) {
        return true;
      } else {
        return false;
      }
    }).toList();
    return searchResult;
  }
}
