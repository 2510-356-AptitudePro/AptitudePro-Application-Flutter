import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/services/dio/dio_client.dart';
import '../services/consultation_service.dart';
import '../entities/consultation.dart';
import '../../../domain/entities/psychologist/psychologist.dart';
import '../../auth/providers/auth_provider.dart';

part 'consultation_provider.g.dart';

// ✅ Servicio de consultas usando el dioProvider correcto
final consultationServiceProvider = Provider<ConsultationService>((ref) {
  return ConsultationService(ref.watch(dioProvider));
});

// ✅ Provider principal que obtiene consultas según el rol del usuario
@riverpod
Future<List<Consultation>> myConsultations(MyConsultationsRef ref) async {
  final consultationService = ref.watch(consultationServiceProvider);

  // ✅ Obtener el usuario actual y su rol
  final currentUser = ref.watch(currentUserProvider);

  // ✅ Convertir UserRole enum a String
  String? userRoleString;
  if (currentUser?.role != null) {
    userRoleString = currentUser!.role.toString().split('.').last; // Convierte UserRole.psychologist -> "psychologist"
  }

  print('🔍 DEBUG - Usuario: ${currentUser?.username}, Rol: $userRoleString');

  return consultationService.getMyConsultations(userRole: userRoleString);
}

// ✅ Provider para psicólogos disponibles
@riverpod
Future<List<Psychologist>> psychologists(PsychologistsRef ref) async {
  final consultationService = ref.watch(consultationServiceProvider);
  return consultationService.getPsychologists();
}

// ✅ Provider para consulta específica
@riverpod
Future<Consultation> consultation(ConsultationRef ref, String consultationId) async {
  final consultationService = ref.watch(consultationServiceProvider);
  return consultationService.getConsultation(consultationId);
}

// ✅ Provider para slots disponibles
@riverpod
Future<List<DateTime>> availableSlots(
    AvailableSlotsRef ref,
    String psychologistId,
    DateTime date,
    ) async {
  final consultationService = ref.watch(consultationServiceProvider);
  return consultationService.getAvailableSlots(psychologistId, date);
}

// ✅ Providers de conveniencia para filtrar consultas
@riverpod
Future<List<Consultation>> upcomingConsultations(UpcomingConsultationsRef ref) async {
  final consultations = await ref.watch(myConsultationsProvider.future);
  return consultations.where((c) => c.isUpcoming).toList();
}

@riverpod
Future<List<Consultation>> pastConsultations(PastConsultationsRef ref) async {
  final consultations = await ref.watch(myConsultationsProvider.future);
  return consultations.where((c) =>
  c.scheduledAt.isBefore(DateTime.now()) &&
      c.status != ConsultationStatus.cancelled
  ).toList();
}

@riverpod
Future<List<Consultation>> cancelledConsultations(CancelledConsultationsRef ref) async {
  final consultations = await ref.watch(myConsultationsProvider.future);
  return consultations.where((c) => c.status == ConsultationStatus.cancelled).toList();
}

// ✅ ACTUALIZADO: Provider para agendar consulta con mejor manejo de estado
@riverpod
class ScheduleConsultation extends _$ScheduleConsultation {
  @override
  FutureOr<Consultation?> build() => null;

  Future<void> schedule({
    required String psychologistId,
    required DateTime scheduledAt,
    String? notes,
  }) async {
    state = const AsyncLoading();

    try {
      final consultationService = ref.read(consultationServiceProvider);
      final consultation = await consultationService.scheduleConsultation(
        psychologistId: psychologistId,
        scheduledAt: scheduledAt,
        notes: notes,
      );

      state = AsyncData(consultation);

      // ✅ Invalidar otros providers para refrescar
      ref.invalidate(myConsultationsProvider);

    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> cancel(String consultationId, String reason) async {
    state = const AsyncLoading();

    try {
      final consultationService = ref.read(consultationServiceProvider);
      final consultation = await consultationService.cancelConsultation(
        consultationId,
        reason,
      );

      state = AsyncData(consultation);

      // ✅ Invalidar providers para refrescar
      ref.invalidate(myConsultationsProvider);
      ref.invalidate(consultationProvider(consultationId));
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  // ✅ HABILITADO: Método para actualizar consulta
  Future<void> updateConsultation({
    required String consultationId,
    ConsultationStatus? status,
    String? psychologistNotes,
    String? recommendations,
    double? rating,
    String? feedback,
    String? meetingUrl,
  }) async {
    state = const AsyncLoading();

    try {
      final consultationService = ref.read(consultationServiceProvider);
      final consultation = await consultationService.updateConsultation(
        consultationId,
        status: status,
        psychologistNotes: psychologistNotes,
        recommendations: recommendations,
        rating: rating,
        feedback: feedback,
        meetingUrl: meetingUrl,
      );

      state = AsyncData(consultation);

      // ✅ Invalidar providers para refrescar
      ref.invalidate(myConsultationsProvider);
      ref.invalidate(consultationProvider(consultationId));
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> reschedule(
      String consultationId,
      DateTime newScheduledAt,
      ) async {
    state = const AsyncLoading();

    try {
      final consultationService = ref.read(consultationServiceProvider);
      final consultation = await consultationService.rescheduleConsultation(
        consultationId,
        newScheduledAt,
      );

      state = AsyncData(consultation);

      // ✅ Invalidar providers para refrescar
      ref.invalidate(myConsultationsProvider);
      ref.invalidate(consultationProvider(consultationId));
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  void reset() {
    state = const AsyncData(null);
  }
}