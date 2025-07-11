import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../entities/career.dart';
import '../providers/career_provider.dart';
import '../../../presentation/widgets/error_state.dart';


class CareerDetailScreen extends ConsumerWidget {
  final String careerId;

  const CareerDetailScreen({
    super.key,
    required this.careerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final careerAsync = ref.watch(careerProvider(careerId));

    return Scaffold(
      body: careerAsync.when(
        data: (career) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(career.title!),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (career.imageUrl != null)
                        Image.network(
                          career.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Theme.of(context).primaryColor,
                            );
                          },
                        )
                      else
                        Container(
                          color: Theme.of(context).primaryColor,
                        ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Campo y descripción
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppSizes.md),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppSizes.sm,
                                      vertical: AppSizes.xs,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
                                    ),
                                    child: Text(
                                      career.field.displayName,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSizes.md),
                              Text(
                                career.description,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.md),

                      // Información clave
                      _buildInfoSection(
                        context,
                        'Información Clave',
                        Icons.info_outline,
                        [
                          _InfoRow(
                            label: 'Duración',
                            value: '${career.duration} años',
                            icon: Icons.timer,
                          ),
                          _InfoRow(
                            label: 'Salario Promedio',
                            value: career.averageSalary != null
                                ? '\$${career.averageSalary!.toStringAsFixed(0)}'
                                : 'No disponible',
                            icon: Icons.attach_money,
                          ),

                        ],
                      ),
                      const SizedBox(height: AppSizes.md),

                      // Habilidades requeridas
                      if (career.requiredSkills.isNotEmpty) ...[
                        _buildSkillsSection(context, career),
                        const SizedBox(height: AppSizes.md),
                      ],

                      // Universidades
                      if (career.universities.isNotEmpty) ...[
                        _buildUniversitiesSection(context, career),
                        const SizedBox(height: AppSizes.md),
                      ],

                      // Trabajos relacionados
                      if (career.relatedJobs!.isNotEmpty) ...[
                        _buildRelatedJobsSection(context, career),
                        const SizedBox(height: AppSizes.md),
                      ],

                      // Botones de acción
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => context.go('/tests'),
                              icon: const Icon(Icons.quiz),
                              label: const Text('Hacer Test'),
                            ),
                          ),
                          const SizedBox(width: AppSizes.sm),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () => context.go('/consultations/schedule'),
                              icon: const Icon(Icons.calendar_today),
                              label: const Text('Consultar'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.xl),
                    ],
                  ),
                ),
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
            ref.invalidate(careerProvider(careerId));
          },
        ),
      ),
    );
  }

  Widget _buildInfoSection(
      BuildContext context,
      String title,
      IconData icon,
      List<_InfoRow> rows,
      ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).primaryColor),
                const SizedBox(width: AppSizes.sm),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            ...rows.map((row) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.sm),
                child: Row(
                  children: [
                    Icon(
                      row.icon,
                      size: 20,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Text(
                      '${row.label}: ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        row.value,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context, Career career) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star_outline,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  'Habilidades Requeridas',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            Wrap(
              spacing: AppSizes.sm,
              runSpacing: AppSizes.sm,
              children: career.requiredSkills.map((skill) {
                return Chip(
                  label: Text(skill),
                  backgroundColor: AppColors.secondaryContainer,
                  labelStyle: const TextStyle(
                    color: AppColors.onSecondaryContainer,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUniversitiesSection(BuildContext context, Career career) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.school,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  'Universidades',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            ...career.universities.map((university) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  child: Icon(
                    Icons.school,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                title: Text(university.name),
                subtitle: Text(university.location!),
                trailing: IconButton(
                  icon: const Icon(Icons.open_in_new),
                  onPressed: university.website != null
                      ? () async {
                    final uri = Uri.parse(university.website!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  }
                      : null,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildRelatedJobsSection(BuildContext context, Career career) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.work_outline,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  'Trabajos Relacionados',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            ...?career.relatedJobs?.map((job) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.sm),
                child: Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 8,
                      color: AppColors.secondary,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Text(job),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _InfoRow {
  final String label;
  final String value;
  final IconData icon;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.icon,
  });
}
