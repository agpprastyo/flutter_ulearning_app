import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/pages/common_widgets.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
            color: Colors.white,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Log In'),
              body: SafeArea(
                child: LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    // physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                          minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildThirdPartyLogin(context),
                            Center(
                                child: reusableText(
                                    'or use your email account to login')),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 66.h),
                                padding:
                                    EdgeInsets.only(left: 25.w, right: 25.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    reusableText('E-mail'),
                                    buildTextField(
                                      hintText: 'Enter your email address',
                                      textType: 'email',
                                      iconName: 'user',
                                      onChanged: (value) {
                                        context
                                            .read<SignInBloc>()
                                            .add(EmailEvent(value));
                                      },
                                    ),
                                    reusableText('Password'),
                                    buildTextField(
                                      hintText: 'Enter your password',
                                      textType: 'password',
                                      iconName: 'lock',
                                      onChanged: (value) {
                                        context
                                            .read<SignInBloc>()
                                            .add(PasswordEvent(value));
                                      },
                                    ),
                                    forgotPassword(),
                                  ],
                                ),
                              ),
                            ),
                            buildLoginAndRegisterButton(
                              'Login',
                              'login',
                              () {
                                print('login button');
                                SignInController(context: context)
                                    .handleSignIn('email');
                              },
                            ),
                            buildLoginAndRegisterButton(
                              'Sign Up',
                              'register',
                              () {
                                print('going to register screen');
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.REGISTER);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ));
      },
    );
  }
}
