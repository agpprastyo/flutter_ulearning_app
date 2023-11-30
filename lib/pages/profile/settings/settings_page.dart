import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/common/values/constants.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_bloc.dart';

import '../../../global.dart';
import '../settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shadowColor: Colors.grey.withOpacity(0.2),
                        surfaceTintColor: AppColors.primaryBackground,
                        backgroundColor: AppColors.primaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirm Logout'),
                                content:
                                    Text('Are you sure you want to logout?'),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('Cancel')),
                                  TextButton(
                                      onPressed: () {
                                        Global.storageService.remove(
                                            AppConstants
                                                .STORAGE_USER_TOKEN_KEY);
                                        Navigator.of(context).pop();
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/', (route) => false);
                                      },
                                      child: Text(
                                        'Logout',
                                        style: TextStyle(
                                            color: AppColors.primaryElement,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.sp),
                                      )),
                                ],
                              );
                            });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.h, vertical: 6.h),
                        child: Wrap(
                          spacing: 6.h,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.center,
                          children: [
                            Image.asset('assets/icons/log-out.png'),
                            Text(
                              'Logout',
                              style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
