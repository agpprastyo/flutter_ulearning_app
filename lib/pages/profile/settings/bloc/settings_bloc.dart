import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<TriggerSettings>(_triggerSettings);
  }

  void _triggerSettings(TriggerSettings event, Emitter<SettingsState> emit) {
    emit(const SettingsState());
  }
}
