import 'package:check_internet_connectivity_using_bloc/Counter/CounterBloc/counter_bloc.dart';
import 'package:check_internet_connectivity_using_bloc/InernetConnectivity/InternetConnectivityBloc/internet_connectivity_bloc.dart';
import 'package:check_internet_connectivity_using_bloc/InernetConnectivity/InternetConnectivityCubit/Internet_connectivity_cubit.dart';
import 'package:check_internet_connectivity_using_bloc/InernetConnectivity/Ui/internet_connectivity_cubit_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<InternetBloc>(
          create: (context) => InternetBloc(),
        ),
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: /* const CounterUIPage(
          title: 'Counter Bloc Example',
        ), 
           const InternetConnectivityBlocUiPage(
          title: 'Internet Conncetivity Bloc Example',
        ),*/
            const InternetCubitUiPage(
          title: 'Internet Conncetivity Cubit Example',
        ),
      ),
    );
  }
}
