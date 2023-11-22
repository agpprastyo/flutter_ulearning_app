import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
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
                            padding: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                reusableText('E-mail'),
                                buildTextField(
                                    'Enter your email address', 'email', 'user',
                                    (value) {
                                  context
                                      .read<SignInBloc>()
                                      .add(EmailEvent(value));
                                }),
                                reusableText('Password'),
                                buildTextField(
                                    'Enter your password', 'password', 'lock',
                                    (value) {
                                  context
                                      .read<SignInBloc>()
                                      .add(PasswordEvent(value));
                                }),
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
                          'Register',
                          'register',
                          () {
                            Navigator.of(context).pushNamed("register");
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
  }
}
