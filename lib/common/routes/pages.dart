import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/common/routes/names.dart';
import 'package:learning_course_app/pages/apps/application_page.dart';
import 'package:learning_course_app/pages/apps/bloc/application_blocs.dart';
import 'package:learning_course_app/pages/register/bloc/register_blocs.dart';
import 'package:learning_course_app/pages/register/register_page.dart';
import 'package:learning_course_app/pages/sign_in/bloc/signin_blocs.dart';
import 'package:learning_course_app/pages/sign_in/sign_in.dart';
import 'package:learning_course_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:learning_course_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIALROUTE,
        page: const WelcomePage(),
        bloc: BlocProvider(
          create: (_) => WelcomeBlocs(),
        ),
      ),

      //
      PageEntity(
        route: AppRoutes.SIGN_IN_PAGE,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBlocs(),
        ),
      ),

      //
      PageEntity(
        route: AppRoutes.REGISTER_PAGE,
        page: const RegisterPage(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),

      //
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => ApplicationBlocs(),
        ),
      ),
    ];
  }

  //return all the BLOC Providers
  static List<dynamic> allProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //a model that covers entire sceen as we click an navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for the route name marching when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        print("valid route name ${settings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
