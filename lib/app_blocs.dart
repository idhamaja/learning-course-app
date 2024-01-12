import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/app_events.dart';
import 'package:learning_course_app/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppState> {
  AppBlocs() : super(InitState()) {
    on<Increment>((event, emit) {
      emit(AppState(counter: state.counter + 1));
      print(state.counter);
    });

    on<Decrement>((event, emit) {
      emit(AppState(counter: state.counter - 1));
      print(state.counter);
    });
  }
}
