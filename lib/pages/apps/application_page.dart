import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_course_app/common/values/colors.dart';
import 'package:learning_course_app/pages/apps/application_widgets.dart';
import 'package:learning_course_app/pages/apps/bloc/application_blocs.dart';
import 'package:learning_course_app/pages/apps/bloc/application_events.dart';
import 'package:learning_course_app/pages/apps/bloc/application_states.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  // int _index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBlocs, Application_States>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 64.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (value) {
                    context
                        .read<ApplicationBlocs>()
                        .add(TriggerApplicationEvents(value));
                  },
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
