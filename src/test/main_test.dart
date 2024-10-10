
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'lib/main.dart';

// Mocking CounterCubit since it's a dependency for MyApp
class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('MyApp', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = MockCounterCubit();
		});

		testWidgets('renders CounterScreen', (WidgetTester tester) async {
			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: counterCubit,
					child: MyApp(),
				),
			);

			expect(find.byType(CounterScreen), findsOneWidget);
		});
	});
}
