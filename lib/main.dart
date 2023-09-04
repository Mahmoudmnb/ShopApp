import 'package:flutter/material.dart';
import 'package:shop_app/featurs/home/pages/main_page.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'featurs/auth/blocs/auth_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://eujauxjltyekeqyohodz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV1amF1eGpsdHlla2VxeW9ob2R6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg2NDM3MzYsImV4cCI6MjAwNDIxOTczNn0.IsX_pZLfNmrYPYGhqH8yZ31Zz5mt9XSztN4Mv1MPlZw',
  );
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
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
        // home: FutureBuilder(
        //   future: SharedPreferences.getInstance(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData &&
        //         snapshot.data!.getString('currentUser') != null) {
        //       return const MainPage();
        //     } else {
        //       return const AuthPage();
        //     }
        //   },
        // ),
      ),
    );
  }
}

