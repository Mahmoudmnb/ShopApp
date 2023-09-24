import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:shop_app/featurs/auth/models/user_model.dart';
import 'package:shop_app/featurs/auth/pages/splash_screen.dart';
import 'package:shop_app/featurs/main_page/main_page.dart';

import 'core/constant.dart';
import 'featurs/auth/blocs/auth_blocs.dart';
import 'featurs/main_page/featurs/home/blocs/discount/discount_products_bloc.dart';
import 'featurs/main_page/featurs/products_view/cubits/product_screen/cubit.dart';
import 'featurs/main_page/featurs/search/cubit/sreach_cubit.dart';
import 'injection.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Constant.supabaseUrl,
    anonKey: Constant.supabaseAnonkey,
  );
  init();
  SharedPreferences db = await SharedPreferences.getInstance();

  String? user = db.getString('currentUser');
  if (user != null) {
    Constant.currentUser = UserModel.fromJson(user);
  }
  runApp(MultiBlocProvider(providers: [
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
    BlocProvider(
      create: (context) => DiscountProductsBloc(),
    ),
    BlocProvider(
      create: (context) => SearchCubit(),
    ),
    BlocProvider(
      create: (context) => ProductCubit(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: sl.get<SharedPreferences>().getBool('isFirstTime') == null
              ? const SplashScreen()
              : const MainPage()),
    );
  }
}
