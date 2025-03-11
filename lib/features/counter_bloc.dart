import 'package:bloc/bloc.dart';
import 'package:bloc_flutter_project/features/counter_event.dart';
import 'package:bloc_flutter_project/features/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {
    on<IncrementCount>((event, emit) {
      emit(CounterState(count: state.count + 1));
    });

    on<DecrementCount>((event, emit) {
      emit(CounterState(count: state.count - 1));
    });
  }
}
