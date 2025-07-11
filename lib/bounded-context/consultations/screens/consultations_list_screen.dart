import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/utils/formatters.dart';
import '../../../bounded-context/consultations/entities/consultation.dart';
import '../../../bounded-context/consultations/providers/consultation_provider.dart';
import '../../../presentation/widgets/empty_state.dart';
import '../../../presentation/widgets/error_state.dart';


class ConsultationsListScreen extends ConsumerStatefulWidget {
  const ConsultationsListScreen({super.key});

  @override
  ConsumerState<ConsultationsListScreen> createState() => _ConsultationsListScreenState();
}

class _ConsultationsListScreenState extends ConsumerState<ConsultationsListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final consultationsAsync = ref.watch(myConsultationsProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Mis Consultas'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Próximas'),
            Tab(text: 'Pasadas'),
            Tab(text: 'Canceladas'),
          ],
        ),
      ),
      body: consultationsAsync.when(
        data: (consultations) {
          return TabBarView(
            controller: _tabController,
            children: [
              _buildConsultationsList(
                consultations.where((c) =>
                // ✅ CORREGIDO: Usar los estados correctos del backend
                (c.status == ConsultationStatus.pending ||
                    c.status == ConsultationStatus.accepted ||
                    c.status == ConsultationStatus.scheduled) &&
                    c.scheduledAt.isAfter(DateTime.now())
                ).toList(),
                emptyMessage: 'No tienes consultas próximas',
              ),
              _buildConsultationsList(
                consultations.where((c) =>
                c.status == ConsultationStatus.completed ||
                    ((c.status == ConsultationStatus.accepted ||
                        c.status == ConsultationStatus.scheduled) &&
                        c.scheduledAt.isBefore(DateTime.now()))
                ).toList(),
                emptyMessage: 'No tienes consultas pasadas',
              ),
              _buildConsultationsList(
                consultations.where((c) =>
                c.status == ConsultationStatus.cancelled ||
                    c.status == ConsultationStatus.rejected
                ).toList(),
                emptyMessage: 'No tienes consultas canceladas',
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => ErrorState(
          error: error.toString(),
          onRetry: () {
            ref.invalidate(myConsultationsProvider);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/consultations/schedule'),
        icon: const Icon(Icons.add),
        label: const Text('Nueva Consulta'),
      ),
    );
  }

  Widget _buildConsultationsList(
      List<Consultation> consultations,
      {required String emptyMessage}
      ) {
    if (consultations.isEmpty) {
      return EmptyState(
        icon: Icons.event_busy,
        title: emptyMessage,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSizes.md),
      itemCount: consultations.length,
      itemBuilder: (context, index) {
        final consultation = consultations[index];
        return _ConsultationCard(consultation: consultation);
      },
    );
  }
}

class _ConsultationCard extends StatelessWidget {
  final Consultation consultation;

  const _ConsultationCard({required this.consultation});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSizes.sm),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(consultation.status).withOpacity(0.1),
          child: Icon(
            _getStatusIcon(consultation.status),
            color: _getStatusColor(consultation.status),
          ),
        ),
        title: Text(
          'Consulta con ${consultation.psychologistName ?? "Psicólogo"}',
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.xs),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: AppSizes.xs),
                Text(
                  Formatters.dateTime(consultation.scheduledAt),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.xs),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.sm,
                vertical: AppSizes.xs,
              ),
              decoration: BoxDecoration(
                color: _getStatusColor(consultation.status).withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
              ),
              child: Text(
                consultation.status.displayName,
                style: TextStyle(
                  fontSize: 12,
                  color: _getStatusColor(consultation.status),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        trailing: consultation.canBeCancelled
            ? PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'cancel') {
              // TODO: Implementar cancelación
            } else if (value == 'reschedule') {
              // TODO: Implementar reprogramación
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'reschedule',
              child: Text('Reprogramar'),
            ),
            const PopupMenuItem(
              value: 'cancel',
              child: Text('Cancelar'),
            ),
          ],
        )
            : null,
        onTap: () => context.go('/consultations/${consultation.id}'),
      ),
    );
  }

  Color _getStatusColor(ConsultationStatus status) {
    switch (status) {
      case ConsultationStatus.pending:
        return AppColors.info;
      case ConsultationStatus.accepted:
      case ConsultationStatus.scheduled:
        return AppColors.primary;
      case ConsultationStatus.completed:
        return AppColors.success;
      case ConsultationStatus.cancelled:
      case ConsultationStatus.rejected:
        return AppColors.error;
      case ConsultationStatus.inProgress:
        return AppColors.info;
      case ConsultationStatus.confirmed:
        return Colors.green;
      case ConsultationStatus.noShow:
        return Colors.orange;
    }
  }

  IconData _getStatusIcon(ConsultationStatus status) {
    switch (status) {
      case ConsultationStatus.pending:
        return Icons.hourglass_empty;
      case ConsultationStatus.accepted:
      case ConsultationStatus.scheduled:
        return Icons.schedule;
      case ConsultationStatus.completed:
        return Icons.check_circle;
      case ConsultationStatus.cancelled:
      case ConsultationStatus.rejected:
        return Icons.cancel;
      case ConsultationStatus.inProgress:
        return Icons.play_circle;
      case ConsultationStatus.confirmed:
        return Icons.verified;
      case ConsultationStatus.noShow:
        return Icons.person_off;
    }
  }
}