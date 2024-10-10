
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_counter/screens/counter_screen.dart';
import 'package:simple_counter/cubits/counter_cubit.dart';

// Mock CounterCubit for testing
class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('CounterScreen', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = MockCounterCubit();
		});

		testWidgets('displays initial counter value', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (context) => counterCubit,
						child: CounterScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('increments counter when "+" button is tapped', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);
			whenListen(counterCubit, Stream.fromIterable([0, 1]));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (context) => counterCubit,
						child: CounterScreen(),
					),
				),
			);

			await tester.tap(find.byIcon(Icons.add));
			await tester.pump();

			verify(() => counterCubit.increment()).called(1);
			expect(find.text('1'), findsOneWidget);
		});

		testWidgets('decrements counter when "-" button is tapped', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);
			whenListen(counterCubit, Stream.fromIterable([0, -1]));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (context) => counterCubit,
						child: CounterScreen(),
					),
				),
			);

			await tester.tap(find.byIcon(Icons.remove));
			await tester.pump();

			verify(() => counterCubit.decrement()).called(1);
			expect(find.text('-1'), findsOneWidget);
		});
	});
}
