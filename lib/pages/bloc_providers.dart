import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in/bloc/sign_in_bloc.dart';
import 'welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
      ];
}
