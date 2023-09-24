import 'package:shop_app/core/data_base.dart';
import '../featurs/auth/models/user_model.dart';

class Constant {
  static UserModel? currentUser;
  static String supabaseUrl = 'https://eujauxjltyekeqyohodz.supabase.co';
  static String supabaseAnonkey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV1amF1eGpsdHlla2VxeW9ob2R6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg2NDM3MzYsImV4cCI6MjAwNDIxOTczNn0.IsX_pZLfNmrYPYGhqH8yZ31Zz5mt9XSztN4Mv1MPlZw';

  static Duration duration = const Duration(milliseconds: 500);
  static String productDataBasePath =
      '/data/user/0/com.example.shop_app/databases/prducts.db';
  static String searchHistoryDataBasePath =
      '/data/user/0/com.example.shop_app/databases/searchHistory.db';
  static String reviewsDataBasePath =
      '/data/user/0/com.example.shop_app/databases/reviews.db';
  static List<Map<String, dynamic>> data = [
    {
      'name': 'white cotton shirt',
      'price': 20,
      'makerCompany': 'Elegance',
      'sizes': 'L|XL|M',
      'colors': '0xFFDC4447|0xFFCE8722|0xFF6D6D6D|0xFFDFA8A9',
      'discription':
          'A classic crewneck men\'s T-shirt made from soft cotton fabric, featuring a minimalist design and a comfortable fit for everyday wear.',
      'imgUrl': 'assets/images/7.jpg|assets/images/10.jpg|assets/images/9.jpg ',
      'discount': 0,
      'date': MyDataBase.dateToString(DateTime.now()),
      'rating': 2,
      'category': 'shirt',
      'isFavorate': 0
    },
    {
      'name': 'Striped cotton shirt',
      'price': 25,
      'makerCompany': 'Elegance',
      'sizes': 'L|M',
      'colors': '0xFFDFA8A9|0xFF181E27|0xFFE4E4E4',
      'discription': 'a very good striped cotton shirt',
      'imgUrl': 'assets/images/10.jpg|assets/images/9.jpg',
      'discount': 0,
      'date': MyDataBase.dateToString(DateTime.now()),
      'rating': 5,
      'category': 'shirt',
      'isFavorate': 0
    },
    {
      'name': 'Grey cotton shirt',
      'price': 10,
      'makerCompany': 'Elegance',
      'sizes': 'L|XL',
      'colors': '0xFFE4E4E4|0xFFCE8722',
      'discription': 'a very good Grey cotton shirt',
      'imgUrl': 'assets/images/9.jpg',
      'discount': 0,
      'date': MyDataBase.dateToString(DateTime.now()),
      'rating': 3,
      'category': 'pants',
      'isFavorate': 0
    },
    {
      'name': 'Brown cotton shirt',
      'price': 60,
      'makerCompany': 'Elegance',
      'sizes': 'L|XL|M',
      'colors': '0xFFCE8722|0xFF6D4F44|0xFF7E7E7E',
      'discription':
          'A classic crewneck men\'s T-shirt made from soft cotton fabric, ',
      'imgUrl': 'assets/images/13.jpg|assets/images/11.jpg|assets/images/9.jpg',
      'discount': 20,
      'date': MyDataBase.dateToString(DateTime.now()),
      'rating': 5,
      'category': 'shirt',
      'isFavorate': 0
    },
    {
      'name': 'Black cotton shirt',
      'price': 2,
      'makerCompany': 'Elegance',
      'sizes': 'XL|M',
      'colors': '0xFF7E7E7E|0xFF6D4F44|0xFFE4E4E4|0xFF7E7E7E',
      'discription':
          'featuring a minimalist design and a comfortable fit for everyday wear.',
      'imgUrl':
          'assets/images/11.jpg|assets/images/13.jpg|assets/images/11.jpg|assets/images/9.jpg',
      'discount': 50,
      'date': MyDataBase.dateToString(DateTime.now()),
      'isFavorate': 0
    },
    {
      'name': 'Coffee polo shirt',
      'price': 100,
      'makerCompany': 'Elegance',
      'sizes': 'L|XL|M',
      'colors': '0xFF44565C|0xFFDC4447',
      'discription':
          'A classic crewneck men\'s T-shirt made from soft cotton fabric, featuring a minimalist design and a comfortable fit for everyday wear.',
      'imgUrl': 'assets/images/1.png',
      'discount': 30,
      'date': MyDataBase.dateToString(DateTime.now()),
      'isFavorate': 0
    },
  ];

  static List<Map<String, dynamic>> reviews = [
    {
      'userName': 'mahmoud',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(hours: 10))),
      'description':
          'Greate shirt ,perfect fit the design is stylish and versatil',
      'stars': 5,
      'userImage': 'assets/images/7.jpg',
      'productId': 0
    },
    {
      'userName': 'ahmad',
      'date':
          MyDataBase.dateToString(DateTime.now().add(const Duration(days: 10))),
      'description': 'Greate shirt ,perfect fit ',
      'stars': 2,
      'userImage': 'assets/images/1.png',
      'productId': 0
    },
    {
      'userName': 'fatema',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(minutes: 10))),
      'description':
          'Greate shirt ,perfect fit the design is stylish and versatil and ites very very very very very very very very very very  good',
      'stars': 5,
      'userImage': 'assets/images/2.png',
      'productId': 0
    },
    {
      'userName': 'mohammad',
      'date': MyDataBase.dateToString(DateTime.now()),
      'description': 'very   good',
      'stars': 1,
      'userImage': 'assets/images/7.jpg',
      'productId': 0
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 1
    },
    {
      'userName': 'abooooood',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(minutes: 10))),
      'description': ' its so bad and awful',
      'stars': 0,
      'userImage': 'assets/images/9.jpg',
      'productId': 1
    },
    {
      'userName': 'ahmad',
      'date':
          MyDataBase.dateToString(DateTime.now().add(const Duration(days: 10))),
      'description': 'Greate shirt ,perfect fit ',
      'stars': 2,
      'userImage': 'assets/images/1.png',
      'productId': 2
    },
    {
      'userName': 'fatema',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(minutes: 10))),
      'description':
          'Greate shirt ,perfect fit the design is stylish and versatil and ites very very very very very very very very very very  good',
      'stars': 5,
      'userImage': 'assets/images/2.png',
      'productId': 2
    },
    {
      'userName': 'mohammad',
      'date': MyDataBase.dateToString(DateTime.now()),
      'description': 'very   good',
      'stars': 1,
      'userImage': 'assets/images/7.jpg',
      'productId': 2
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 3
    },
    {
      'userName': 'abooooood',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(minutes: 10))),
      'description': ' its so bad and awful',
      'stars': 0,
      'userImage': 'assets/images/9.jpg',
      'productId': 3
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 3
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 3
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 3
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 4
    },
    {
      'userName': 'abooooood',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(minutes: 10))),
      'description': ' its so bad and awful',
      'stars': 0,
      'userImage': 'assets/images/9.jpg',
      'productId': 4
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 4
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 4
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 4
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 5
    },
    {
      'userName': 'abooooood',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(minutes: 10))),
      'description': ' its so bad and awful',
      'stars': 0,
      'userImage': 'assets/images/9.jpg',
      'productId': 5
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 5
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 5
    },
    {
      'userName': 'bahaa',
      'date': MyDataBase.dateToString(
          DateTime.now().add(const Duration(days: 100))),
      'description': 'not pad',
      'stars': 1,
      'userImage': 'assets/images/2.png',
      'productId': 5
    },
  ];
}
