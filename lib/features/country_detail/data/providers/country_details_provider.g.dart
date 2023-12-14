// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countryDetailsHash() => r'ed6ffbfccf45e729b5e528fcb4033309b170db33';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [countryDetails].
@ProviderFor(countryDetails)
const countryDetailsProvider = CountryDetailsFamily();

/// See also [countryDetails].
class CountryDetailsFamily extends Family<AsyncValue<CountryDetails>> {
  /// See also [countryDetails].
  const CountryDetailsFamily();

  /// See also [countryDetails].
  CountryDetailsProvider call(
    Country country,
  ) {
    return CountryDetailsProvider(
      country,
    );
  }

  @override
  CountryDetailsProvider getProviderOverride(
    covariant CountryDetailsProvider provider,
  ) {
    return call(
      provider.country,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'countryDetailsProvider';
}

/// See also [countryDetails].
class CountryDetailsProvider extends AutoDisposeFutureProvider<CountryDetails> {
  /// See also [countryDetails].
  CountryDetailsProvider(
    Country country,
  ) : this._internal(
          (ref) => countryDetails(
            ref as CountryDetailsRef,
            country,
          ),
          from: countryDetailsProvider,
          name: r'countryDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$countryDetailsHash,
          dependencies: CountryDetailsFamily._dependencies,
          allTransitiveDependencies:
              CountryDetailsFamily._allTransitiveDependencies,
          country: country,
        );

  CountryDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.country,
  }) : super.internal();

  final Country country;

  @override
  Override overrideWith(
    FutureOr<CountryDetails> Function(CountryDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CountryDetailsProvider._internal(
        (ref) => create(ref as CountryDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        country: country,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CountryDetails> createElement() {
    return _CountryDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CountryDetailsProvider && other.country == country;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, country.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CountryDetailsRef on AutoDisposeFutureProviderRef<CountryDetails> {
  /// The parameter `country` of this provider.
  Country get country;
}

class _CountryDetailsProviderElement
    extends AutoDisposeFutureProviderElement<CountryDetails>
    with CountryDetailsRef {
  _CountryDetailsProviderElement(super.provider);

  @override
  Country get country => (origin as CountryDetailsProvider).country;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
