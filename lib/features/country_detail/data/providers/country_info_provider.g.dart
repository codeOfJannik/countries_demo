// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countryInfoHash() => r'74da4b5b0791dee001bd7bded65793c95bff0549';

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

/// See also [countryInfo].
@ProviderFor(countryInfo)
const countryInfoProvider = CountryInfoFamily();

/// See also [countryInfo].
class CountryInfoFamily extends Family<AsyncValue<CountryInfo>> {
  /// See also [countryInfo].
  const CountryInfoFamily();

  /// See also [countryInfo].
  CountryInfoProvider call(
    Country country,
  ) {
    return CountryInfoProvider(
      country,
    );
  }

  @override
  CountryInfoProvider getProviderOverride(
    covariant CountryInfoProvider provider,
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
  String? get name => r'countryInfoProvider';
}

/// See also [countryInfo].
class CountryInfoProvider extends AutoDisposeFutureProvider<CountryInfo> {
  /// See also [countryInfo].
  CountryInfoProvider(
    Country country,
  ) : this._internal(
          (ref) => countryInfo(
            ref as CountryInfoRef,
            country,
          ),
          from: countryInfoProvider,
          name: r'countryInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$countryInfoHash,
          dependencies: CountryInfoFamily._dependencies,
          allTransitiveDependencies:
              CountryInfoFamily._allTransitiveDependencies,
          country: country,
        );

  CountryInfoProvider._internal(
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
    FutureOr<CountryInfo> Function(CountryInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CountryInfoProvider._internal(
        (ref) => create(ref as CountryInfoRef),
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
  AutoDisposeFutureProviderElement<CountryInfo> createElement() {
    return _CountryInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CountryInfoProvider && other.country == country;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, country.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CountryInfoRef on AutoDisposeFutureProviderRef<CountryInfo> {
  /// The parameter `country` of this provider.
  Country get country;
}

class _CountryInfoProviderElement
    extends AutoDisposeFutureProviderElement<CountryInfo> with CountryInfoRef {
  _CountryInfoProviderElement(super.provider);

  @override
  Country get country => (origin as CountryInfoProvider).country;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
