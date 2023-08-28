import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';

import '../blocs/blocs.dart';
import '../data.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextField(
      {super.key, required this.hintText, required this.controller});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return BlocBuilder<Auth1Bloc, Auth1State>(
          builder: (context1, state1) {
            return BlocBuilder<SignUpBlocBloc, SignUpBlocState>(
              builder: (context2, state2) {
                Padding buildTextForm() {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: (state is AuthInitial &&
                              (hintText == 'Password' ||
                                  hintText == 'Confirm Password'))
                          ? true
                          : state is VisiblePassword
                              ? (state.isVisible &&
                                      (hintText == 'Password' ||
                                          hintText == 'Confirm Password'))
                                  ? true
                                  : false
                              : false,
                      keyboardType: hintText == 'Email address'
                          ? TextInputType.emailAddress
                          : hintText == 'Password' ||
                                  hintText == 'Confirm Password'
                              ? TextInputType.visiblePassword
                              : TextInputType.name,
                      validator: (value) {
                        bool isSignUp = false;
                        if (state2 is SignUpBlocInitial) {
                          isSignUp = true;
                        } else if (state2 is IsSignUp) {
                          isSignUp = state2.isSignUp;
                        }
                        return validator(value, isSignUp);
                      },
                      onSaved: (newValue) {
                        onSave(newValue);
                      },
                      onChanged: (value) {
                        if (hintText == 'Password') {
                          Data.tempPassword = value;
                        } else if (hintText == 'Email address') {
                          context
                              .read<Auth1Bloc>()
                              .add(ChangeEmailText(emailText: value));
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: hintText == 'Email address'
                            ? Icon(
                                Icons.check_circle_outline,
                                color: state1 is EmailText
                                    ? (state1.emailText.isEmpty
                                        ? Colors.grey
                                        : (!state1.emailText.contains('@') ||
                                                !state1.emailText
                                                    .contains('.com'))
                                            ? Colors.red
                                            : Colors.green)
                                    : Colors.grey,
                              )
                            : hintText == 'Password'
                                ? IconButton(
                                    onPressed: () {
                                      if (state is AuthInitial) {
                                        context
                                            .read<AuthBloc>()
                                            .add(HidePassword());
                                      } else if (state is VisiblePassword) {
                                        if (state.isVisible) {
                                          context
                                              .read<AuthBloc>()
                                              .add(HidePassword());
                                        } else {
                                          context
                                              .read<AuthBloc>()
                                              .add(ShowPassword());
                                        }
                                      }
                                    },
                                    icon: state is AuthInitial
                                        ? const Icon(Icons.visibility_outlined,
                                            color: Colors.grey)
                                        : state is VisiblePassword
                                            ? Icon(
                                                state.isVisible
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color: Colors.grey)
                                            : const SizedBox.shrink(),
                                  )
                                : null,
                        hintStyle:
                            TextStyle(fontFamily: 'DM Sans', fontSize: 6.sp),
                        hintText: hintText,
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFD6D6D6),
                          ),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFD6D6D6),
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFD6D6D6),
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return state2 is IsSignUp
                    ? !state2.isSignUp &&
                            (hintText == 'Confirm Password' ||
                                hintText == 'Enter your name')
                        ? const SizedBox.shrink()
                        : buildTextForm()
                    : buildTextForm();
              },
            );
          },
        );
      },
    );
  }

  void onSave(String? newValue) {
    if (hintText == 'Enter your name') {
      Data.name = newValue!.trim();
    } else if (hintText == 'Email address') {
      Data.email = newValue!.trim();
    } else if (hintText == 'Password') {
      Data.password = newValue!.trim();
    } else {
      Data.confirmPassword = newValue!.trim();
    }
  }

  String? validator(String? value, bool isSignUp) {
    if (hintText == 'Enter your name' && isSignUp) {
      if (value == null || value.isEmpty || value.length <= 6) {
        return 'Name shold be more than six chrachters';
      }
    } else if (hintText == 'Email address') {
      if (value == null || !value.contains('@') || !value.contains('.com')) {
        return 'Invalid email';
      }
    } else if (hintText == 'Password') {
      if (value == null || value.isEmpty || value.length <= 6) {
        return 'password shold be more than six chrachters';
      }
    } else if (hintText == 'Confirm Password' && isSignUp) {
      if (value == null ||
          value.compareTo(Data.tempPassword) != 0 ||
          value.isEmpty) {
        return "Confirm password is empty or it doesn't match password field ";
      }
    }
    return null;
  }
}
