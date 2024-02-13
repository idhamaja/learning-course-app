import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_course_app/common/routes/pages.dart';
import 'package:learning_course_app/common/values/colors.dart';
import 'package:learning_course_app/global.dart';

import 'common/routes/routes.dart';

Future<void> main() async {
  await global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allProviders(context).toList()],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.primaryText,
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          )),
          // home: const WelcomePage(),
          onGenerateRoute: AppPages.GenerateRouteSettings,
          // initialRoute: "/",
          // routes: {
          //   "signIn": (context) => const SignIn(),
          //   "register": (context) => const RegisterPage(),
          // },
        ),
      ),
    );
  }
}
