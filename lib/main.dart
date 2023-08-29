import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';
import 'featurs/auth/blocs/blocs.dart';
import 'featurs/auth/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => VisiblePsswordBloc(),
    ),
    BlocProvider(
      create: (context) => EmailTextBloc(),
    ),
    BlocProvider(
      create: (context) => SignUpBlocBloc(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
      ),
    );
  }
}
