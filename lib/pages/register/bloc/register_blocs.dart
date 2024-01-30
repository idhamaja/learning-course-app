import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/pages/register/bloc/register_events.dart';
import 'package:learning_course_app/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UsernameEvents>(_usernameEvents);
    on<EmailEvents>(_emailEvents);
    on<PasswordEvents>(_passwordEvents);
    on<RePasswordEvents>(_rePasswordEvents);
  }

  void _usernameEvents(UsernameEvents event, Emitter<RegisterStates> emit) {
    print("${event.username}");
    emit(state.copyWith(username: event.username));
  }

  void _emailEvents(EmailEvents event, Emitter<RegisterStates> emit) {
    print("${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvents(PasswordEvents event, Emitter<RegisterStates> emit) {
    print("${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvents(RePasswordEvents event, Emitter<RegisterStates> emit) {
    print("${event.rePassword}");
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
