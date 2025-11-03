import 'package:bloc/bloc.dart';
import 'package:block_practices/bloc/switch_button_and_slider/switch_button_and_slider_events.dart';
import 'package:block_practices/bloc/switch_button_and_slider/switch_button_and_slider_states.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotifications);
    on<SliderEvents>(_sliderEvents);
  }

  void _enableOrDisableNotifications(
    EnableOrDisableNotification events,
    Emitter<SwitchStates> emit,
  ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderEvents(SliderEvents events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}
