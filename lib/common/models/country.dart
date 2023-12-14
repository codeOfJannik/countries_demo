import 'package:countries_demo/common/constants/json_keys.dart';
import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String name;
  final String flagEmoji;
  final String code;

  const Country({
    required this.code,
    required this.name,
    required this.flagEmoji,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json[JsonKeys.code] as String,
      name: json[JsonKeys.name] as String,
      flagEmoji: json[JsonKeys.emoji] as String,
    );
  }

  @override
  List<Object?> get props => [name, flagEmoji];
}
