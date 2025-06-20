import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/utils/formatters.dart';
import '../entities/test_result.dart';
import '../../tests/providers/test_provider.dart';
import '../../../presentation/widgets/error_state.dart';


class ResultDetailScreen extends ConsumerWidget {
  final String resultId;

  const ResultDetailScreen({
    super.key,
    required this.resultId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultAsync = ref.watch(testResultProvider(resultId));

    return Scaffold(
      body: resultAsync.when(
        data: (result) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(result.test?.title ?? 'Resultado'),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary,
                          AppColors.primary.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 60),
                          Text(
                            '${result.totalScore}%',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Puntuación Total',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Información general
                      _buildInfoCard(
                        context,
                        'Información del Test',
                        [
                          _InfoItem(
                            icon: Icons.calendar_today,
                            label: 'Fecha',
                            value: Formatters.date(result.completedAt),
                          ),
                          _InfoItem(
                            icon: Icons.timer,
                            label: 'Tiempo',
                            value: Formatters.duration(result.timeSpent),
                          ),
                          _InfoItem(
                            icon: Icons.quiz,
                            label: 'Preguntas',
                            value: '${result.answers.length}',
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.md),

                      // Perfil de aptitudes
                      if (result.aptitudeProfile != null) ...[
                        _buildAptitudeProfile(context, result.aptitudeProfile!),
                        const SizedBox(height: AppSizes.md),
                      ],

                      // Carreras recomendadas
                      if (result.careerRecommendations.isNotEmpty) ...[
                        _buildCareerRecommendations(context, result),
                        const SizedBox(height: AppSizes.md),
                      ],

                      // Recomendaciones generales
                      if (result.recommendations.isNotEmpty) ...[
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(AppSizes.md),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.lightbulb_outline,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(width: AppSizes.sm),
                                    Text(
                                      'Recomendaciones',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSizes.md),
                                ...result.recommendations.map((rec) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: AppSizes.sm),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.check_circle,
                                          size: 20,
                                          color: AppColors.success,
                                        ),
                                        const SizedBox(width: AppSizes.sm),
                                        Expanded(
                                          child: Text(rec as String),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],

                      // Botón de agendar consulta
                      const SizedBox(height: AppSizes.xl),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => context.go('/consultations/schedule'),
                          icon: const Icon(Icons.calendar_today),
                          label: const Text('Agendar Consulta con Psicólogo'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.md),
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
            ref.invalidate(testResultProvider(resultId));
          },
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, List<_InfoItem> items) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            ...items.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.sm),
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      size: 20,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Text(
                      '${item.label}: ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      item.value,
                      style: Theme.of(context).textTheme.bodyMedium,
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

  Widget _buildAptitudeProfile(BuildContext context, AptitudeProfile profile) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.psychology,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  'Perfil de Aptitudes',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            // Fortalezas
            Text(
              'Fortalezas',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.success,
              ),
            ),
            const SizedBox(height: AppSizes.xs),
            Wrap(
              spacing: AppSizes.xs,
              runSpacing: AppSizes.xs,
              children: profile.strengths.map((strength) {
                return Chip(
                  label: Text(strength),
                  backgroundColor: AppColors.success.withOpacity(0.1),
                  labelStyle: const TextStyle(
                    color: AppColors.success,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppSizes.md),
            // Áreas de mejora
            Text(
              'Áreas de Mejora',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.warning,
              ),
            ),
            const SizedBox(height: AppSizes.xs),
            Wrap(
              spacing: AppSizes.xs,
              runSpacing: AppSizes.xs,
              children: profile.areasForImprovement.map((area) {
                return Chip(
                  label: Text(area),
                  backgroundColor: AppColors.warning.withOpacity(0.1),
                  labelStyle: const TextStyle(
                    color: AppColors.warning,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCareerRecommendations(BuildContext context, TestResult result) {
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
                  'Carreras Recomendadas',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            ...result.careerRecommendations.take(5).map((career) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  child: Text(
                    '${career.compatibilityScore}%',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                title: Text(career.title!),
                subtitle: Text(career.reason!),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => context.go('/careers/${career.careerId}'),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _InfoItem {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}
