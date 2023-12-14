import 'package:countries_demo/common/data/query.dart';
import 'package:equatable/equatable.dart';

class CountryInfoQuery extends Equatable implements Query {
  final String countryCode;

  const CountryInfoQuery({
    required this.countryCode,
  });

  @override
  String get gqlQuery => """
    query {
      country(code: "$countryCode") {
        native
        capital
        currency
      }
    }
  """;

  @override
  List<Object?> get props => [countryCode];
}
