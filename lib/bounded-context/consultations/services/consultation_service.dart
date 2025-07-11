import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';
import '../../../domain/entities/psychologist/psychologist.dart';
import '../entities/consultation.dart';


class ConsultationService {
  final Dio _dio;

  ConsultationService(this._dio);

  /// Obtiene las consultas del usuario según su rol
  /// - Student: /api/v1/consultations/my-consultations
  /// - Psychologist: /api/v1/consultations/my-appointments
  Future<List<Consultation>> getMyConsultations({String? userRole}) async {
    try {
      // ✅ Determinar endpoint según el rol usando las rutas exactas de tu API
      String endpoint;
      if (userRole?.toLowerCase() == 'psychologist') {
        endpoint = '${ApiConstants.consultations}/my-appointments';
      } else {
        // Por defecto usar el endpoint de estudiantes
        endpoint = '${ApiConstants.consultations}/my-consultations';
      }

      print('🔍 DEBUG - Usando endpoint: $endpoint para rol: ${userRole ?? 'student'}');

      final response = await _dio.get(endpoint);

      // ✅ Manejar la estructura de respuesta con "data"
      final data = response.data['data'] ?? response.data;

      return (data as List).map((json) {
        final consultationJson = Map<String, dynamic>.from(json);

        // ✅ Procesar datos según el rol
        if (userRole?.toLowerCase() == 'psychologist') {
          _processStudentData(consultationJson);
        } else {
          _processPsychologistData(consultationJson);
        }

        return Consultation.fromJson(consultationJson);
      }).toList();
    } catch (e) {
      print('Error en getMyConsultations: $e');
      throw Exception('Error al obtener consultas: $e');
    }
  }

  Future<List<Psychologist>> getPsychologists() async {
    try {
      // ✅ Usar la constante correcta de ApiConstants
      final response = await _dio.get(ApiConstants.psychologists);

      final data = response.data['data'] ?? response.data;

      return (data as List)
          .map((json) => Psychologist.fromJson(json))
          .toList();

    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('El servicio de psicólogos no está disponible');
      }
      throw Exception('Error al obtener psicólogos: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado al obtener psicólogos: $e');
    }
  }

  /// ✅ CORREGIDO: Obtener consulta específica por ID
  /// Ruta: GET /api/v1/consultations/{id}
  Future<Consultation> getConsultation(String consultationId) async {
    try {
      print('🔍 DEBUG - Obteniendo consulta con ID: "$consultationId"');

      // ✅ Usar la ruta correcta de tu API
      final response = await _dio.get('${ApiConstants.consultations}/$consultationId');

      final data = response.data['data'] ?? response.data;
      final consultationJson = Map<String, dynamic>.from(data);

      // ✅ Procesar datos de psychologist/student
      if (consultationJson['psychologist'] != null) {
        _processPsychologistData(consultationJson);
      } else if (consultationJson['student'] != null) {
        _processStudentData(consultationJson);
      }

      return Consultation.fromJson(consultationJson);
    } catch (e) {
      print('Error en getConsultation: $e');
      throw Exception('Error al obtener consulta: $e');
    }
  }

  /// ✅ CORREGIDO: Obtener slots disponibles de un psicólogo
  /// Ruta: GET /api/v1/consultations/available-slots/{psychologistId}
  Future<List<DateTime>> getAvailableSlots(
      String psychologistId,
      DateTime date,
      ) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.consultations}/available-slots/$psychologistId',
        queryParameters: {
          'date': date.toIso8601String().split('T')[0],
        },
      );

      final data = response.data['data'] ?? response.data;

      return (data as List)
          .map((slot) => DateTime.parse(slot as String))
          .toList();
    } catch (e) {
      throw Exception('Error al obtener slots disponibles: $e');
    }
  }

  /// ✅ CORREGIDO: Agendar nueva consulta
  /// Ruta: POST /api/v1/consultations/request
  Future<Consultation> scheduleConsultation({
    required String psychologistId,
    required DateTime scheduledAt,
    String? notes,
  }) async {
    try {
      print('🔍 DEBUG - Agendando consulta...');
      print('🔍 DEBUG - PsychologistId: $psychologistId');
      print('🔍 DEBUG - ScheduledAt: $scheduledAt');

      // ✅ CORREGIDO: Usar la constante consultations + /request
      final response = await _dio.post(
        '${ApiConstants.consultations}/request',
        data: {
          'psychologistId': psychologistId,
          'scheduledDate': scheduledAt.toIso8601String(),
          if (notes != null && notes.isNotEmpty) 'studentNotes': notes,
          'duration': 60,
        },
      );

      final data = response.data['data'] ?? response.data;
      final consultationJson = Map<String, dynamic>.from(data);
      _processPsychologistData(consultationJson);

      return Consultation.fromJson(consultationJson);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final errorMessage = e.response?.data?['message'];
        if (errorMessage is Map && errorMessage['message'] is List) {
          final errors = (errorMessage['message'] as List).join(', ');
          throw Exception('Error de validación: $errors');
        }
        throw Exception('Datos inválidos: ${e.response?.data?['message'] ?? 'Error desconocido'}');
      }
      throw Exception('Error al agendar consulta: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado al agendar consulta: $e');
    }
  }

  /// ✅ CORREGIDO: Cancelar consulta
  /// Ruta: PATCH /api/v1/consultations/{id}/cancel
  Future<Consultation> cancelConsultation(
      String consultationId,
      String reason,
      ) async {
    try {
      final response = await _dio.patch(
        '${ApiConstants.consultations}/$consultationId/cancel',
        data: {'reason': reason},
      );

      final data = response.data['data'] ?? response.data;
      final consultationJson = Map<String, dynamic>.from(data);
      _processPsychologistData(consultationJson);

      return Consultation.fromJson(consultationJson);
    } catch (e) {
      throw Exception('Error al cancelar consulta: $e');
    }
  }

  /// ✅ NUEVO: Reprogramar consulta (si tienes esta funcionalidad)
  /// Nota: No veo esta ruta en tu API, pero la dejo por si la implementas
  Future<Consultation> rescheduleConsultation(
      String consultationId,
      DateTime newScheduledAt,
      ) async {
    try {
      // ✅ Esta ruta puede no existir en tu API actual
      final response = await _dio.patch(
        '${ApiConstants.consultations}/$consultationId/reschedule',
        data: {'scheduledDate': newScheduledAt.toIso8601String()},
      );

      final data = response.data['data'] ?? response.data;
      final consultationJson = Map<String, dynamic>.from(data);
      _processPsychologistData(consultationJson);

      return Consultation.fromJson(consultationJson);
    } catch (e) {
      throw Exception('Error al reprogramar consulta: $e');
    }
  }

  /// ✅ NUEVO: Actualizar consulta (para psicólogos)
  /// Ruta: PATCH /api/v1/consultations/{id}
  Future<Consultation> updateConsultation(
      String consultationId, {
        ConsultationStatus? status,
        String? psychologistNotes,
        String? recommendations,
        double? rating,
        String? feedback,
        String? meetingUrl,
      }) async {
    try {
      final data = <String, dynamic>{};

      if (status != null) data['status'] = status.name;
      if (psychologistNotes != null) data['psychologistNotes'] = psychologistNotes;
      if (recommendations != null) data['recommendations'] = recommendations;
      if (rating != null) data['rating'] = rating;
      if (feedback != null) data['feedback'] = feedback;
      if (meetingUrl != null) data['meetingUrl'] = meetingUrl;

      final response = await _dio.patch(
        '${ApiConstants.consultations}/$consultationId',
        data: data,
      );

      final responseData = response.data['data'] ?? response.data;
      final consultationJson = Map<String, dynamic>.from(responseData);

      // Procesar datos según lo que venga en la respuesta
      if (consultationJson['psychologist'] != null) {
        _processPsychologistData(consultationJson);
      } else if (consultationJson['student'] != null) {
        _processStudentData(consultationJson);
      }

      return Consultation.fromJson(consultationJson);
    } catch (e) {
      throw Exception('Error al actualizar consulta: $e');
    }
  }

  // ✅ Método helper para procesar datos del psicólogo (para estudiantes)
  void _processPsychologistData(Map<String, dynamic> consultationJson) {
    if (consultationJson['psychologist'] != null) {
      final psychologist = consultationJson['psychologist'] as Map<String, dynamic>;
      final firstName = psychologist['firstName'] as String?;
      final lastName = psychologist['lastName'] as String?;

      // Crear nombre completo del psicólogo
      if (firstName != null && lastName != null) {
        consultationJson['psychologistName'] = '$firstName $lastName';
      } else if (firstName != null) {
        consultationJson['psychologistName'] = firstName;
      } else if (lastName != null) {
        consultationJson['psychologistName'] = lastName;
      }

      // Extraer biografía/especialización
      consultationJson['psychologistSpecialization'] = psychologist['bio'] as String?;
      consultationJson['psychologistEmail'] = psychologist['email'] as String?;

      // Mantener el psychologistId si no está en el nivel superior
      if (consultationJson['psychologistId'] == null) {
        consultationJson['psychologistId'] = psychologist['id'] as String;
      }
    }
  }

  // ✅ Método helper para procesar datos del estudiante (para psicólogos)
  void _processStudentData(Map<String, dynamic> consultationJson) {
    if (consultationJson['student'] != null) {
      final student = consultationJson['student'] as Map<String, dynamic>;
      final firstName = student['firstName'] as String?;
      final lastName = student['lastName'] as String?;

      // Crear nombre completo del estudiante
      if (firstName != null && lastName != null) {
        consultationJson['userName'] = '$firstName $lastName';
      } else if (firstName != null) {
        consultationJson['userName'] = firstName;
      } else if (lastName != null) {
        consultationJson['userName'] = lastName;
      }

      // Extraer información adicional del estudiante
      consultationJson['userEmail'] = student['email'] as String?;

      // Información académica
      final school = student['school'] as String?;
      final grade = student['grade'] as int?;
      if (school != null || grade != null) {
        String academicInfo = '';
        if (school != null) academicInfo += school;
        if (grade != null) {
          if (academicInfo.isNotEmpty) academicInfo += ' - ';
          academicInfo += 'Grado $grade';
        }
        consultationJson['studentAcademicInfo'] = academicInfo;
      }

      // Mantener el studentId/userId si no está en el nivel superior
      if (consultationJson['studentId'] == null && consultationJson['userId'] == null) {
        consultationJson['userId'] = student['id'] as String;
        consultationJson['studentId'] = student['id'] as String;
      }
    }
  }
}