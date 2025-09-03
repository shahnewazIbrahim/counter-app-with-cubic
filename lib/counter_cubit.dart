import 'package:bloc/bloc.dart';

/// A super simple Cubit that holds an `int` as the counter value.
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void reset() => emit(0);
}
