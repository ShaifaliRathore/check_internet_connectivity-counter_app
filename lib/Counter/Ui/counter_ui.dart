import 'package:check_internet_connectivity_using_bloc/Counter/counterBloc/counter_bloc.dart';
import 'package:check_internet_connectivity_using_bloc/Counter/counterBloc/counter_event.dart';
import 'package:check_internet_connectivity_using_bloc/Counter/counterBloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterUIPage extends StatefulWidget {
  const CounterUIPage({super.key, required this.title});
  final String title;

  @override
  State<CounterUIPage> createState() => _CounterUIPageState();
}

class _CounterUIPageState extends State<CounterUIPage> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
        bloc: _counterBloc,
        listenWhen: (previous, current) => current is CounterActionState,
        buildWhen: (previous, current) => current is! CounterActionState,
        listener: (context, state) {
          if (state is IncrementCounterActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Count is increased by 1'),
                backgroundColor: Colors.green,
              ),
            );
          }

          if (state is DecrementCounterActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Count is decreased by 1'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CounterInitialState) {
            return _counterWidget(context, 0);
          }
          if (state is UpdateCounterState) {
            return _counterWidget(context, state.count);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _counterWidget(context, count) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times: $count',
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _counterBloc.add(
                IncrementCounterEvent(),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            ElevatedButton(
              onPressed: () => _counterBloc.add(
                DecrementCounterEvent(),
              ),
              child: const Icon(
                Icons.remove,
                color: Colors.red,
              ),
            )
          ],
        )
      ],
    );
  }
}
