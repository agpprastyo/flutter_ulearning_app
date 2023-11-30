import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/pages.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/common/routes/bloc_providers.dart';

Future<void> main() async {
  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // providers: AppBlocProviders.allBlocProviders,
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: false,
          builder: (_, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  scrolledUnderElevation: 0,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal),
                ),
                colorScheme:
                    ColorScheme.fromSeed(seedColor: AppColors.primaryElement),
                useMaterial3: true,
              ),
              // home: const Welcome(),
              initialRoute: '/',
              onGenerateRoute: AppPages().GenerateRouteSettings,
              // routes: {
              //   // 'myHomePage': (context) => const MyHomePage(),
              //
              //   'application': (context) => const ApplicationPage(),
              //   'welcome': (context) => const Welcome(),
              //   'signIn': (context) => const SignIn(),
              //   'register': (context) => const Register(),
              // },
            );
          }),
    );
  }
}
