import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/core/constant.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase {
  Future<void> createTable() async {
    String path = await getDatabasesPath();
    String dataBasePath = join(path, 'prducts', '.db');
    Database db = await openDatabase(
      dataBasePath,
      version: 1,
      onCreate: (db, version) async {
        db.execute(
            'CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT NOT NULL , price INTEGER NOT NULL , makerCompany TEXT NOT NULL , sizes TEXT NOT NULL , colors TEXT NOT NULL , discription TEXT NOT NULL , imgUrl TEXT NOT NULL ,discount INTEGER NOT NULL , date TEXT NOT NULL)');
        SharedPreferences sh = await SharedPreferences.getInstance();
        sh.setString('DataBasePath', dataBasePath);
      },
    );
    print('created');
  }

  Future<void> createSearchHistoryTable() async {
    String path = await getDatabasesPath();
    String dataBasePath = join(path, 'searchHistory.db');
    Database db = await openDatabase(
      dataBasePath,
      version: 1,
      onCreate: (db, version) async {
        db.execute(
            'CREATE TABLE searchHistory (id INTEGER PRIMARY KEY , word TEXT NOT NULL , count INTEGER )');
      },
    );
    print('created');
  }

  deleteTable() {
    deleteDatabase(Constant.productDataBasePath);
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

  static void insertData() async {
    Database db = await openDatabase(Constant.productDataBasePath);
    for (var element in Constant.data) {
      db.insert('products', element);
    }
    print('done');
  }

  static getData() async {
    Database db = await openDatabase(Constant.productDataBasePath);
    try {
      var r = await db.rawQuery('SELECT * FROM products WHERE discount > 0');
      print(r);
    } catch (e) {
      print(e);
    }
  }
}