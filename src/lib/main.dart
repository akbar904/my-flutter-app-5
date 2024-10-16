
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/counter_cubit.dart';
import 'screens/counter_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Simple Counter App',
			home: BlocProvider(
				create: (_) => CounterCubit(),
				child: CounterScreen(),
			),
		);
	}
}
