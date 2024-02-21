import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_course_app/pages/profile/settings/bloc/settings_events.dart';
import 'package:learning_course_app/pages/profile/settings/bloc/settings_states.dart';

class SettingsBlocs extends Bloc<SettingEvents, SettingStates> {
  SettingsBlocs() : super(const SettingStates()) {
    on<TriggerSettings>(_triggerSettings);
  }
  _triggerSettings(SettingEvents event, Emitter<SettingStates> emit) {
    emit(SettingStates());
  }
}
