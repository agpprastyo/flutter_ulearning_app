import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/application_page.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/home/home_page.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/settings_page.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
            create: (_) =>
                WelcomeBloc()), // Assuming WelcomeBloc extends BlocBase
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBloc()),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const SettingsPage(),
        bloc: BlocProvider(create: (_) => SettingsBloc()),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLogin = Global.storageService.getIsLogin();
          if (isLogin) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    print('invalid route: ${settings.name}');
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

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
