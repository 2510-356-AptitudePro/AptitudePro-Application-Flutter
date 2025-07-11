import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/utils/formatters.dart';
import '../entities/consultation.dart';
import '../providers/consultation_provider.dart';
import '../../auth/providers/auth_provider.dart';
import '../../../presentation/widgets/error_state.dart';

class ConsultationDetailScreen extends ConsumerWidget {
  final String consultationId;

  const ConsultationDetailScreen({
    super.key,
    required this.consultationId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ AGREGAR DEBUG PARA VERIFICAR EL ID
    print('🔍 DEBUG - ConsultationId recibido: "$consultationId"');
    print('🔍 DEBUG - Longitud del ID: ${consultationId.length}');
    print('🔍 DEBUG - Tipo de caracteres: ${consultationId.runes.map((r) => String.fromCharCode(r)).join(", ")}');

    // ✅ Validar que el ID no esté vacío o sea inválido
    if (consultationId.isEmpty || consultationId == 'null' || consultationId == 'undefined') {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/consultations'),
          ),
          title: const Text('Error'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 64, color: Colors.red),
              SizedBox(height: 16),
              Text('ID de consulta inválido'),
              SizedBox(height: 8),
              Text('Por favor, regresa y selecciona una consulta válida.'),
            ],
          ),
        ),
      );
    }

    final consultationAsync = ref.watch(consultationProvider(consultationId));
    final currentUser = ref.watch(currentUserProvider);
    final userRoleString = currentUser?.role?.toString().split('.').last ?? 'student';
    final isPsychologist = userRoleString.toLowerCase() == 'psychologist';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/consultations'),
        ),
        title: const Text('Detalles de Consulta'),
        actions: [
          // Menú de opciones
          consultationAsync.maybeWhen(
            data: (consultation) => PopupMenuButton<String>(
              onSelected: (value) => _handleMenuAction(context, ref, consultation, value),
              itemBuilder: (context) => _buildMenuItems(consultation, isPsychologist),
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: consultationAsync.when(
        data: (consultation) => _buildConsultationDetail(context, consultation, isPsychologist),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) {
          // ✅ MEJORAR EL MANEJO DE ERRORES
          print('🚨 ERROR en consultationDetail: $error');
          print('🚨 Stack trace: $stack');

          return ErrorState(
            error: 'Error al cargar la consulta.\nID: $consultationId\nError: $error',
            onRetry: () => ref.invalidate(consultationProvider(consultationId)),
          );
        },
      ),
    );
  }

  // ... resto del código permanece igual
  Widget _buildConsultationDetail(BuildContext context, Consultation consultation, bool isPsychologist) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ AGREGAR CARD DE DEBUG (solo en desarrollo)
          if (consultationId.isNotEmpty) ...[
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('DEBUG INFO:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade800)),
                    Text('ID recibido: $consultationId'),
                    Text('ID de consulta: ${consultation.id}'),
                    Text('Estado: ${consultation.status.displayName}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSizes.md),
          ],

          // Estado y fecha
          _buildStatusCard(context, consultation),
          const SizedBox(height: AppSizes.md),

          // Información de la persona (estudiante o psicólogo)
          _buildPersonCard(context, consultation, isPsychologist),
          const SizedBox(height: AppSizes.md),

          // Detalles de la consulta
          _buildConsultationDetailsCard(context, consultation),
          const SizedBox(height: AppSizes.md),

          // Notas
          if (consultation.notes?.isNotEmpty == true) ...[
            _buildNotesCard(context, consultation, isPsychologist),
            const SizedBox(height: AppSizes.md),
          ],

          // Resumen del psicólogo (si existe)
          if (consultation.summary?.isNotEmpty == true) ...[
            _buildSummaryCard(context, consultation),
            const SizedBox(height: AppSizes.md),
          ],

          // Recomendaciones (si existe)
          if (consultation.recommendations?.isNotEmpty == true) ...[
            _buildRecommendationsCard(context, consultation),
            const SizedBox(height: AppSizes.md),
          ],

          // Calificación (si existe)
          if (consultation.rating != null) ...[
            _buildRatingCard(context, consultation),
            const SizedBox(height: AppSizes.md),
          ],

          // Botones de acción
          _buildActionButtons(context, consultation, isPsychologist),
        ],
      ),
    );
  }

  // ... resto de los métodos permanecen iguales
  Widget _buildStatusCard(BuildContext context, Consultation consultation) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getStatusIcon(consultation.status),
                  color: _getStatusColor(consultation.status),
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  consultation.status.displayName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: _getStatusColor(consultation.status),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.sm),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                const SizedBox(width: AppSizes.xs),
                Text(
                  Formatters.date(consultation.scheduledAt),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: AppSizes.md),
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                const SizedBox(width: AppSizes.xs),
                Text(
                  consultation.timeSlot,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.xs),
            Row(
              children: [
                Icon(Icons.timer, size: 16, color: Colors.grey[600]),
                const SizedBox(width: AppSizes.xs),
                Text(
                  consultation.formattedDuration,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Los demás métodos permanecen iguales...
  Widget _buildPersonCard(BuildContext context, Consultation consultation, bool isPsychologist) {
    final name = isPsychologist
        ? consultation.userName ?? 'Estudiante'
        : consultation.psychologistName ?? 'Psicólogo';
    final subtitle = isPsychologist
        ? consultation.psychologistEmail
        : consultation.psychologistSpecialization;

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Icon(
            isPsychologist ? Icons.school : Icons.psychology,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  // ... resto de métodos helper

  IconData _getStatusIcon(ConsultationStatus status) {
    switch (status) {
      case ConsultationStatus.pending:
        return Icons.schedule;
      case ConsultationStatus.accepted:
      case ConsultationStatus.confirmed:
        return Icons.check_circle;
      case ConsultationStatus.scheduled:
        return Icons.calendar_today;
      case ConsultationStatus.inProgress:
        return Icons.psychology;
      case ConsultationStatus.completed:
        return Icons.check_circle_outline;
      case ConsultationStatus.cancelled:
        return Icons.cancel;
      case ConsultationStatus.rejected:
        return Icons.close;
      case ConsultationStatus.noShow:
        return Icons.person_off;
    }
  }

  Color _getStatusColor(ConsultationStatus status) {
    switch (status) {
      case ConsultationStatus.pending:
        return Colors.orange;
      case ConsultationStatus.accepted:
      case ConsultationStatus.confirmed:
      case ConsultationStatus.scheduled:
        return Colors.blue;
      case ConsultationStatus.inProgress:
        return Colors.purple;
      case ConsultationStatus.completed:
        return Colors.green;
      case ConsultationStatus.cancelled:
      case ConsultationStatus.rejected:
        return Colors.red;
      case ConsultationStatus.noShow:
        return Colors.grey;
    }
  }

  // Métodos auxiliares que faltaban para que compile
  Widget _buildConsultationDetailsCard(BuildContext context, Consultation consultation) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detalles de la Consulta',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSizes.md),
            _buildDetailRow(context, 'ID', consultation.id),
            _buildDetailRow(context, 'Creada', Formatters.dateTime(consultation.createdAt)),
            if (consultation.updatedAt != null)
              _buildDetailRow(context, 'Actualizada', Formatters.dateTime(consultation.updatedAt!)),
            if (consultation.meetingUrl?.isNotEmpty == true)
              _buildDetailRow(context, 'URL de Reunión', consultation.meetingUrl!, isUrl: true),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value, {bool isUrl = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: isUrl
                ? InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('URL: $value')),
                );
              },
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
                : Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesCard(BuildContext context, Consultation consultation, bool isPsychologist) => const SizedBox.shrink();
  Widget _buildSummaryCard(BuildContext context, Consultation consultation) => const SizedBox.shrink();
  Widget _buildRecommendationsCard(BuildContext context, Consultation consultation) => const SizedBox.shrink();
  Widget _buildRatingCard(BuildContext context, Consultation consultation) => const SizedBox.shrink();
  Widget _buildActionButtons(BuildContext context, Consultation consultation, bool isPsychologist) => const SizedBox.shrink();
  List<PopupMenuEntry<String>> _buildMenuItems(Consultation consultation, bool isPsychologist) => [];
  void _handleMenuAction(BuildContext context, WidgetRef ref, Consultation consultation, String action) {}
}