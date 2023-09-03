import 'package:dio/dio.dart';

abstract class DatatState<T> {
  final T? data;
  final DioException? error;
  const DatatState({
    this.data,
    this.error,
  });
}

class DataSuccess<T> extends DatatState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DatatState<T> {
  const DataFailed(DioException error) : super(error: error);
}
