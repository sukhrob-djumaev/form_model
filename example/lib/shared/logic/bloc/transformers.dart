import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:rxdart/rxdart.dart';

class AppTransformers {
  static EventTransformer<E> restartableWithDebounce<E>([
    Duration duration = const Duration(milliseconds: 300),
  ]) =>
      (events, mapper) => restartable<E>()(
            events.debounceTime(duration),
            mapper,
          );

  static EventTransformer<E> droppable1<E>() => droppable<E>();
}
