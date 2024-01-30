import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_course_app/common/values/colors.dart';
import 'package:learning_course_app/pages/bloc_providers.dart';
import 'package:learning_course_app/pages/register/register_page.dart';
import 'package:learning_course_app/pages/sign_in/sign_in.dart';
import 'package:learning_course_app/pages/welcome/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //     // options: DefaultFirebaseOptions.currentPlatform,
  //     );

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'AIzaSyB9EO3n2kuVUrGnaM-Av7-KV6Sl3ZmJLPc',
          appId: '1:542407611065:android:c4d9a8a0df121c9c6fc168',
          messagingSenderId: '542407611065',
          projectId: 'learning-course-app',
        ))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.allBlocProviders,
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
          home: const WelcomePage(),
          routes: {
            "signIn": (context) => const SignIn(),
            "register": (context) => const RegisterPage(),
          },
        ),
      ),
    );
  }
}
