import 'package:equatable/equatable.dart';

class CounterStates extends Equatable {
  final int counter;

  const CounterStates({
    //Initially the value of counter will be 0
    this.counter = 0,
  });

  // copy with method ju keh new instance create karega

  CounterStates copyWith({int? counter}) {
    return CounterStates(counter: counter ?? this.counter);
  }

  //Override method and pass all the variables of the class to list of object
  @override
  List<Object> get props => [counter];
}
