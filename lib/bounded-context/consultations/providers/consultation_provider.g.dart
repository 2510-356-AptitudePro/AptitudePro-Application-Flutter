// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myConsultationsHash() => r'91170bd1d87305e11372c3e10b48d37d9c1010b4';

/// See also [myConsultations].
@ProviderFor(myConsultations)
final myConsultationsProvider =
    AutoDisposeFutureProvider<List<Consultation>>.internal(
  myConsultations,
  name: r'myConsultationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myConsultationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyConsultationsRef = AutoDisposeFutureProviderRef<List<Consultation>>;
String _$psychologistsHash() => r'8989ec0ee55248b9a0bd767beca245136bf253dc';

/// See also [psychologists].
@ProviderFor(psychologists)
final psychologistsProvider =
    AutoDisposeFutureProvider<List<Psychologist>>.internal(
  psychologists,
  name: r'psychologistsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$psychologistsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PsychologistsRef = AutoDisposeFutureProviderRef<List<Psychologist>>;
String _$consultationHash() => r'9441f8b4997c342205f1d4411bd37d29d652a6e6';

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

/// See also [consultation].
@ProviderFor(consultation)
const consultationProvider = ConsultationFamily();

/// See also [consultation].
class ConsultationFamily extends Family<AsyncValue<Consultation>> {
  /// See also [consultation].
  const ConsultationFamily();

  /// See also [consultation].
  ConsultationProvider call(
    String consultationId,
  ) {
    return ConsultationProvider(
      consultationId,
    );
  }

  @override
  ConsultationProvider getProviderOverride(
    covariant ConsultationProvider provider,
  ) {
    return call(
      provider.consultationId,
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
  String? get name => r'consultationProvider';
}

/// See also [consultation].
class ConsultationProvider extends AutoDisposeFutureProvider<Consultation> {
  /// See also [consultation].
  ConsultationProvider(
    String consultationId,
  ) : this._internal(
          (ref) => consultation(
            ref as ConsultationRef,
            consultationId,
          ),
          from: consultationProvider,
          name: r'consultationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$consultationHash,
          dependencies: ConsultationFamily._dependencies,
          allTransitiveDependencies:
              ConsultationFamily._allTransitiveDependencies,
          consultationId: consultationId,
        );

  ConsultationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.consultationId,
  }) : super.internal();

  final String consultationId;

  @override
  Override overrideWith(
    FutureOr<Consultation> Function(ConsultationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConsultationProvider._internal(
        (ref) => create(ref as ConsultationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        consultationId: consultationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Consultation> createElement() {
    return _ConsultationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConsultationProvider &&
        other.consultationId == consultationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, consultationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConsultationRef on AutoDisposeFutureProviderRef<Consultation> {
  /// The parameter `consultationId` of this provider.
  String get consultationId;
}

class _ConsultationProviderElement
    extends AutoDisposeFutureProviderElement<Consultation>
    with ConsultationRef {
  _ConsultationProviderElement(super.provider);

  @override
  String get consultationId => (origin as ConsultationProvider).consultationId;
}

String _$availableSlotsHash() => r'50b8b3007a1d8e1ed6f8089bbb80f47b3914c465';

/// See also [availableSlots].
@ProviderFor(availableSlots)
const availableSlotsProvider = AvailableSlotsFamily();

/// See also [availableSlots].
class AvailableSlotsFamily extends Family<AsyncValue<List<DateTime>>> {
  /// See also [availableSlots].
  const AvailableSlotsFamily();

  /// See also [availableSlots].
  AvailableSlotsProvider call(
    String psychologistId,
    DateTime date,
  ) {
    return AvailableSlotsProvider(
      psychologistId,
      date,
    );
  }

  @override
  AvailableSlotsProvider getProviderOverride(
    covariant AvailableSlotsProvider provider,
  ) {
    return call(
      provider.psychologistId,
      provider.date,
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
  String? get name => r'availableSlotsProvider';
}

/// See also [availableSlots].
class AvailableSlotsProvider extends AutoDisposeFutureProvider<List<DateTime>> {
  /// See also [availableSlots].
  AvailableSlotsProvider(
    String psychologistId,
    DateTime date,
  ) : this._internal(
          (ref) => availableSlots(
            ref as AvailableSlotsRef,
            psychologistId,
            date,
          ),
          from: availableSlotsProvider,
          name: r'availableSlotsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$availableSlotsHash,
          dependencies: AvailableSlotsFamily._dependencies,
          allTransitiveDependencies:
              AvailableSlotsFamily._allTransitiveDependencies,
          psychologistId: psychologistId,
          date: date,
        );

  AvailableSlotsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.psychologistId,
    required this.date,
  }) : super.internal();

  final String psychologistId;
  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<List<DateTime>> Function(AvailableSlotsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AvailableSlotsProvider._internal(
        (ref) => create(ref as AvailableSlotsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        psychologistId: psychologistId,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<DateTime>> createElement() {
    return _AvailableSlotsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AvailableSlotsProvider &&
        other.psychologistId == psychologistId &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, psychologistId.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AvailableSlotsRef on AutoDisposeFutureProviderRef<List<DateTime>> {
  /// The parameter `psychologistId` of this provider.
  String get psychologistId;

  /// The parameter `date` of this provider.
  DateTime get date;
}

class _AvailableSlotsProviderElement
    extends AutoDisposeFutureProviderElement<List<DateTime>>
    with AvailableSlotsRef {
  _AvailableSlotsProviderElement(super.provider);

  @override
  String get psychologistId =>
      (origin as AvailableSlotsProvider).psychologistId;
  @override
  DateTime get date => (origin as AvailableSlotsProvider).date;
}

String _$upcomingConsultationsHash() =>
    r'78f7216da975b3920de5fb44d26da4944a0e8809';

/// See also [upcomingConsultations].
@ProviderFor(upcomingConsultations)
final upcomingConsultationsProvider =
    AutoDisposeFutureProvider<List<Consultation>>.internal(
  upcomingConsultations,
  name: r'upcomingConsultationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$upcomingConsultationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpcomingConsultationsRef
    = AutoDisposeFutureProviderRef<List<Consultation>>;
String _$pastConsultationsHash() => r'4ec33de44f3851d9631d530d836555d6fceb5529';

/// See also [pastConsultations].
@ProviderFor(pastConsultations)
final pastConsultationsProvider =
    AutoDisposeFutureProvider<List<Consultation>>.internal(
  pastConsultations,
  name: r'pastConsultationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pastConsultationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PastConsultationsRef = AutoDisposeFutureProviderRef<List<Consultation>>;
String _$cancelledConsultationsHash() =>
    r'719f62bcdee136ba7a31620a0d2817d974801241';

/// See also [cancelledConsultations].
@ProviderFor(cancelledConsultations)
final cancelledConsultationsProvider =
    AutoDisposeFutureProvider<List<Consultation>>.internal(
  cancelledConsultations,
  name: r'cancelledConsultationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cancelledConsultationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CancelledConsultationsRef
    = AutoDisposeFutureProviderRef<List<Consultation>>;
String _$scheduleConsultationHash() =>
    r'926ce2383b008b07e9c3b2f8513383c5dd5a0e3c';

/// See also [ScheduleConsultation].
@ProviderFor(ScheduleConsultation)
final scheduleConsultationProvider = AutoDisposeAsyncNotifierProvider<
    ScheduleConsultation, Consultation?>.internal(
  ScheduleConsultation.new,
  name: r'scheduleConsultationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduleConsultationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScheduleConsultation = AutoDisposeAsyncNotifier<Consultation?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
