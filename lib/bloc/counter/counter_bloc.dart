import 'package:bloc/bloc.dart';
import 'package:block_practices/bloc/counter/counter_events.dart';
import 'package:block_practices/bloc/counter/counter_states.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  //Constructor of COunterBloc
  CounterBloc() : super(CounterStates()) {
    on<IncreamentCounter>(_increamentCounter);
    on<DecreamentCounter>(_decreamentCounter);
  }

  void _increamentCounter(
    IncreamentCounter event,
    Emitter<CounterStates> emit,
  ) {
    //Emit work as a setState
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decreamentCounter(
    DecreamentCounter event,
    Emitter<CounterStates> emit,
  ) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
