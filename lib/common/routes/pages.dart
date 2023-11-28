import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static final pages = <PageEntity>[
    PageEntity(
      route: AppRoutes.INITIAL,
      page: const Welcome(),
      bloc: BlocProvider(create: (context) => WelcomeBloc()),
    ),
    PageEntity(
      route: AppRoutes.SIGN_IN,
      page: const SignIn(),
      bloc: BlocProvider(create: (context) => SignInBloc()),
    ),
    PageEntity(
      route: AppRoutes.REGISTER,
      page: const Register(),
      bloc: BlocProvider(create: (context) => RegisterBloc()),
    ),
    PageEntity(
      route: AppRoutes.APPLICATION,
      page: const Welcome(),
      // bloc: BlocProvider(create: (context) => WelcomeBloc()),
    ),
  ];
}

List<dynamic> allProviders = [
  ...AppPages.pages.map((e) => e.bloc).where((element) => element != null),
  for (var page in AppPages.pages)
    if (page.bloc != null) page.bloc
];

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
