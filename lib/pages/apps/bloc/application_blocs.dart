import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/pages/apps/bloc/application_events.dart';
import 'package:learning_course_app/pages/apps/bloc/application_states.dart';

class ApplicationBlocs extends Bloc<ApplicationEvents, Application_States> {
  ApplicationBlocs() : super(const Application_States()) {
    on<TriggerApplicationEvents>((event, emit) {
      print("my tapped index is ${event.index}");
      emit(Application_States(index: event.index));
    });
  }
}
