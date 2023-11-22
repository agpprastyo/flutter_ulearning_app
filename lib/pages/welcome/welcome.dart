import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/main.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 55.h),
            width: 375.w,
            child: Stack(alignment: AlignmentDirectional.topCenter, children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                },
                children: [
                  _page(
                    1,
                    context,
                    'Next',
                    'First Learning',
                    'Forget about a for of paper all knowledge in one learning app',
                    'assets/images/reading.png',
                  ),
                  _page(
                    2,
                    context,
                    'Next',
                    'Connect with Everyone',
                    'Always keep in touch with your tutor and friends. Let\'s get connected',
                    'assets/images/boy.png',
                  ),
                  _page(
                    3,
                    context,
                    'Get Started',
                    'Always Fascinated Learning',
                    'Anywhere and anytime. The time is at our discretion so study whenever you want',
                    'assets/images/man.png',
                  ),
                ],
              ),
              Positioned(
                bottom: 150.h,
                child: DotsIndicator(
                  position: state.page,
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: AppColors.primaryElement,
                    size: const Size.square(8.0),
                    activeSize: const Size(10.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
                    ),
                  ),
                ),
              )
            ]),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.primaryText),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Center(
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primarySecondaryElementText),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 800),
                curve: Curves.decelerate,
              );
            } else {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //       builder: (context) => const MyHomePage(title: 'title')),
              // );
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
