import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_course_app/common/entities/entities.dart';
import 'package:learning_course_app/common/routes/names.dart';
import 'package:learning_course_app/common/values/colors.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_course_app/pages/home/bloc/home_page_states.dart';
import 'package:learning_course_app/pages/home/home_controller.dart';
import 'package:learning_course_app/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserItem userProfile;

  @override
  void initState() {
    super.initState();
    // _homeController = HomeController(context: context);
    // _homeController.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(userProfile!.avatar.toString()),
        body: BlocBuilder<HomePageBlocs, HomePageStates>(
          builder: (context, state) {
            // print("Check My Status COURSE ITEM ${state.courseItem}");
            if (state.courseItem.isEmpty) {
              HomeController(context: context).init();
              print("COURSE IS EMPTY");
            } else {
              print("state.course IS NOT EMPTY");
            }
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 25.w,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: homePageText(
                      "Welcome",
                      color: AppColors.primaryThreeElementText,
                    ),
                  ),
                  //
                  SliverToBoxAdapter(
                    child: homePageText(
                      userProfile!.name!,
                      color: AppColors.primaryText,
                      top: 5,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: searchView(),
                  ),
                  SliverToBoxAdapter(
                    child: slidersMenuView(context, state),
                  ),
                  SliverToBoxAdapter(
                    child: menuCourseView(),
                  ),

                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 18.h,
                      horizontal: 0.w,
                    ),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.courseItem.length,
                        (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  AppRoutes.COURSE_DETAIL,
                                  arguments: {
                                    "id": state.courseItem.elementAt(index).id
                                  });
                            },
                            child: courseMenurGrid(state.courseItem[index]),
                          );
                        },
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
