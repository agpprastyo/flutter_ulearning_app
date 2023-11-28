import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/common_widgets.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/register_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
            color: Colors.white,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Register'),
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
                            Center(
                                child: reusableText(
                                    'Enter you details below & free sign up')),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 42.h),
                                padding:
                                    EdgeInsets.only(left: 25.w, right: 25.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    reusableText('User name'),
                                    buildTextField(
                                      'Enter your user name',
                                      'name',
                                      'user',
                                      (value) {
                                        context
                                            .read<RegisterBloc>()
                                            .add(UsernameEvent(value));
                                      },
                                    ),
                                    reusableText('E-mail'),
                                    buildTextField(
                                      'Enter your email address',
                                      'email',
                                      'user',
                                      (value) {
                                        context
                                            .read<RegisterBloc>()
                                            .add(EmailEvent(value));
                                      },
                                    ),
                                    reusableText('Password'),
                                    buildTextField(
                                      'Enter your password',
                                      'password',
                                      'lock',
                                      (value) {
                                        context
                                            .read<RegisterBloc>()
                                            .add(PasswordEvent(value));
                                      },
                                    ),
                                    reusableText('Confirm Password'),
                                    buildTextField(
                                      'Enter your confirm password',
                                      'password',
                                      'lock',
                                      (value) {
                                        context
                                            .read<RegisterBloc>()
                                            .add(RePasswordEvent(value));
                                      },
                                    ),
                                    reusableText('''
By creating an account you have to agree\nwith our term and conditions
''')
                                  ],
                                ),
                              ),
                            ),
                            buildLoginAndRegisterButton(
                              'Sign Up',
                              'login',
                              () {
                                // Navigator.of(context).pushNamed("register");
                                RegisterController(context)
                                    .handleEmailRegister();
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
