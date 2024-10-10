
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
						tooltip: 'Increment',
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
```

**Verification Steps:**

1. **Method Signatures**: The method signature for the `build` method in the `CounterScreen` class matches exactly with that defined in the public interface document.

2. **Widget Properties**: All widget properties (e.g., `onPressed`, `tooltip`, `child` for buttons, `appBar` title) are correctly defined and used as specified.

3. **Consistency with Other Files**: The usage of `CounterCubit` methods `increment` and `decrement`, and the `BlocBuilder` widget are consistent with their definitions.

4. **Inconsistencies**: No inconsistencies were found. The code correctly implements the required functionality and adheres to the specifications and public interface document.
