import 'package:check_internet_connectivity_using_bloc/InernetConnectivity/InternetConnectivityCubit/Internet_connectivity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubitUiPage extends StatelessWidget {
  const InternetCubitUiPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state == InternetState.gained) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Connected to internet'),
                backgroundColor: Colors.green,
              ),
            );
          }
          if (state == InternetState.lost) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Not connected to internet'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state == InternetState.gained) {
            return const Center(
              child: Text(
                'Internet is connected',
                style: TextStyle(color: Colors.green),
              ),
            );
          } else if (state == InternetState.lost) {
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
