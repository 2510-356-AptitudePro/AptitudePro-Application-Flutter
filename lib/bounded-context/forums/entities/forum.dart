import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum.freezed.dart';


@JsonEnum()
enum ForumCategory {
  @JsonValue('General')
  general,
  @JsonValue('Careers')
  careers,
  @JsonValue('Tests')
  tests,
  @JsonValue('Experiences')
  experiences,
  @JsonValue('Help')
  help;

  String get displayName {
    switch (this) {
      case ForumCategory.general:
        return 'General';
      case ForumCategory.careers:
        return 'Carreras';
      case ForumCategory.tests:
        return 'Tests';
      case ForumCategory.experiences:
        return 'Experiencias';
      case ForumCategory.help:
        return 'Ayuda';
    }
  }

  static ForumCategory fromString(String? category) {
    if (category == null) return ForumCategory.general;

    switch (category) {
      case 'General':
        return ForumCategory.general;
      case 'Careers':
        return ForumCategory.careers;
      case 'Tests':
        return ForumCategory.tests;
      case 'Experiences':
        return ForumCategory.experiences;
      case 'Help':
        return ForumCategory.help;
      default:
        return ForumCategory.general;
    }
  }
}

@freezed
class Forum with _$Forum {
  const factory Forum({
    required String id,
    // ✅ CORREGIDO: name en lugar de title (según tu API)
    required String name,
    required String description,
    required ForumCategory category,
    @Default(true) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    // ✅ CORREGIDO: postCount en lugar de replyCount (según tu API)
    @Default(0) int postCount,

    // ✅ Campos opcionales que no vienen en la respuesta básica
    @Default(0) int viewCount,
    @Default(false) bool isPinned,
    @Default(false) bool isClosed,
    @Default([]) List<ForumReply> replies,
    String? lastReplyAt,

    // ✅ Información del autor como IDs simples (evitar objetos complejos)
    String? authorId,
    String? authorName,
    String? lastReplyById,
    String? lastReplyByName,
  }) = _Forum;

  const Forum._();

  // ✅ Custom fromJson para manejar la estructura real de tu API
  factory Forum.fromJson(Map<String, dynamic> json) {
    return Forum(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: ForumCategory.fromString(json['category'] as String?),
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : DateTime.now(),
      postCount: json['postCount'] as int? ?? 0,
      viewCount: json['viewCount'] as int? ?? 0,
      isPinned: json['isPinned'] as bool? ?? false,
      isClosed: json['isClosed'] as bool? ?? false,
      lastReplyAt: json['lastReplyAt'] as String?,
      authorId: json['authorId'] as String?,
      authorName: json['authorName'] as String?,
      lastReplyById: json['lastReplyById'] as String?,
      lastReplyByName: json['lastReplyByName'] as String?,
      // Los replies se cargan por separado cuando sea necesario
      replies: [],
    );
  }

  // ✅ Getters útiles
  String get displayName => name;

  String get formattedPostCount {
    if (postCount == 0) return 'Sin posts';
    if (postCount == 1) return '1 post';
    return '$postCount posts';
  }

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'Ahora';
    }
  }

  bool get hasActivity => postCount > 0;

  String get categoryDisplayName => category.displayName;
}

@freezed
class ForumReply with _$ForumReply {
  const factory ForumReply({
    required String id,
    required String content,
    required DateTime createdAt,
    DateTime? updatedAt,
    @Default(0) int likes,
    @Default(false) bool isAccepted,

    // ✅ Información del autor como campos simples
    String? authorId,
    String? authorName,
    String? authorEmail,
    String? forumId,
  }) = _ForumReply;

  const ForumReply._();

  factory ForumReply.fromJson(Map<String, dynamic> json) {
    return ForumReply(
      id: json['id'] as String? ?? '',
      content: json['content'] as String? ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      likes: json['likes'] as int? ?? 0,
      isAccepted: json['isAccepted'] as bool? ?? false,
      authorId: json['authorId'] as String?,
      authorName: json['authorName'] as String?,
      authorEmail: json['authorEmail'] as String?,
      forumId: json['forumId'] as String?,
    );
  }

  // ✅ Getters útiles
  String get authorDisplayName => authorName ?? 'Usuario Anónimo';

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'Ahora';
    }
  }
}