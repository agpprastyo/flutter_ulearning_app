import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/common/values/constants.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_bloc.dart';

import '../../../global.dart';
import '../settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBloc>().add(const TriggerEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context).pop();
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

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
                  settingButton(context, removeUserData),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
