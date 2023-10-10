import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constant.dart';
import 'featurs/auth/blocs/email_text_bloc/email_text_bloc.dart';
import 'featurs/auth/blocs/sign_in_loading/sign_in_loading_bloc.dart';
import 'featurs/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'featurs/auth/blocs/visible_password_bloc/visible_password_bloc.dart';
import 'featurs/auth/models/user_model.dart';
import 'featurs/auth/pages/splash_screen.dart';
import 'featurs/main_page/cubit/main_page_cubit.dart';
import 'featurs/main_page/featurs/home/blocs/discount/discount_products_bloc.dart';
import 'featurs/main_page/featurs/orders/cubit/orders_cubit.dart';
import 'featurs/main_page/featurs/products_view/cubits/product_screen/cubit.dart';
import 'featurs/main_page/featurs/profile/profile/cubit/profile_cubit.dart';
import 'featurs/main_page/featurs/search/cubit/sreach_cubit.dart';
import 'featurs/main_page/main_page.dart';
import 'injection.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Constant.supabaseUrl,
    anonKey: Constant.supabaseAnonkey,
  );
  init();
  SharedPreferences db = await SharedPreferences.getInstance();
  Constant.setDeviceSize();
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
    BlocProvider(
      create: (context) => MainPageCubit(),
    ),
    BlocProvider(
      create: (context) => OrdersCubit(),
    ),
    BlocProvider(
      create: (context) => ProfileCubit(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
          MediaQuery.of(context).size.width, MediaQuery.of(context).size.width),
      child: MaterialApp(
          builder: (context, child) {
            final originalTextScaleFactor =
                MediaQuery.of(context).textScaleFactor;
            final boldText = MediaQuery.boldTextOf(context);
            final newMediaQueryData = MediaQuery.of(context).copyWith(
              textScaleFactor: originalTextScaleFactor.clamp(1, 1.0),
              boldText: boldText,
            );

            return MediaQuery(
              data: newMediaQueryData,
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          home: sl.get<SharedPreferences>().getBool('isFirstTime') == null
              ? SplashScreen(
                  deviceHeight: 100.h,
                  deviceWidth: 100.w,
                )
              : const MainPage()),
    );
  }
}
