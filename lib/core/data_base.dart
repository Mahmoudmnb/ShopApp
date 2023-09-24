import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/core/constant.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase {
  Future<void> createReviewTable() async {
    String path = await getDatabasesPath();
    String dataBasePath = '$path/reviews.db';
    await openDatabase(
      dataBasePath,
      version: 1,
      onCreate: (db, version) async {
        db.execute(
            'CREATE TABLE reviews (id INTEGER PRIMARY KEY , description TEXT NOT NULL , stars INTEGER NOT NULL , date TEXT NOT NULL , userName TEXT NOT NULL , userImage TEXT , productId INTEGER NOT NULL )');
      },
    );
    log('created');
  }

  Future<void> insertReviewTable() async {
    Database db = await openDatabase(Constant.reviewsDataBasePath);
    for (var element in Constant.reviews) {
      db.insert('reviews', element);
    }
    log('done');
  }

  Future<void> createTable() async {
    String path = await getDatabasesPath();
    String dataBasePath = '$path/prducts.db';
    await openDatabase(
      dataBasePath,
      version: 1,
      onCreate: (db, version) async {
        db.execute(
            'CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT NOT NULL , price DECIMAL NOT NULL , makerCompany TEXT NOT NULL , sizes TEXT NOT NULL , colors TEXT NOT NULL , discription TEXT NOT NULL , imgUrl TEXT NOT NULL ,discount INTEGER NOT NULL , date TEXT NOT NULL , category TEXT , rating INTEGER , isFavorate BOOLEAN)');
        SharedPreferences sh = await SharedPreferences.getInstance();
        sh.setString('DataBasePath', dataBasePath);
      },
    );
    log('created');
  }

  Future<void> createSearchHistoryTable() async {
    String path = await getDatabasesPath();
    String dataBasePath = '$path/searchHistory.db';
    try {
      await openDatabase(
        dataBasePath,
        version: 1,
        onCreate: (db, version) async {
          db.execute(
              'CREATE TABLE searchHistory (id INTEGER PRIMARY KEY , word TEXT NOT NULL , count INTEGER NOT NULL )');
        },
      );
      log('created');
    } catch (e) {
      log(e.toString());
    }
  }

  static String dateToString(DateTime date) {
    return '${date.hour}:${date.minute}:${date.second}|${date.day}/${date.month}/${date.year}';
  }

  static DateTime stringToDate(String strDate) {
    var d = strDate.split('|');
    var time = d[0].split(':');
    var date = d[1].split('/');
    return DateTime(int.parse(date[2]), int.parse(date[1]), int.parse(date[0]),
        int.parse(time[0]), int.parse(time[1]), int.parse(time[2]));
  }

  Future<void> insertData() async {
    Database db = await openDatabase(Constant.productDataBasePath);
    for (var element in Constant.data) {
      db.insert('products', element);
    }
    log('done');
  }
}
