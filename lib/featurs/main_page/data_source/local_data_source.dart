import 'dart:developer';

import 'package:sqflite/sqflite.dart';

import '../../../core/constant.dart';
import '../featurs/home/models/product_model.dart';
import '../featurs/products_view/models/add_to_cart_product_model.dart';

class LocalDataSource {
  Future<List<Map<String, dynamic>>> getAddToCartProduct() async {
    Database db = await openDatabase(Constant.addToCartTable);
    List<Map<String, dynamic>> products = [];
    try {
      products = await db.rawQuery('SELECT * FROM AddToCartTable');
    } catch (e) {
      log(e.toString());
    }
    return products;
  }

  Future<void> addToCart(AddToCartProductModel addToCartTableModel) async {
    //! try it if its working
    Database db = await openDatabase(Constant.addToCartTable);
    try {
      List<Map<String, dynamic>> data = await db.rawQuery(
          'SELECT * FROM AddToCartTable WHERE  productName=="${addToCartTableModel.productName}" AND price == ${addToCartTableModel.price} AND companyMaker == "${addToCartTableModel.companyMaker}" AND color == "${addToCartTableModel.color}" AND  size == "${addToCartTableModel.size}"');
      if (data.isNotEmpty) {
        int q = data[0]['quantity'];
        q += addToCartTableModel.quantity;
        db.rawUpdate('UPDATE AddToCartTable SET quantity=$q');
      } else {
        db.rawInsert(
          "INSERT INTO AddToCartTable (imgUrl, quantity, productName, price,companyMaker, color, size) VALUES ('${addToCartTableModel.imgUrl}', ${addToCartTableModel.quantity},'${addToCartTableModel.productName}',${addToCartTableModel.price},'${addToCartTableModel.companyMaker}','${addToCartTableModel.color}','${addToCartTableModel.size}')",
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> removeItemFromAddToCartProducts(int id) async {
    Database db = await openDatabase(Constant.addToCartTable);
    db.rawDelete('DELETE FROM AddToCartTable WHERE id == $id');
  }

  Future<void> updateQuantity(int id, int quantity) async {
    Database db = await openDatabase(Constant.addToCartTable);
    db.rawUpdate('UPDATE AddToCartTable SET quantity=$quantity WHERE id==$id');
  }

  Future<Map<String, dynamic>> getAddToCartProductById(int id) async {
    Database db = await openDatabase(Constant.addToCartTable);
    List<Map<String, dynamic>> data =
        await db.rawQuery('SELECT * FROM AddToCartTable WHERE id==$id');
    return data[0];
  }

  Future<List<Map<String, Object?>>> searchInCategory({
    String? searchWord,
    required double minPrice,
    required double maxPrice,
    required String selectedCategory,
    required List<bool> discountfilter,
    required List<bool> ratingFilter,
    required List<bool> colorFilter,
  }) async {
    const List<String> hexaColors = [
      '0xFF181E27',
      '0xFF44565C',
      '0xFF6D4F44',
      '0xFF6D6D6D',
      '0xFF7E7E7E',
      '0xFFCE8722',
      '0xFFDC4447',
      '0xFFDFA8A9',
      '0xFFE4E4E4'
    ];
    Database db = await openDatabase(Constant.productDataBasePath);
    List<Map<String, dynamic>> searchResult = [];
    List<Map<String, dynamic>> allProducts = [];
    if (searchWord == null) {
      try {
        if (selectedCategory == 'All') {
          allProducts = await db.rawQuery(
              'SELECT * FROM  products WHERE price >= $minPrice AND price<=$maxPrice');
        } else {
          allProducts = await db.rawQuery(
              "SELECT * FROM  products WHERE price >= $minPrice AND price<=$maxPrice AND category == '$selectedCategory'");
        }
        searchResult = allProducts.where((element) {
          if ((colorFilter[0] &&
                  element['colors'].toString().contains(hexaColors[0])) ||
              (colorFilter[1] &&
                  element['colors'].toString().contains(hexaColors[1])) ||
              (colorFilter[2] &&
                  element['colors'].toString().contains(hexaColors[2])) ||
              (colorFilter[3] &&
                  element['colors'].toString().contains(hexaColors[3])) ||
              (colorFilter[4] &&
                  element['colors'].toString().contains(hexaColors[4])) ||
              (colorFilter[5] &&
                  element['colors'].toString().contains(hexaColors[5])) ||
              (colorFilter[6] &&
                  element['colors'].toString().contains(hexaColors[6])) ||
              (colorFilter[7] &&
                  element['colors'].toString().contains(hexaColors[7])) ||
              (colorFilter[8] &&
                  element['colors'].toString().contains(hexaColors[8]))) {
            if ((discountfilter[0] && element['discount'] == 10) ||
                (discountfilter[1] && element['discount'] == 15) ||
                (discountfilter[2] && element['discount'] == 20) ||
                (discountfilter[3] && element['discount'] == 30) ||
                (discountfilter[4] && element['discount'] == 50) ||
                (discountfilter[5] && element['discount'] == 70)) {
              if ((ratingFilter[0] && element['rating'] == 1) ||
                  (ratingFilter[1] && element['rating'] == 2) ||
                  (ratingFilter[2] && element['rating'] == 3) ||
                  (ratingFilter[3] && element['rating'] == 4) ||
                  (ratingFilter[4] && element['rating'] == 5)) {
                return true;
              } else {
                bool key = false;
                for (var element in ratingFilter) {
                  if (element) {
                    key = true;
                  }
                }
                if (key) {
                  return false;
                } else {
                  return true;
                }
              }
            } else {
              bool key = false;
              for (var element in discountfilter) {
                if (element) {
                  key = true;
                }
              }
              if (key) {
                return false;
              } else {
                if ((ratingFilter[0] && element['rating'] == 1) ||
                    (ratingFilter[1] && element['rating'] == 2) ||
                    (ratingFilter[2] && element['rating'] == 3) ||
                    (ratingFilter[3] && element['rating'] == 4) ||
                    (ratingFilter[4] && element['rating'] == 5)) {
                  return true;
                } else {
                  bool key = false;
                  for (var element in ratingFilter) {
                    if (element) {
                      key = true;
                    }
                  }
                  if (key) {
                    return false;
                  } else {
                    return true;
                  }
                }
              }
            }
          } else {
            bool key = false;
            for (var element in colorFilter) {
              if (element) {
                key = true;
              }
            }
            if (key) {
              return false;
            } else {
              if ((discountfilter[0] && element['discount'] == 10) ||
                  (discountfilter[1] && element['discount'] == 15) ||
                  (discountfilter[2] && element['discount'] == 20) ||
                  (discountfilter[3] && element['discount'] == 30) ||
                  (discountfilter[4] && element['discount'] == 50) ||
                  (discountfilter[5] && element['discount'] == 70)) {
                if ((ratingFilter[0] && element['rating'] == 1) ||
                    (ratingFilter[1] && element['rating'] == 2) ||
                    (ratingFilter[2] && element['rating'] == 3) ||
                    (ratingFilter[3] && element['rating'] == 4) ||
                    (ratingFilter[4] && element['rating'] == 5)) {
                  return true;
                } else {
                  bool key = false;
                  for (var element in ratingFilter) {
                    if (element) {
                      key = true;
                    }
                  }
                  if (key) {
                    return false;
                  } else {
                    return true;
                  }
                }
              } else {
                bool key = false;
                for (var element in discountfilter) {
                  if (element) {
                    key = true;
                  }
                }
                if (key) {
                  return false;
                } else {
                  if ((ratingFilter[0] && element['rating'] == 1) ||
                      (ratingFilter[1] && element['rating'] == 2) ||
                      (ratingFilter[2] && element['rating'] == 3) ||
                      (ratingFilter[3] && element['rating'] == 4) ||
                      (ratingFilter[4] && element['rating'] == 5)) {
                    return true;
                  } else {
                    bool key = false;
                    for (var element in ratingFilter) {
                      if (element) {
                        key = true;
                      }
                    }
                    if (key) {
                      return false;
                    } else {
                      return true;
                    }
                  }
                }
              }
            }
          }
        }).toList();
      } catch (e) {
        log(e.toString());
      }
    } else {
      try {
        if (selectedCategory == 'All') {
          allProducts = await db.rawQuery(
              'SELECT * FROM  products WHERE price >= $minPrice AND price<=$maxPrice');
        } else {
          allProducts = await db.rawQuery(
              "SELECT * FROM  products WHERE price >= $minPrice AND price<=$maxPrice AND category == '$selectedCategory'");
        }
        searchResult = allProducts.where((element) {
          if ((colorFilter[0] &&
                  element['colors'].toString().contains(hexaColors[0])) ||
              (colorFilter[1] &&
                  element['colors'].toString().contains(hexaColors[1])) ||
              (colorFilter[2] &&
                  element['colors'].toString().contains(hexaColors[2])) ||
              (colorFilter[3] &&
                  element['colors'].toString().contains(hexaColors[3])) ||
              (colorFilter[4] &&
                  element['colors'].toString().contains(hexaColors[4])) ||
              (colorFilter[5] &&
                  element['colors'].toString().contains(hexaColors[5])) ||
              (colorFilter[6] &&
                  element['colors'].toString().contains(hexaColors[6])) ||
              (colorFilter[7] &&
                  element['colors'].toString().contains(hexaColors[7])) ||
              (colorFilter[8] &&
                  element['colors'].toString().contains(hexaColors[8]))) {
            if ((element['name'])
                    .toString()
                    .toLowerCase()
                    .contains(searchWord.toLowerCase()) ||
                (element['discription'])
                    .toString()
                    .toLowerCase()
                    .contains(searchWord.toLowerCase()) ||
                (element['makerCompany'])
                    .toString()
                    .toLowerCase()
                    .contains(searchWord.toLowerCase())) {
              if ((discountfilter[0] && element['discount'] == 10) ||
                  (discountfilter[1] && element['discount'] == 15) ||
                  (discountfilter[2] && element['discount'] == 20) ||
                  (discountfilter[3] && element['discount'] == 30) ||
                  (discountfilter[4] && element['discount'] == 50) ||
                  (discountfilter[5] && element['discount'] == 70)) {
                if ((ratingFilter[0] && element['rating'] == 1) ||
                    (ratingFilter[1] && element['rating'] == 2) ||
                    (ratingFilter[2] && element['rating'] == 3) ||
                    (ratingFilter[3] && element['rating'] == 4) ||
                    (ratingFilter[4] && element['rating'] == 5)) {
                  return true;
                } else {
                  bool key = false;
                  for (var element in ratingFilter) {
                    if (element) {
                      key = true;
                    }
                  }
                  if (key) {
                    return false;
                  } else {
                    return true;
                  }
                }
              } else {
                bool key = false;
                for (var element in discountfilter) {
                  if (element) {
                    key = true;
                  }
                }
                if (key) {
                  return false;
                } else {
                  if ((ratingFilter[0] && element['rating'] == 1) ||
                      (ratingFilter[1] && element['rating'] == 2) ||
                      (ratingFilter[2] && element['rating'] == 3) ||
                      (ratingFilter[3] && element['rating'] == 4) ||
                      (ratingFilter[4] && element['rating'] == 5)) {
                    return true;
                  } else {
                    bool key = false;
                    for (var element in ratingFilter) {
                      if (element) {
                        key = true;
                      }
                    }
                    if (key) {
                      return false;
                    } else {
                      return true;
                    }
                  }
                }
              }
            } else {
              return false;
            }
          } else {
            bool key = false;
            for (var element in colorFilter) {
              if (element) {
                key = true;
              }
            }
            if (key) {
              return false;
            } else {
              if ((element['name'])
                      .toString()
                      .toLowerCase()
                      .contains(searchWord.toLowerCase()) ||
                  (element['discription'])
                      .toString()
                      .toLowerCase()
                      .contains(searchWord.toLowerCase()) ||
                  (element['makerCompany'])
                      .toString()
                      .toLowerCase()
                      .contains(searchWord.toLowerCase())) {
                if ((discountfilter[0] && element['discount'] == 10) ||
                    (discountfilter[1] && element['discount'] == 15) ||
                    (discountfilter[2] && element['discount'] == 20) ||
                    (discountfilter[3] && element['discount'] == 30) ||
                    (discountfilter[4] && element['discount'] == 50) ||
                    (discountfilter[5] && element['discount'] == 70)) {
                  if ((ratingFilter[0] && element['rating'] == 1) ||
                      (ratingFilter[1] && element['rating'] == 2) ||
                      (ratingFilter[2] && element['rating'] == 3) ||
                      (ratingFilter[3] && element['rating'] == 4) ||
                      (ratingFilter[4] && element['rating'] == 5)) {
                    return true;
                  } else {
                    bool key = false;
                    for (var element in ratingFilter) {
                      if (element) {
                        key = true;
                      }
                    }
                    if (key) {
                      return false;
                    } else {
                      return true;
                    }
                  }
                } else {
                  bool key = false;
                  for (var element in discountfilter) {
                    if (element) {
                      key = true;
                    }
                  }
                  if (key) {
                    return false;
                  } else {
                    if ((ratingFilter[0] && element['rating'] == 1) ||
                        (ratingFilter[1] && element['rating'] == 2) ||
                        (ratingFilter[2] && element['rating'] == 3) ||
                        (ratingFilter[3] && element['rating'] == 4) ||
                        (ratingFilter[4] && element['rating'] == 5)) {
                      return true;
                    } else {
                      bool key = false;
                      for (var element in ratingFilter) {
                        if (element) {
                          key = true;
                        }
                      }
                      if (key) {
                        return false;
                      } else {
                        return true;
                      }
                    }
                  }
                }
              } else {
                return false;
              }
            }
          }
        }).toList();
      } catch (e) {
        log(e.toString());
      }
    }
    return searchResult;
  }

  Future<Map<String, dynamic>> getProductById(int id) async {
    Database db = await openDatabase(Constant.productDataBasePath);
    List<Map<String, dynamic>> products =
        await db.rawQuery('SELECT * FROM products WHERE id=$id');
    return products[0];
  }

  Future<List<Map<String, dynamic>>> getSimilarProducts(
      ProductModel product) async {
    Database db = await openDatabase(Constant.productDataBasePath);
    List<Map<String, dynamic>> list1 = await db.rawQuery(
        "SELECT * FROM products WHERE category =='${product.category}' AND makerCompany =='${product.makerCompany}'");
    List<Map<String, dynamic>> list2 = await db.rawQuery(
        "SELECT * FROM products WHERE category =='${product.category}' AND makerCompany !='${product.makerCompany}'");
    list1.addAll(list2);
    return list1;
  }

  Future<List<Map<String, dynamic>>> getReviews(int id) async {
    Database db = await openDatabase(Constant.reviewsDataBasePath);
    return db.rawQuery('SELECT * FROM reviews WHERE productId == $id');
  }

  Future<List<Map<String, dynamic>>> getDiscountProduct() async {
    Database db = await openDatabase(Constant.productDataBasePath);
    List<Map<String, Object?>> data = [];
    try {
      data = await db.rawQuery(
          'SELECT * FROM products WHERE discount > 0 ORDER BY discount DESC');
    } catch (e) {
      log(e.toString());
    }
    return data;
  }

  Future<List<Map<String, Object?>>> searchInDiscountProducts({
    required double minPrice,
    required double maxPrice,
    String? searchWord,
    required String selectedCategory,
    required List<bool> discountFilter,
    required List<bool> ratingFilter,
    required List<bool> colorFilter,
  }) async {
    const List<String> hexaColors = [
      '0xFF181E27',
      '0xFF44565C',
      '0xFF6D4F44',
      '0xFF6D6D6D',
      '0xFF7E7E7E',
      '0xFFCE8722',
      '0xFFDC4447',
      '0xFFDFA8A9',
      '0xFFE4E4E4'
    ];
    Database db = await openDatabase(Constant.productDataBasePath);
    List<Map<String, dynamic>> searchResult = [];
    List<Map<String, dynamic>> allProducts = [];
    if (searchWord == null) {
      try {
        if (selectedCategory == 'All') {
          allProducts = await db.rawQuery(
              'SELECT * FROM  products WHERE price >= $minPrice AND price<=$maxPrice AND discount > 0 ORDER BY price');
        } else {
          allProducts = await db.rawQuery(
              "SELECT * FROM  products WHERE price >= $minPrice AND price<=$maxPrice AND category == '$selectedCategory' AND discount > 0 ORDER BY price");
        }
        searchResult = allProducts.where((element) {
          if ((colorFilter[0] &&
                  element['colors'].toString().contains(hexaColors[0])) ||
              (colorFilter[1] &&
                  element['colors'].toString().contains(hexaColors[1])) ||
              (colorFilter[2] &&
                  element['colors'].toString().contains(hexaColors[2])) ||
              (colorFilter[3] &&
                  element['colors'].toString().contains(hexaColors[3])) ||
              (colorFilter[4] &&
                  element['colors'].toString().contains(hexaColors[4])) ||
              (colorFilter[5] &&
                  element['colors'].toString().contains(hexaColors[5])) ||
              (colorFilter[6] &&
                  element['colors'].toString().contains(hexaColors[6])) ||
              (colorFilter[7] &&
                  element['colors'].toString().contains(hexaColors[7])) ||
              (colorFilter[8] &&
                  element['colors'].toString().contains(hexaColors[8]))) {
            if ((discountFilter[0] && element['discount'] == 10) ||
                (discountFilter[1] && element['discount'] == 15) ||
                (discountFilter[2] && element['discount'] == 20) ||
                (discountFilter[3] && element['discount'] == 30) ||
                (discountFilter[4] && element['discount'] == 50) ||
                (discountFilter[5] && element['discount'] == 70)) {
              if ((ratingFilter[0] && element['rating'] == 1) ||
                  (ratingFilter[1] && element['rating'] == 2) ||
                  (ratingFilter[2] && element['rating'] == 3) ||
                  (ratingFilter[3] && element['rating'] == 4) ||
                  (ratingFilter[4] && element['rating'] == 5)) {
                return true;
              } else {
                bool key = false;
                for (var element in ratingFilter) {
                  if (element) {
                    key = true;
                  }
                }
                if (key) {
                  return false;
                } else {
                  return true;
                }
              }
            } else {
              bool key = false;
              for (var element in discountFilter) {
                if (element) {
                  key = true;
                }
              }
              if (key) {
                return false;
              } else {
                if ((ratingFilter[0] && element['rating'] == 1) ||
                    (ratingFilter[1] && element['rating'] == 2) ||
                    (ratingFilter[2] && element['rating'] == 3) ||
                    (ratingFilter[3] && element['rating'] == 4) ||
                    (ratingFilter[4] && element['rating'] == 5)) {
                  return true;
                } else {
                  bool key = false;
                  for (var element in ratingFilter) {
                    if (element) {
                      key = true;
                    }
                  }
                  if (key) {
                    return false;
                  } else {
                    return true;
                  }
                }
              }
            }
          } else {
            bool key = false;
            for (var element in colorFilter) {
              if (element) {
                key = true;
              }
            }
            if (key) {
              return false;
            } else {
              if ((discountFilter[0] && element['discount'] == 10) ||
                  (discountFilter[1] && element['discount'] == 15) ||
                  (discountFilter[2] && element['discount'] == 20) ||
                  (discountFilter[3] && element['discount'] == 30) ||
                  (discountFilter[4] && element['discount'] == 50) ||
                  (discountFilter[5] && element['discount'] == 70)) {
                if ((ratingFilter[0] && element['rating'] == 1) ||
                    (ratingFilter[1] && element['rating'] == 2) ||
                    (ratingFilter[2] && element['rating'] == 3) ||
                    (ratingFilter[3] && element['rating'] == 4) ||
                    (ratingFilter[4] && element['rating'] == 5)) {
                  return true;
                } else {
                  bool key = false;
                  for (var element in ratingFilter) {
                    if (element) {
                      key = true;
                    }
                  }
                  if (key) {
                    return false;
                  } else {
                    return true;
                  }
                }
              } else {
                bool key = false;
                for (var element in discountFilter) {
                  if (element) {
                    key = true;
                  }
                }
                if (key) {
                  return false;
                } else {
                  if ((ratingFilter[0] && element['rating'] == 1) ||
                      (ratingFilter[1] && element['rating'] == 2) ||
                      (ratingFilter[2] && element['rating'] == 3) ||
                      (ratingFilter[3] && element['rating'] == 4) ||
                      (ratingFilter[4] && element['rating'] == 5)) {
                    return true;
                  } else {
                    bool key = false;
                    for (var element in ratingFilter) {
                      if (element) {
                        key = true;
                      }
                    }
                    if (key) {
                      return false;
                    } else {
                      return true;
                    }
                  }
                }
              }
            }
          }
        }).toList();
      } catch (e) {
        log(e.toString());
      }
    } else {
      try {
        if (selectedCategory == 'All') {
          allProducts = await db.rawQuery(
              'SELECT * FROM  products WHERE price >= $minPrice AND price<=$maxPrice AND discount > 0 ');
        } else {
          allProducts = await db.rawQuery(
              "SELECT * FROM  products WHERE price >= $minPrice AND price<=$maxPrice AND category == '$selectedCategory' AND discount > 0");
        }
        searchResult = allProducts.where((element) {
          if ((colorFilter[0] &&
                  element['colors'].toString().contains(hexaColors[0])) ||
              (colorFilter[1] &&
                  element['colors'].toString().contains(hexaColors[1])) ||
              (colorFilter[2] &&
                  element['colors'].toString().contains(hexaColors[2])) ||
              (colorFilter[3] &&
                  element['colors'].toString().contains(hexaColors[3])) ||
              (colorFilter[4] &&
                  element['colors'].toString().contains(hexaColors[4])) ||
              (colorFilter[5] &&
                  element['colors'].toString().contains(hexaColors[5])) ||
              (colorFilter[6] &&
                  element['colors'].toString().contains(hexaColors[6])) ||
              (colorFilter[7] &&
                  element['colors'].toString().contains(hexaColors[7])) ||
              (colorFilter[8] &&
                  element['colors'].toString().contains(hexaColors[8]))) {
            if ((element['name'])
                    .toString()
                    .toLowerCase()
                    .contains(searchWord.toLowerCase()) ||
                (element['discription'])
                    .toString()
                    .toLowerCase()
                    .contains(searchWord.toLowerCase()) ||
                (element['makerCompany'])
                    .toString()
                    .toLowerCase()
                    .contains(searchWord.toLowerCase())) {
              if ((discountFilter[0] && element['discount'] == 10) ||
                  (discountFilter[1] && element['discount'] == 15) ||
                  (discountFilter[2] && element['discount'] == 20) ||
                  (discountFilter[3] && element['discount'] == 30) ||
                  (discountFilter[4] && element['discount'] == 50) ||
                  (discountFilter[5] && element['discount'] == 70)) {
                if ((ratingFilter[0] && element['rating'] == 1) ||
                    (ratingFilter[1] && element['rating'] == 2) ||
                    (ratingFilter[2] && element['rating'] == 3) ||
                    (ratingFilter[3] && element['rating'] == 4) ||
                    (ratingFilter[4] && element['rating'] == 5)) {
                  return true;
                } else {
                  bool key = false;
                  for (var element in ratingFilter) {
                    if (element) {
                      key = true;
                    }
                  }
                  if (key) {
                    return false;
                  } else {
                    return true;
                  }
                }
              } else {
                bool key = false;
                for (var element in discountFilter) {
                  if (element) {
                    key = true;
                  }
                }
                if (key) {
                  return false;
                } else {
                  if ((ratingFilter[0] && element['rating'] == 1) ||
                      (ratingFilter[1] && element['rating'] == 2) ||
                      (ratingFilter[2] && element['rating'] == 3) ||
                      (ratingFilter[3] && element['rating'] == 4) ||
                      (ratingFilter[4] && element['rating'] == 5)) {
                    return true;
                  } else {
                    bool key = false;
                    for (var element in ratingFilter) {
                      if (element) {
                        key = true;
                      }
                    }
                    if (key) {
                      return false;
                    } else {
                      return true;
                    }
                  }
                }
              }
            } else {
              return false;
            }
          } else {
            bool key = false;
            for (var element in colorFilter) {
              if (element) {
                key = true;
              }
            }
            if (key) {
              return false;
            } else {
              if ((element['name'])
                      .toString()
                      .toLowerCase()
                      .contains(searchWord.toLowerCase()) ||
                  (element['discription'])
                      .toString()
                      .toLowerCase()
                      .contains(searchWord.toLowerCase()) ||
                  (element['makerCompany'])
                      .toString()
                      .toLowerCase()
                      .contains(searchWord.toLowerCase())) {
                if ((discountFilter[0] && element['discount'] == 10) ||
                    (discountFilter[1] && element['discount'] == 15) ||
                    (discountFilter[2] && element['discount'] == 20) ||
                    (discountFilter[3] && element['discount'] == 30) ||
                    (discountFilter[4] && element['discount'] == 50) ||
                    (discountFilter[5] && element['discount'] == 70)) {
                  if ((ratingFilter[0] && element['rating'] == 1) ||
                      (ratingFilter[1] && element['rating'] == 2) ||
                      (ratingFilter[2] && element['rating'] == 3) ||
                      (ratingFilter[3] && element['rating'] == 4) ||
                      (ratingFilter[4] && element['rating'] == 5)) {
                    return true;
                  } else {
                    bool key = false;
                    for (var element in ratingFilter) {
                      if (element) {
                        key = true;
                      }
                    }
                    if (key) {
                      return false;
                    } else {
                      return true;
                    }
                  }
                } else {
                  bool key = false;
                  for (var element in discountFilter) {
                    if (element) {
                      key = true;
                    }
                  }
                  if (key) {
                    return false;
                  } else {
                    if ((ratingFilter[0] && element['rating'] == 1) ||
                        (ratingFilter[1] && element['rating'] == 2) ||
                        (ratingFilter[2] && element['rating'] == 3) ||
                        (ratingFilter[3] && element['rating'] == 4) ||
                        (ratingFilter[4] && element['rating'] == 5)) {
                      return true;
                    } else {
                      bool key = false;
                      for (var element in ratingFilter) {
                        if (element) {
                          key = true;
                        }
                      }
                      if (key) {
                        return false;
                      } else {
                        return true;
                      }
                    }
                  }
                }
              } else {
                return false;
              }
            }
          }
        }).toList();
      } catch (e) {
        log(e.toString());
      }
    }
    return searchResult;
  }

  Future<List<Map<String, Object?>>> searchProducts({
    required String search,
    required double minPrice,
    required double maxPrice,
    required String selectedCategory,
    required List<bool> discountfilter,
    required List<bool> ratingFilter,
    required List<bool> colorFilter,
  }) async {
    const List<String> hexaColors = [
      '0xFF181E27',
      '0xFF44565C',
      '0xFF6D4F44',
      '0xFF6D6D6D',
      '0xFF7E7E7E',
      '0xFFCE8722',
      '0xFFDC4447',
      '0xFFDFA8A9',
      '0xFFE4E4E4'
    ];
    Database db = await openDatabase(Constant.productDataBasePath);
    List<Map<String, dynamic>> searchResult = [];
    List<Map<String, dynamic>> allProducts = [];
    try {
      if (selectedCategory == 'All') {
        allProducts = await db.rawQuery(
            'SELECT * FROM  products WHERE price >= $minPrice AND price<=$maxPrice');
      } else {
        allProducts = await db.rawQuery(
            "SELECT * FROM  products WHERE price >= $minPrice AND price<=$maxPrice AND category == '$selectedCategory'");
      }
      searchResult = allProducts.where((element) {
        if ((colorFilter[0] &&
                element['colors'].toString().contains(hexaColors[0])) ||
            (colorFilter[1] &&
                element['colors'].toString().contains(hexaColors[1])) ||
            (colorFilter[2] &&
                element['colors'].toString().contains(hexaColors[2])) ||
            (colorFilter[3] &&
                element['colors'].toString().contains(hexaColors[3])) ||
            (colorFilter[4] &&
                element['colors'].toString().contains(hexaColors[4])) ||
            (colorFilter[5] &&
                element['colors'].toString().contains(hexaColors[5])) ||
            (colorFilter[6] &&
                element['colors'].toString().contains(hexaColors[6])) ||
            (colorFilter[7] &&
                element['colors'].toString().contains(hexaColors[7])) ||
            (colorFilter[8] &&
                element['colors'].toString().contains(hexaColors[8]))) {
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
            if ((discountfilter[0] && element['discount'] == 10) ||
                (discountfilter[1] && element['discount'] == 15) ||
                (discountfilter[2] && element['discount'] == 20) ||
                (discountfilter[3] && element['discount'] == 30) ||
                (discountfilter[4] && element['discount'] == 50) ||
                (discountfilter[5] && element['discount'] == 70)) {
              if ((ratingFilter[0] && element['rating'] == 1) ||
                  (ratingFilter[1] && element['rating'] == 2) ||
                  (ratingFilter[2] && element['rating'] == 3) ||
                  (ratingFilter[3] && element['rating'] == 4) ||
                  (ratingFilter[4] && element['rating'] == 5)) {
                return true;
              } else {
                bool key = false;
                for (var element in ratingFilter) {
                  if (element) {
                    key = true;
                  }
                }
                if (key) {
                  return false;
                } else {
                  return true;
                }
              }
            } else {
              bool key = false;
              for (var element in discountfilter) {
                if (element) {
                  key = true;
                }
              }
              if (key) {
                return false;
              } else {
                if ((ratingFilter[0] && element['rating'] == 1) ||
                    (ratingFilter[1] && element['rating'] == 2) ||
                    (ratingFilter[2] && element['rating'] == 3) ||
                    (ratingFilter[3] && element['rating'] == 4) ||
                    (ratingFilter[4] && element['rating'] == 5)) {
                  return true;
                } else {
                  bool key = false;
                  for (var element in ratingFilter) {
                    if (element) {
                      key = true;
                    }
                  }
                  if (key) {
                    return false;
                  } else {
                    return true;
                  }
                }
              }
            }
          } else {
            return false;
          }
        } else {
          bool key = false;
          for (var element in colorFilter) {
            if (element) {
              key = true;
            }
          }
          if (key) {
            return false;
          } else {
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
              if ((discountfilter[0] && element['discount'] == 10) ||
                  (discountfilter[1] && element['discount'] == 15) ||
                  (discountfilter[2] && element['discount'] == 20) ||
                  (discountfilter[3] && element['discount'] == 30) ||
                  (discountfilter[4] && element['discount'] == 50) ||
                  (discountfilter[5] && element['discount'] == 70)) {
                if ((ratingFilter[0] && element['rating'] == 1) ||
                    (ratingFilter[1] && element['rating'] == 2) ||
                    (ratingFilter[2] && element['rating'] == 3) ||
                    (ratingFilter[3] && element['rating'] == 4) ||
                    (ratingFilter[4] && element['rating'] == 5)) {
                  return true;
                } else {
                  bool key = false;
                  for (var element in ratingFilter) {
                    if (element) {
                      key = true;
                    }
                  }
                  if (key) {
                    return false;
                  } else {
                    return true;
                  }
                }
              } else {
                bool key = false;
                for (var element in discountfilter) {
                  if (element) {
                    key = true;
                  }
                }
                if (key) {
                  return false;
                } else {
                  if ((ratingFilter[0] && element['rating'] == 1) ||
                      (ratingFilter[1] && element['rating'] == 2) ||
                      (ratingFilter[2] && element['rating'] == 3) ||
                      (ratingFilter[3] && element['rating'] == 4) ||
                      (ratingFilter[4] && element['rating'] == 5)) {
                    return true;
                  } else {
                    bool key = false;
                    for (var element in ratingFilter) {
                      if (element) {
                        key = true;
                      }
                    }
                    if (key) {
                      return false;
                    } else {
                      return true;
                    }
                  }
                }
              }
            } else {
              return false;
            }
          }
        }
      }).toList();
    } catch (e) {
      log(e.toString());
    }
    return searchResult;
  }

  Future<void> setSearchHistory(String searchWord) async {
    Database db = await openDatabase(Constant.searchHistoryDataBasePath);
    try {
      List<Map<String, dynamic>> result = await db
          .rawQuery("SELECT * FROM searchHistory WHERE word == '$searchWord' ");
      if (result.isEmpty) {
        db.insert('searchHistory', {'word': searchWord, 'count': 1});
      } else {
        int oldCount = result[0]['count'];
        db.rawUpdate(
            "UPDATE searchHistory  SET count=${oldCount + 1} WHERE word == '$searchWord'");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> getSearchHistory() async {
    Database db = await openDatabase(Constant.searchHistoryDataBasePath);
    return db.rawQuery('SELECT * FROM searchHistory ORDER BY count DESC');
  }

  Future<void> deleteWordFormSearchHistory(String word) async {
    Database db = await openDatabase(Constant.searchHistoryDataBasePath);
    db.rawDelete("DELETE FROM searchHistory WHERE word == '$word'");
  }

  Future<void> setFavorateProduct(int id, bool value) async {
    Database db = await openDatabase(Constant.productDataBasePath);
    try {
      if (value) {
        await db.rawUpdate(
            "UPDATE products  SET isFavorate = 'true' WHERE id == $id ");
      } else {
        await db.rawUpdate(
            "UPDATE products  SET isFavorate = 'false' WHERE id == $id ");
      }
    } catch (e) {
      log('created');
    }
  }
}
