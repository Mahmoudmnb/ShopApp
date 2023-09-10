import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/data_base.dart';
import '../featurs/auth/blocs/auth_blocs.dart';
import '../featurs/auth/models/user_model.dart';

class Constant {
  static UserModel? currentUser;
  static Duration duration = const Duration(milliseconds: 500);
  static String productDataBasePath =
      '/data/user/0/com.example.shop_app/databases/prducts/.db';
  static String searchHistoryDataBasePath =
      '/data/user/0/com.example.shop_app/databases/searchHistory/.db';

  static List<BlocProvider> providers = [
    BlocProvider(
      create: (context) => VisiblePsswordBloc(),
    ),
    BlocProvider(
      create: (context) => EmailTextBloc(),
    ),
    BlocProvider(
      create: (context) => SignUpBloc(),
    ),
    BlocProvider(
      create: (context) => SignInLoadingBloc(),
    ),
  ];

  static List<Map<String, dynamic>> data = [
    {
      'name': 'white cotton shirt',
      'price': 20,
      'makerCompany': 'Elegance',
      'sizes': 'L|XL|M',
      'colors': 'Red|Green|Blue',
      'discription': 'a very good white cotton shirt',
      'imgUrl': 'assets/images/7.jpg',
      'discount': 0,
      'date': MyDataBase.dateToString(DateTime.now())
    },
    {
      'name': 'Striped cotton shirt',
      'price': 25,
      'makerCompany': 'Elegance',
      'sizes': 'L|M',
      'colors': 'Yello|Green|Orang',
      'discription': 'a very good striped cotton shirt',
      'imgUrl': 'assets/images/10.jpg',
      'discount': 0,
      'date': MyDataBase.dateToString(DateTime.now())
    },
    {
      'name': 'Grey cotton shirt',
      'price': 10,
      'makerCompany': 'Elegance',
      'sizes': 'L|XL',
      'colors': 'Red|Blue',
      'discription': 'a very good Grey cotton shirt',
      'imgUrl': 'assets/images/9.jpg',
      'discount': 0,
      'date': MyDataBase.dateToString(DateTime.now())
    },
    {
      'name': 'Brown cotton shirt',
      'price': 60,
      'makerCompany': 'Elegance',
      'sizes': 'L|XL|M',
      'colors': 'Red|Blue|Brown',
      'discription': 'a very good Brown cotton shirt',
      'imgUrl': 'assets/images/13.jpg',
      'discount': 20,
      'date': MyDataBase.dateToString(DateTime.now())
    },
    {
      'name': 'Black cotton shirt',
      'price': 2,
      'makerCompany': 'Elegance',
      'sizes': 'XL|M',
      'colors': 'Red|Black|Brown',
      'discription': 'a very good Black cotton shirt',
      'imgUrl': 'assets/images/11.jpg',
      'discount': 50,
      'date': MyDataBase.dateToString(DateTime.now())
    },
    {
      'name': 'Coffee polo shirt',
      'price': 100,
      'makerCompany': 'Elegance',
      'sizes': 'L|XL|M',
      'colors': 'Black|Brown',
      'discription': 'a very good Coffee polo  shirt',
      'imgUrl': 'assets/images/1.png',
      'discount': 30,
      'date': MyDataBase.dateToString(DateTime.now())
    },
  ];
}
