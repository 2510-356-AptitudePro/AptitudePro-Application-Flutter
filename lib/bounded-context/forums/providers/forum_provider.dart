import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/services/dio/dio_client.dart';
import '../services/forum_service.dart';
import '../entities/forum.dart';


part 'forum_provider.g.dart';

// Servicio de foros
final forumServiceProvider = Provider<ForumService>((ref) {
  return ForumService(ref.watch(dioProvider));
});

// Lista de foros
@riverpod
Future<List<Forum>> forumList(ForumListRef ref) async {
  final forumService = ref.watch(forumServiceProvider);
  return forumService.getForums();
}

// Foro individual
@riverpod
Future<Forum> forum(ForumRef ref, String forumId) async {
  final forumService = ref.watch(forumServiceProvider);
  return forumService.getForum(forumId);
}

// Foros por categoría
@riverpod
Future<List<Forum>> forumsByCategory(
    ForumsByCategoryRef ref,
    ForumCategory category,
    ) async {
  final forumService = ref.watch(forumServiceProvider);
  return forumService.getForumsByCategory(category);
}

// Mis foros
@riverpod
Future<List<Forum>> myForums(MyForumsRef ref) async {
  final forumService = ref.watch(forumServiceProvider);
  return forumService.getMyForums();
}
