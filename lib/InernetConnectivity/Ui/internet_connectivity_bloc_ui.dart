import 'package:check_internet_connectivity_using_bloc/InernetConnectivity/InternetConnectivityBloc/internet_connectivity_bloc.dart';
import 'package:check_internet_connectivity_using_bloc/InernetConnectivity/InternetConnectivityBloc/internet_connectivity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBlocUiPage extends StatelessWidget {
  const InternetBlocUiPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Connected to internet'),
                backgroundColor: Colors.green,
              ),
            );
          }
          if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Not connected to internet'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is InternetGainedState) {
            return const Center(
              child: Text(
                'Internet is connected',
                style: TextStyle(color: Colors.green),
              ),
            );
          } else if (state is InternetLostState) {
            return const Center(
              child: Text(
                'Internet is not connected',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(
              child: Text('Loading...'),
            );
          }
        },
      ),
    );
  }
}
