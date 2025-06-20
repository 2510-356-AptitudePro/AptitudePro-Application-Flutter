// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Forum {
  String get id =>
      throw _privateConstructorUsedError; // ✅ CORREGIDO: name en lugar de title (según tu API)
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ForumCategory get category => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt =>
      throw _privateConstructorUsedError; // ✅ CORREGIDO: postCount en lugar de replyCount (según tu API)
  int get postCount =>
      throw _privateConstructorUsedError; // ✅ Campos opcionales que no vienen en la respuesta básica
  int get viewCount => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  bool get isClosed => throw _privateConstructorUsedError;
  List<ForumReply> get replies => throw _privateConstructorUsedError;
  String? get lastReplyAt =>
      throw _privateConstructorUsedError; // ✅ Información del autor como IDs simples (evitar objetos complejos)
  String? get authorId => throw _privateConstructorUsedError;
  String? get authorName => throw _privateConstructorUsedError;
  String? get lastReplyById => throw _privateConstructorUsedError;
  String? get lastReplyByName => throw _privateConstructorUsedError;

  /// Create a copy of Forum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumCopyWith<Forum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumCopyWith<$Res> {
  factory $ForumCopyWith(Forum value, $Res Function(Forum) then) =
      _$ForumCopyWithImpl<$Res, Forum>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      ForumCategory category,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      int postCount,
      int viewCount,
      bool isPinned,
      bool isClosed,
      List<ForumReply> replies,
      String? lastReplyAt,
      String? authorId,
      String? authorName,
      String? lastReplyById,
      String? lastReplyByName});
}

/// @nodoc
class _$ForumCopyWithImpl<$Res, $Val extends Forum>
    implements $ForumCopyWith<$Res> {
  _$ForumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Forum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? postCount = null,
    Object? viewCount = null,
    Object? isPinned = null,
    Object? isClosed = null,
    Object? replies = null,
    Object? lastReplyAt = freezed,
    Object? authorId = freezed,
    Object? authorName = freezed,
    Object? lastReplyById = freezed,
    Object? lastReplyByName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ForumCategory,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<ForumReply>,
      lastReplyAt: freezed == lastReplyAt
          ? _value.lastReplyAt
          : lastReplyAt // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReplyById: freezed == lastReplyById
          ? _value.lastReplyById
          : lastReplyById // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReplyByName: freezed == lastReplyByName
          ? _value.lastReplyByName
          : lastReplyByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumImplCopyWith<$Res> implements $ForumCopyWith<$Res> {
  factory _$$ForumImplCopyWith(
          _$ForumImpl value, $Res Function(_$ForumImpl) then) =
      __$$ForumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      ForumCategory category,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      int postCount,
      int viewCount,
      bool isPinned,
      bool isClosed,
      List<ForumReply> replies,
      String? lastReplyAt,
      String? authorId,
      String? authorName,
      String? lastReplyById,
      String? lastReplyByName});
}

/// @nodoc
class __$$ForumImplCopyWithImpl<$Res>
    extends _$ForumCopyWithImpl<$Res, _$ForumImpl>
    implements _$$ForumImplCopyWith<$Res> {
  __$$ForumImplCopyWithImpl(
      _$ForumImpl _value, $Res Function(_$ForumImpl) _then)
      : super(_value, _then);

  /// Create a copy of Forum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? postCount = null,
    Object? viewCount = null,
    Object? isPinned = null,
    Object? isClosed = null,
    Object? replies = null,
    Object? lastReplyAt = freezed,
    Object? authorId = freezed,
    Object? authorName = freezed,
    Object? lastReplyById = freezed,
    Object? lastReplyByName = freezed,
  }) {
    return _then(_$ForumImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ForumCategory,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      replies: null == replies
          ? _value._replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<ForumReply>,
      lastReplyAt: freezed == lastReplyAt
          ? _value.lastReplyAt
          : lastReplyAt // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReplyById: freezed == lastReplyById
          ? _value.lastReplyById
          : lastReplyById // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReplyByName: freezed == lastReplyByName
          ? _value.lastReplyByName
          : lastReplyByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ForumImpl extends _Forum {
  const _$ForumImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      this.isActive = true,
      required this.createdAt,
      required this.updatedAt,
      this.postCount = 0,
      this.viewCount = 0,
      this.isPinned = false,
      this.isClosed = false,
      final List<ForumReply> replies = const [],
      this.lastReplyAt,
      this.authorId,
      this.authorName,
      this.lastReplyById,
      this.lastReplyByName})
      : _replies = replies,
        super._();

  @override
  final String id;
// ✅ CORREGIDO: name en lugar de title (según tu API)
  @override
  final String name;
  @override
  final String description;
  @override
  final ForumCategory category;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
// ✅ CORREGIDO: postCount en lugar de replyCount (según tu API)
  @override
  @JsonKey()
  final int postCount;
// ✅ Campos opcionales que no vienen en la respuesta básica
  @override
  @JsonKey()
  final int viewCount;
  @override
  @JsonKey()
  final bool isPinned;
  @override
  @JsonKey()
  final bool isClosed;
  final List<ForumReply> _replies;
  @override
  @JsonKey()
  List<ForumReply> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
  }

  @override
  final String? lastReplyAt;
// ✅ Información del autor como IDs simples (evitar objetos complejos)
  @override
  final String? authorId;
  @override
  final String? authorName;
  @override
  final String? lastReplyById;
  @override
  final String? lastReplyByName;

  @override
  String toString() {
    return 'Forum(id: $id, name: $name, description: $description, category: $category, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, postCount: $postCount, viewCount: $viewCount, isPinned: $isPinned, isClosed: $isClosed, replies: $replies, lastReplyAt: $lastReplyAt, authorId: $authorId, authorName: $authorName, lastReplyById: $lastReplyById, lastReplyByName: $lastReplyByName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            const DeepCollectionEquality().equals(other._replies, _replies) &&
            (identical(other.lastReplyAt, lastReplyAt) ||
                other.lastReplyAt == lastReplyAt) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.lastReplyById, lastReplyById) ||
                other.lastReplyById == lastReplyById) &&
            (identical(other.lastReplyByName, lastReplyByName) ||
                other.lastReplyByName == lastReplyByName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      category,
      isActive,
      createdAt,
      updatedAt,
      postCount,
      viewCount,
      isPinned,
      isClosed,
      const DeepCollectionEquality().hash(_replies),
      lastReplyAt,
      authorId,
      authorName,
      lastReplyById,
      lastReplyByName);

  /// Create a copy of Forum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumImplCopyWith<_$ForumImpl> get copyWith =>
      __$$ForumImplCopyWithImpl<_$ForumImpl>(this, _$identity);
}

abstract class _Forum extends Forum {
  const factory _Forum(
      {required final String id,
      required final String name,
      required final String description,
      required final ForumCategory category,
      final bool isActive,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int postCount,
      final int viewCount,
      final bool isPinned,
      final bool isClosed,
      final List<ForumReply> replies,
      final String? lastReplyAt,
      final String? authorId,
      final String? authorName,
      final String? lastReplyById,
      final String? lastReplyByName}) = _$ForumImpl;
  const _Forum._() : super._();

  @override
  String get id; // ✅ CORREGIDO: name en lugar de title (según tu API)
  @override
  String get name;
  @override
  String get description;
  @override
  ForumCategory get category;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  DateTime
      get updatedAt; // ✅ CORREGIDO: postCount en lugar de replyCount (según tu API)
  @override
  int get postCount; // ✅ Campos opcionales que no vienen en la respuesta básica
  @override
  int get viewCount;
  @override
  bool get isPinned;
  @override
  bool get isClosed;
  @override
  List<ForumReply> get replies;
  @override
  String?
      get lastReplyAt; // ✅ Información del autor como IDs simples (evitar objetos complejos)
  @override
  String? get authorId;
  @override
  String? get authorName;
  @override
  String? get lastReplyById;
  @override
  String? get lastReplyByName;

  /// Create a copy of Forum
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumImplCopyWith<_$ForumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForumReply {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  bool get isAccepted =>
      throw _privateConstructorUsedError; // ✅ Información del autor como campos simples
  String? get authorId => throw _privateConstructorUsedError;
  String? get authorName => throw _privateConstructorUsedError;
  String? get authorEmail => throw _privateConstructorUsedError;
  String? get forumId => throw _privateConstructorUsedError;

  /// Create a copy of ForumReply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumReplyCopyWith<ForumReply> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumReplyCopyWith<$Res> {
  factory $ForumReplyCopyWith(
          ForumReply value, $Res Function(ForumReply) then) =
      _$ForumReplyCopyWithImpl<$Res, ForumReply>;
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime createdAt,
      DateTime? updatedAt,
      int likes,
      bool isAccepted,
      String? authorId,
      String? authorName,
      String? authorEmail,
      String? forumId});
}

/// @nodoc
class _$ForumReplyCopyWithImpl<$Res, $Val extends ForumReply>
    implements $ForumReplyCopyWith<$Res> {
  _$ForumReplyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumReply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? likes = null,
    Object? isAccepted = null,
    Object? authorId = freezed,
    Object? authorName = freezed,
    Object? authorEmail = freezed,
    Object? forumId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      isAccepted: null == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorEmail: freezed == authorEmail
          ? _value.authorEmail
          : authorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      forumId: freezed == forumId
          ? _value.forumId
          : forumId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumReplyImplCopyWith<$Res>
    implements $ForumReplyCopyWith<$Res> {
  factory _$$ForumReplyImplCopyWith(
          _$ForumReplyImpl value, $Res Function(_$ForumReplyImpl) then) =
      __$$ForumReplyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime createdAt,
      DateTime? updatedAt,
      int likes,
      bool isAccepted,
      String? authorId,
      String? authorName,
      String? authorEmail,
      String? forumId});
}

/// @nodoc
class __$$ForumReplyImplCopyWithImpl<$Res>
    extends _$ForumReplyCopyWithImpl<$Res, _$ForumReplyImpl>
    implements _$$ForumReplyImplCopyWith<$Res> {
  __$$ForumReplyImplCopyWithImpl(
      _$ForumReplyImpl _value, $Res Function(_$ForumReplyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForumReply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? likes = null,
    Object? isAccepted = null,
    Object? authorId = freezed,
    Object? authorName = freezed,
    Object? authorEmail = freezed,
    Object? forumId = freezed,
  }) {
    return _then(_$ForumReplyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      isAccepted: null == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorEmail: freezed == authorEmail
          ? _value.authorEmail
          : authorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      forumId: freezed == forumId
          ? _value.forumId
          : forumId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ForumReplyImpl extends _ForumReply {
  const _$ForumReplyImpl(
      {required this.id,
      required this.content,
      required this.createdAt,
      this.updatedAt,
      this.likes = 0,
      this.isAccepted = false,
      this.authorId,
      this.authorName,
      this.authorEmail,
      this.forumId})
      : super._();

  @override
  final String id;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final bool isAccepted;
// ✅ Información del autor como campos simples
  @override
  final String? authorId;
  @override
  final String? authorName;
  @override
  final String? authorEmail;
  @override
  final String? forumId;

  @override
  String toString() {
    return 'ForumReply(id: $id, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, likes: $likes, isAccepted: $isAccepted, authorId: $authorId, authorName: $authorName, authorEmail: $authorEmail, forumId: $forumId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumReplyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.isAccepted, isAccepted) ||
                other.isAccepted == isAccepted) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorEmail, authorEmail) ||
                other.authorEmail == authorEmail) &&
            (identical(other.forumId, forumId) || other.forumId == forumId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, content, createdAt,
      updatedAt, likes, isAccepted, authorId, authorName, authorEmail, forumId);

  /// Create a copy of ForumReply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumReplyImplCopyWith<_$ForumReplyImpl> get copyWith =>
      __$$ForumReplyImplCopyWithImpl<_$ForumReplyImpl>(this, _$identity);
}

abstract class _ForumReply extends ForumReply {
  const factory _ForumReply(
      {required final String id,
      required final String content,
      required final DateTime createdAt,
      final DateTime? updatedAt,
      final int likes,
      final bool isAccepted,
      final String? authorId,
      final String? authorName,
      final String? authorEmail,
      final String? forumId}) = _$ForumReplyImpl;
  const _ForumReply._() : super._();

  @override
  String get id;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  int get likes;
  @override
  bool get isAccepted; // ✅ Información del autor como campos simples
  @override
  String? get authorId;
  @override
  String? get authorName;
  @override
  String? get authorEmail;
  @override
  String? get forumId;

  /// Create a copy of ForumReply
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumReplyImplCopyWith<_$ForumReplyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
