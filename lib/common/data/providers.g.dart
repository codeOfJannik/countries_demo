// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gqlCountryApiHash() => r'c23bc01731222a97fbdc6e85c0d3176019890235';

/// See also [gqlCountryApi].
@ProviderFor(gqlCountryApi)
final gqlCountryApiProvider = AutoDisposeProvider<GqlCountryApi>.internal(
  gqlCountryApi,
  name: r'gqlCountryApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gqlCountryApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GqlCountryApiRef = AutoDisposeProviderRef<GqlCountryApi>;
String _$selectedLocaleHash() => r'8bd7eeb35491bf13085fb506f7102f71aa2593c5';

/// See also [SelectedLocale].
@ProviderFor(SelectedLocale)
final selectedLocaleProvider =
    AutoDisposeNotifierProvider<SelectedLocale, Locale>.internal(
  SelectedLocale.new,
  name: r'selectedLocaleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedLocaleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedLocale = AutoDisposeNotifier<Locale>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
