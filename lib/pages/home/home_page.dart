import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_course_app/common/values/colors.dart';
import 'package:learning_course_app/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 25.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageText(
              "hello",
              color: AppColors.primaryThreeElementText,
            ),

            //
            homePageText(
              "Idham Ganteng",
              color: AppColors.primaryText,
              top: 5,
            )
          ],
        ),
      ),
    );
  }
}
