import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/pages/application/application_widgets.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Scaffold(
            body: SafeArea(
              child: buildPage(state.index),
            ),
            bottomNavigationBar: Container(
              width: double.maxFinite,
              height: 58.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      // offset: Offset(0, 4),
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ]),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                currentIndex: state.index,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourElementText,
                onTap: (value) {
                  context.read<AppBloc>().add(TriggerEvent(value));
                },
                items: getBottomTabs(state),
              ),
            ),
          ),
        );
      },
    );
  }
}
