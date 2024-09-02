import 'dart:async';

import 'package:check_internet_connectivity_using_bloc/Counter/counterBloc/counter_event.dart';
import 'package:check_internet_connectivity_using_bloc/Counter/counterBloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(CounterInitialState()) {
    on<IncrementCounterEvent>(_onIncrement);
    on<DecrementCounterEvent>(_onDecrement);
  }

  FutureOr<void> _onIncrement(
      IncrementCounterEvent event, Emitter<CounterState> emit) {
    counter = counter + 1;
    emit(UpdateCounterState(count: counter));
    emit(IncrementCounterActionState());
  }

  FutureOr<void> _onDecrement(
      DecrementCounterEvent event, Emitter<CounterState> emit) {
    counter = counter - 1;
    emit(UpdateCounterState(count: counter));
    emit(DecrementCounterActionState());
  }
}
