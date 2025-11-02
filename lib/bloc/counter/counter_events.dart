import 'package:equatable/equatable.dart';

abstract class CounterEvents extends Equatable {
  //Constructor of CcunterEvents
  const CounterEvents();

  // Override method
  @override
  List<Object> get props => [];
}

// Events of CounterEvents class

class IncreamentCounter extends CounterEvents {}

class DecreamentCounter extends CounterEvents {}
