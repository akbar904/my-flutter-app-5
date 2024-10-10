
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'counter_cubit.dart';

class MockCounterCubit extends Mock implements CounterCubit {}

void main() {
	group('CounterCubit', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = CounterCubit();
		});

		tearDown(() {
			counterCubit.close();
		});

		test('initial state is 0', () {
			expect(counterCubit.state, equals(0));
		});

		blocTest<CounterCubit, int>(
			'emits [1] when increment is called',
			build: () => counterCubit,
			act: (cubit) => cubit.increment(),
			expect: () => [1],
		);

		blocTest<CounterCubit, int>(
			'emits [-1] when decrement is called',
			build: () => counterCubit,
			act: (cubit) => cubit.decrement(),
			expect: () => [-1],
		);

		blocTest<CounterCubit, int>(
			'emits [1, 2] when increment is called twice',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.increment();
			},
			expect: () => [1, 2],
		);

		blocTest<CounterCubit, int>(
			'emits [-1, -2] when decrement is called twice',
			build: () => counterCubit,
			act: (cubit) {
				cubit.decrement();
				cubit.decrement();
			},
			expect: () => [-1, -2],
		);

		blocTest<CounterCubit, int>(
			'emits [1, 0] when increment and then decrement is called',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.decrement();
			},
			expect: () => [1, 0],
		);
	});
}
