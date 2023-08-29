import 'package:flutter_bloc/flutter_bloc.dart';
import '../featurs/auth/blocs/blocs.dart';
import '../featurs/auth/models/user_model.dart';

class Constant {
  static UserModel? currentUser;
  static Duration duration = const Duration(milliseconds: 500);
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
}
