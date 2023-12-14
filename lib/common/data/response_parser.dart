import 'package:equatable/equatable.dart';

abstract class ApiResponseParser<T> extends Equatable {
  T parse(Map<String, dynamic>? json);
}
