
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Counter'),
			),
			body: Center(
				child: BlocBuilder<CounterCubit, int>(
					builder: (context, count) {
						return Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								Text(
									'Counter Value:',
								),
								Text(
									'$count',
									style: Theme.of(context).textTheme.headline4,
								),
							],
						);
					},
				),
			),
			floatingActionButton: Column(
				mainAxisAlignment: MainAxisAlignment.end,
				children: <Widget>[
					FloatingActionButton(
						onPressed: () => context.read<CounterCubit>().increment(),
						tooltip: 'Increment by 2',
						child: Icon(Icons.add),
					),
					SizedBox(height: 8),
					FloatingActionButton(
						onPressed: () => context.read<CounterCubit>().decrement(),
						tooltip: 'Decrement',
						child: Icon(Icons.remove),
					),
				],
			),
		);
	}
}
