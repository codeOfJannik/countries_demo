import 'package:countries_demo/common/constants/json_keys.dart';
import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String name;
  final String nativeName;
  final String code;

  Language({required this.nativeName, required this.name, required this.code});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      nativeName: json[JsonKeys.native] as String,
      name: json[JsonKeys.name] as String,
      code: json[JsonKeys.code] as String,
    );
  }

  @override
  List<Object?> get props => [name, code, nativeName];
}
