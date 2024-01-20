import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/pages/sign_in/bloc/signin_events.dart';
import 'package:learning_course_app/pages/sign_in/bloc/signin_states.dart';

class SignInBlocs extends Bloc<SignInEvents, SignInStates> {
  SignInBlocs() : super(const SignInStates()) {
    on<EmailEvents>(_emailEvents);

    on<PasswordEvents>(_passwordEvents);

    //   on<PasswordEvents>((event, emit) {
    //     emit(state.copyWith(password: event.password));
    //   });
  }

  void _emailEvents(EmailEvents event, Emitter<SignInStates> emit) {
    print("My Email is ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvents(PasswordEvents event, Emitter<SignInStates> emit) {
    print("My Password is ${event.password}");
    emit(state.copyWith(password: event.password));
  }
}
