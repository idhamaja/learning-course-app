import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/pages/register/bloc/register_events.dart';
import 'package:learning_course_app/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UsernameEvents>(_usernameEvents);
  }

  void _usernameEvents(UsernameEvents event, Emitter<RegisterStates> emit) {}
}
