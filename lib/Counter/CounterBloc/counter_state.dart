abstract class CounterState {}

class CounterInitialState extends CounterState {}

class CounterActionState extends CounterState {}

class IncrementCounterActionState extends CounterActionState {}

class DecrementCounterActionState extends CounterActionState {}

class UpdateCounterState extends CounterState {
  final int count;

  UpdateCounterState({required this.count});
}
