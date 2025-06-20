import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';
import '../entities/forum.dart';

class ForumService {
  final Dio _dio;

  ForumService(this._dio);

  Future<List<Forum>> getForums() async {
    try {
      final response = await _dio.get(ApiConstants.forums);

      // ✅ Manejar la estructura de respuesta como en otros servicios
      final data = response.data;

      // Caso 1: Si la respuesta tiene una estructura con "data"
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        final forumsData = data['data'];
        if (forumsData is List) {
          return forumsData.map((json) => Forum.fromJson(json)).toList();
        }
      }

      // Caso 2: Si la respuesta es directamente una lista
      if (data is List) {
        return data.map((json) => Forum.fromJson(json)).toList();
      }

      // Caso 3: Si no hay datos, devolver lista vacía
      return [];

    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('Los foros no están disponibles en este momento');
      }
      throw Exception('Error de red al obtener foros: ${e.message}');
    } catch (e) {
      throw Exception('Error al obtener foros: $e');
    }
  }

  Future<Forum> getForum(String forumId) async {
    try {
      final response = await _dio.get('${ApiConstants.forums}/$forumId');

      // ✅ Manejar la estructura de respuesta
      final data = response.data;

      if (data is Map<String, dynamic> && data.containsKey('data')) {
        return Forum.fromJson(data['data']);
      }

      if (data is Map<String, dynamic>) {
        return Forum.fromJson(data);
      }

      throw Exception('Formato de respuesta inválido');

    } catch (e) {
      throw Exception('Error al obtener foro: $e');
    }
  }

  Future<List<Forum>> getForumsByCategory(ForumCategory category) async {
    try {
      final response = await _dio.get(
        ApiConstants.forums,
        queryParameters: {'category': category.name},
      );

      // ✅ Manejar la estructura de respuesta
      final data = response.data;

      if (data is Map<String, dynamic> && data.containsKey('data')) {
        final forumsData = data['data'];
        if (forumsData is List) {
          return forumsData.map((json) => Forum.fromJson(json)).toList();
        }
      }

      if (data is List) {
        return data.map((json) => Forum.fromJson(json)).toList();
      }

      return [];

    } catch (e) {
      throw Exception('Error al obtener foros por categoría: $e');
    }
  }

  Future<List<Forum>> getMyForums() async {
    try {
      final response = await _dio.get('${ApiConstants.forums}/my-forums');

      // ✅ Manejar la estructura de respuesta
      final data = response.data;

      if (data is Map<String, dynamic> && data.containsKey('data')) {
        final forumsData = data['data'];
        if (forumsData is List) {
          return forumsData.map((json) => Forum.fromJson(json)).toList();
        }
      }

      if (data is List) {
        return data.map((json) => Forum.fromJson(json)).toList();
      }

      return [];

    } catch (e) {
      throw Exception('Error al obtener mis foros: $e');
    }
  }

  Future<Forum> createForum({
    required String title,
    required String description,
    required ForumCategory category,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.forums,
        data: {
          'title': title,
          'description': description,
          'category': category.name,
        },
      );

      // ✅ Manejar la estructura de respuesta
      final data = response.data;

      if (data is Map<String, dynamic> && data.containsKey('data')) {
        return Forum.fromJson(data['data']);
      }

      if (data is Map<String, dynamic>) {
        return Forum.fromJson(data);
      }

      throw Exception('Formato de respuesta inválido');

    } catch (e) {
      throw Exception('Error al crear foro: $e');
    }
  }

  Future<ForumReply> replyToForum(String forumId, String title, String content) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.forums}/$forumId/posts',
        data: {
          'title': title,
          'content': content,
          'forumId': forumId, // por si tu backend lo requiere en body también
        },
      );

      final data = response.data;

      if (data is Map<String, dynamic> && data.containsKey('data')) {
        return ForumReply.fromJson(data['data']);
      }

      if (data is Map<String, dynamic>) {
        return ForumReply.fromJson(data);
      }

      throw Exception('Formato de respuesta inválido');
    } catch (e) {
      throw Exception('Error al responder al foro: $e');
    }
  }


  // ✅ NUEVO: Método para debuggear la respuesta real de la API
  Future<void> debugForumsResponse() async {
    try {
      final response = await _dio.get(ApiConstants.forums);
      print('🐛 DEBUG - Status Code: ${response.statusCode}');
      print('🐛 DEBUG - Response Type: ${response.data.runtimeType}');
      print('🐛 DEBUG - Response Data: ${response.data}');

      if (response.data is Map<String, dynamic>) {
        final map = response.data as Map<String, dynamic>;
        print('🐛 DEBUG - Keys: ${map.keys.toList()}');

        if (map.containsKey('data')) {
          print('🐛 DEBUG - Data Type: ${map['data'].runtimeType}');
          print('🐛 DEBUG - Data Content: ${map['data']}');
        }
      }
    } catch (e) {
      print('🐛 DEBUG - Error: $e');
    }
  }
}