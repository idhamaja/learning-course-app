import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/pages/register/bloc/register_blocs.dart';
import 'package:learning_course_app/pages/sign_in/bloc/signin_blocs.dart';
import 'package:learning_course_app/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProvider {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBlocs()),
        // BlocProvider(lazy: false, create: (context) => AppBlocs()),
        BlocProvider(create: (context) => SignInBlocs()),
        BlocProvider(create: (context) => RegisterBlocs()),
      ];
}
