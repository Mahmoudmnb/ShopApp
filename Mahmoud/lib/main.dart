import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanadprojecttest/Elegance/cubit/sreach_cubit.dart';
import 'package:sanadprojecttest/Elegance/orders/cubit/orders_cubit.dart';
import 'package:sanadprojecttest/Elegance/search_screen.dart';
import 'package:sanadprojecttest/check_out/cubit/check_out_cubit.dart';
import 'package:sanadprojecttest/profile/cubit/profile_cubit.dart';
import 'package:sanadprojecttest/profile/screen/profile.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SearchCubit(),
      ),
      BlocProvider(
        create: (context) => CheckOutCubit(),
      ),
      BlocProvider(
        create: (context) => ProfileCubit(),
      ),
      BlocProvider(
        create: (context) => OrdersCubit(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const Search1(),
      ),
    );
  }
}
