import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../domain/entities/psychologist/psychologist.dart';
import '../../../bounded-context/consultations/providers/consultation_provider.dart';
import '../../../presentation/widgets/error_state.dart';


class ScheduleConsultationScreen extends ConsumerStatefulWidget {
  const ScheduleConsultationScreen({super.key});

  @override
  ConsumerState<ScheduleConsultationScreen> createState() => _ScheduleConsultationScreenState();
}

class _ScheduleConsultationScreenState extends ConsumerState<ScheduleConsultationScreen> {
  Psychologist? _selectedPsychologist;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _scheduleConsultation() async {
    if (_selectedPsychologist == null || _selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor completa todos los campos')),
      );
      return;
    }

    final scheduledAt = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    // ✅ Usar el nuevo provider de agendamiento
    await ref.read(scheduleConsultationProvider.notifier).schedule(
      psychologistId: _selectedPsychologist!.id,
      scheduledAt: scheduledAt,
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final psychologistsAsync = ref.watch(psychologistsProvider);
    final scheduleState = ref.watch(scheduleConsultationProvider);

    // ✅ Escuchar cambios en el estado de agendamiento
    ref.listen(scheduleConsultationProvider, (previous, next) {
      next.when(
        data: (consultation) {
          if (consultation != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Consulta agendada exitosamente')),
            );
            context.go('/consultations');
          }
        },
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $error')),
          );
        },
        loading: () {}, // No hacer nada mientras carga
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Consulta'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selección de psicólogo
            _SectionHeader(
              title: 'Selecciona un psicólogo',
              icon: Icons.psychology,
            ),
            const SizedBox(height: AppSizes.sm),
            psychologistsAsync.when(
              data: (psychologists) {
                if (psychologists.isEmpty) {
                  return _EmptyPsychologistsCard();
                }

                return Card(
                  elevation: 2,
                  child: Column(
                    children: psychologists.map((psychologist) {
                      return _PsychologistTile(
                        psychologist: psychologist,
                        isSelected: _selectedPsychologist == psychologist,
                        onSelected: (selected) {
                          setState(() {
                            _selectedPsychologist = selected ? psychologist : null;
                          });
                        },
                      );
                    }).toList(),
                  ),
                );
              },
              loading: () => const Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.lg),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
              error: (error, stack) {
                return ErrorState(
                  error: error.toString(),
                  onRetry: () {
                    ref.invalidate(psychologistsProvider);
                  },
                );
              },
            ),
            const SizedBox(height: AppSizes.lg),

            // Selección de fecha
            _SectionHeader(
              title: 'Selecciona una fecha',
              icon: Icons.calendar_today,
            ),
            const SizedBox(height: AppSizes.sm),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.sm),
                child: TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now().add(const Duration(days: 90)),
                  focusedDay: _selectedDate ?? DateTime.now(),
                  calendarFormat: CalendarFormat.month,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDate, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    // ✅ No permitir seleccionar fechas pasadas
                    if (selectedDay.isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
                      return;
                    }
                    setState(() {
                      _selectedDate = selectedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    disabledDecoration: BoxDecoration(
                      color: Theme.of(context).disabledColor.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Mes',
                  },
                  enabledDayPredicate: (day) {
                    return day.isAfter(DateTime.now().subtract(const Duration(days: 1)));
                  },
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.lg),

            // Selección de hora
            _SectionHeader(
              title: 'Selecciona una hora',
              icon: Icons.access_time,
            ),
            const SizedBox(height: AppSizes.sm),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(
                  Icons.access_time,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  _selectedTime != null
                      ? _selectedTime!.format(context)
                      : 'No seleccionada',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: const Text('Toca para seleccionar'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: _selectedTime ?? const TimeOfDay(hour: 9, minute: 0),
                    helpText: 'Selecciona la hora de la consulta',
                  );
                  if (time != null) {
                    setState(() {
                      _selectedTime = time;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: AppSizes.lg),

            // Notas adicionales
            _SectionHeader(
              title: 'Notas adicionales (opcional)',
              icon: Icons.note_add,
            ),
            const SizedBox(height: AppSizes.sm),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.sm),
                child: TextField(
                  controller: _notesController,
                  maxLines: 4,
                  maxLength: 500,
                  decoration: const InputDecoration(
                    hintText: 'Describe brevemente el motivo de tu consulta...',
                    border: InputBorder.none,
                    counterText: '',
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.xl),

            // Botón de agendar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: scheduleState.isLoading ? null : _scheduleConsultation,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: scheduleState.isLoading
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                    : const Text(
                  'Agendar Consulta',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Widget para headers de sección
class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor),
        const SizedBox(width: AppSizes.sm),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ✅ Widget para mostrar psicólogos vacío
class _EmptyPsychologistsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Column(
          children: [
            Icon(
              Icons.psychology_outlined,
              size: 64,
              color: Theme.of(context).disabledColor,
            ),
            const SizedBox(height: AppSizes.sm),
            Text(
              'No hay psicólogos disponibles',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSizes.xs),
            Text(
              'Intenta más tarde',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).disabledColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Widget para cada psicólogo usando getters de Freezed
class _PsychologistTile extends StatelessWidget {
  final Psychologist psychologist;
  final bool isSelected;
  final Function(bool) onSelected;

  const _PsychologistTile({
    required this.psychologist,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<bool>(
      value: true,
      groupValue: isSelected,
      onChanged: (value) => onSelected(value ?? false),
      title: Text(
        psychologist.displayName, // ✅ Usar getter de Freezed
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            psychologist.specialization,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (psychologist.username != null)
            Text(
              '@${psychologist.username}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          if (psychologist.email != null)
            Text(
              psychologist.email!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).disabledColor,
              ),
            ),
          if (psychologist.formattedRating.isNotEmpty) // ✅ Usar getter de Freezed
            Text(
              psychologist.formattedRating,
              style: Theme.of(context).textTheme.bodySmall,
            ),
        ],
      ),
      secondary: CircleAvatar(
        backgroundImage: psychologist.hasProfileImage // ✅ Usar getter de Freezed
            ? NetworkImage(psychologist.profileImage!)
            : null,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
        child: !psychologist.hasProfileImage
            ? Icon(
          Icons.psychology,
          color: Theme.of(context).primaryColor,
        )
            : null,
      ),
      isThreeLine: true,
    );
  }
}