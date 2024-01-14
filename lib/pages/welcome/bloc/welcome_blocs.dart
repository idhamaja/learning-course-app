import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/pages/welcome/bloc/welcome_events.dart';
import 'package:learning_course_app/pages/welcome/bloc/welcome_states.dart';

class WelcomeBlocs extends Bloc<WelcomeEvents, WelcomeStates> {
  WelcomeBlocs() : super(WelcomeStates()) {
    print("WELCOME BLOCS");
    on<WelcomeEvents>((event, emit) {
      emit(WelcomeStates(page: state.page));
    });
  }
}
