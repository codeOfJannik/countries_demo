import 'package:collection/collection.dart';
import 'package:countries_demo/common/constants/json_keys.dart';
import 'package:countries_demo/common/models/country.dart';
import 'package:equatable/equatable.dart';

class Continent extends Equatable {
  final String name;
  final String code;
  final Iterable<Country> countries;

  Continent({required this.name, required this.code, required this.countries});

  factory Continent.fromJson(Map<String, dynamic> json) {
    return Continent(
      name: json[JsonKeys.name] as String,
      code: json[JsonKeys.code] as String,
      countries: (json[JsonKeys.countries] as List<dynamic>).map((e) {
        if (e is! Map<String, dynamic>) return null;
        return Country.fromJson(e);
      }).whereNotNull(),
    );
  }

  @override
  List<Object?> get props => [name, code, countries];
}
