import 'dart:async';

import 'package:check_internet_connectivity_using_bloc/InernetConnectivity/InternetConnectivityBloc/internet_connectivity_event.dart';
import 'package:check_internet_connectivity_using_bloc/InernetConnectivity/InternetConnectivityBloc/internet_connectivity_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetGainedEvent>(
      (event, emit) => emit(InternetGainedState()),
    );

    on<InternetLostEvent>(
      (event, emit) => emit(InternetLostState()),
    );

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
