import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/common/routes/names.dart';
import 'package:learning_course_app/common/values/constant.dart';
import 'package:learning_course_app/global.dart';
import 'package:learning_course_app/pages/apps/bloc/application_blocs.dart';
import 'package:learning_course_app/pages/apps/bloc/application_events.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_events.dart';
import 'package:learning_course_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:learning_course_app/pages/profile/settings/bloc/settings_states.dart';
import 'package:learning_course_app/pages/profile/settings/widgets/settings_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<ApplicationBlocs>().add(const TriggerApplicationEvents(0));
    context.read<HomePageBlocs>().add(const HomePageDots(0));

    Global.storageService.remove(AppConstant.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstant.STORAGE_USER_PROFILE_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN_PAGE, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarSettings(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingStates>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(
                    context,
                    removeUserData,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
