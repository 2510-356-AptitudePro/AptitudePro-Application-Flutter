// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$forumListHash() => r'9ef236b64628cbaa5ab6a6653d98e2ea795556a2';

/// See also [forumList].
@ProviderFor(forumList)
final forumListProvider = AutoDisposeFutureProvider<List<Forum>>.internal(
  forumList,
  name: r'forumListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$forumListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ForumListRef = AutoDisposeFutureProviderRef<List<Forum>>;
String _$forumHash() => r'dabf64a3eef1b807a9620f105d692b942089e9c5';

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

/// See also [forum].
@ProviderFor(forum)
const forumProvider = ForumFamily();

/// See also [forum].
class ForumFamily extends Family<AsyncValue<Forum>> {
  /// See also [forum].
  const ForumFamily();

  /// See also [forum].
  ForumProvider call(
    String forumId,
  ) {
    return ForumProvider(
      forumId,
    );
  }

  @override
  ForumProvider getProviderOverride(
    covariant ForumProvider provider,
  ) {
    return call(
      provider.forumId,
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
  String? get name => r'forumProvider';
}

/// See also [forum].
class ForumProvider extends AutoDisposeFutureProvider<Forum> {
  /// See also [forum].
  ForumProvider(
    String forumId,
  ) : this._internal(
          (ref) => forum(
            ref as ForumRef,
            forumId,
          ),
          from: forumProvider,
          name: r'forumProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forumHash,
          dependencies: ForumFamily._dependencies,
          allTransitiveDependencies: ForumFamily._allTransitiveDependencies,
          forumId: forumId,
        );

  ForumProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.forumId,
  }) : super.internal();

  final String forumId;

  @override
  Override overrideWith(
    FutureOr<Forum> Function(ForumRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForumProvider._internal(
        (ref) => create(ref as ForumRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        forumId: forumId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Forum> createElement() {
    return _ForumProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForumProvider && other.forumId == forumId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, forumId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ForumRef on AutoDisposeFutureProviderRef<Forum> {
  /// The parameter `forumId` of this provider.
  String get forumId;
}

class _ForumProviderElement extends AutoDisposeFutureProviderElement<Forum>
    with ForumRef {
  _ForumProviderElement(super.provider);

  @override
  String get forumId => (origin as ForumProvider).forumId;
}

String _$forumsByCategoryHash() => r'ca77a54172893a89c012052a427b2162351b05fd';

/// See also [forumsByCategory].
@ProviderFor(forumsByCategory)
const forumsByCategoryProvider = ForumsByCategoryFamily();

/// See also [forumsByCategory].
class ForumsByCategoryFamily extends Family<AsyncValue<List<Forum>>> {
  /// See also [forumsByCategory].
  const ForumsByCategoryFamily();

  /// See also [forumsByCategory].
  ForumsByCategoryProvider call(
    ForumCategory category,
  ) {
    return ForumsByCategoryProvider(
      category,
    );
  }

  @override
  ForumsByCategoryProvider getProviderOverride(
    covariant ForumsByCategoryProvider provider,
  ) {
    return call(
      provider.category,
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
  String? get name => r'forumsByCategoryProvider';
}

/// See also [forumsByCategory].
class ForumsByCategoryProvider extends AutoDisposeFutureProvider<List<Forum>> {
  /// See also [forumsByCategory].
  ForumsByCategoryProvider(
    ForumCategory category,
  ) : this._internal(
          (ref) => forumsByCategory(
            ref as ForumsByCategoryRef,
            category,
          ),
          from: forumsByCategoryProvider,
          name: r'forumsByCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forumsByCategoryHash,
          dependencies: ForumsByCategoryFamily._dependencies,
          allTransitiveDependencies:
              ForumsByCategoryFamily._allTransitiveDependencies,
          category: category,
        );

  ForumsByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final ForumCategory category;

  @override
  Override overrideWith(
    FutureOr<List<Forum>> Function(ForumsByCategoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForumsByCategoryProvider._internal(
        (ref) => create(ref as ForumsByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Forum>> createElement() {
    return _ForumsByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForumsByCategoryProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ForumsByCategoryRef on AutoDisposeFutureProviderRef<List<Forum>> {
  /// The parameter `category` of this provider.
  ForumCategory get category;
}

class _ForumsByCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<Forum>>
    with ForumsByCategoryRef {
  _ForumsByCategoryProviderElement(super.provider);

  @override
  ForumCategory get category => (origin as ForumsByCategoryProvider).category;
}

String _$myForumsHash() => r'dfab806794caa0259c19fadd080ea49ef68dba90';

/// See also [myForums].
@ProviderFor(myForums)
final myForumsProvider = AutoDisposeFutureProvider<List<Forum>>.internal(
  myForums,
  name: r'myForumsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$myForumsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyForumsRef = AutoDisposeFutureProviderRef<List<Forum>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
