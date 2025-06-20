import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../bounded-context/tests/entities/test.dart';
import '../../../bounded-context/results/entities/test_result.dart';
import '../../../domain/entities/user/user.dart';
import '../../../bounded-context/auth/providers/auth_provider.dart';
import '../../../bounded-context/tests/providers/test_provider.dart';
import '../../../bounded-context/results/widgets/result_summary_card.dart';
import '../../../bounded-context/tests/widgets/test_card.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final testsAsync = ref.watch(testListProvider);
    final resultsAsync = ref.watch(myTestResultsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hola, ${currentUser?.firstName ?? currentUser?.username ?? ''}'),

      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(testListProvider);
          ref.invalidate(myTestResultsProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
              _buildHeaderCard(context, currentUser),
              const SizedBox(height: AppSizes.lg),

              // Quick Actions
              _buildQuickActions(context),
              const SizedBox(height: AppSizes.lg),

              // Tests Recomendados
              _buildTestsSection(context, testsAsync),
              const SizedBox(height: AppSizes.lg),

              // Resultados Recientes
              _buildRecentResultsSection(context, resultsAsync),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, User? user) {
    return Card(
      elevation: 0,
      color: AppColors.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tu progreso vocacional',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: AppSizes.sm),
            Text(
              'Descubre tu verdadera vocación completando nuestros tests especializados',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.onPrimaryContainer.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: AppSizes.md),
            LinearProgressIndicator(
              value: 0.3, // TODO: Calcular progreso real
              backgroundColor: AppColors.onPrimaryContainer.withOpacity(0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
            const SizedBox(height: AppSizes.sm),
            Text(
              '30% completado',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.onPrimaryContainer.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Acciones rápidas',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSizes.sm),
        Row(
          children: [
            Expanded(
              child: _QuickActionCard(
                icon: Icons.quiz,
                title: 'Nuevo Test',
                color: AppColors.primary,
                onTap: () => context.go('/tests'),
              ),
            ),
            const SizedBox(width: AppSizes.sm),
            Expanded(
              child: _QuickActionCard(
                icon: Icons.school,
                title: 'Explorar Carreras',
                color: AppColors.secondary,
                onTap: () => context.go('/careers'),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.sm),
        Row(
          children: [
            Expanded(
              child: _QuickActionCard(
                icon: Icons.calendar_today,
                title: 'Agendar Consulta',
                color: AppColors.tertiary,
                onTap: () => context.go('/consultations/schedule'),
              ),
            ),
            const SizedBox(width: AppSizes.sm),
            Expanded(
              child: _QuickActionCard(
                icon: Icons.forum,
                title: 'Foros',
                color: AppColors.info,
                onTap: () => context.go('/forums'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTestsSection(BuildContext context, AsyncValue<List<Test>> testsAsync) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tests Recomendados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
              onPressed: () => context.go('/tests'),
              child: const Text('Ver todos'),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.sm),
        testsAsync.when(
          data: (tests) {
            if (tests.isEmpty) {
              return const Center(
                child: Text('No hay tests disponibles'),
              );
            }

            return SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: tests.take(5).length,
                separatorBuilder: (context, index) => const SizedBox(width: AppSizes.sm),
                itemBuilder: (context, index) {
                  final test = tests[index];
                  return SizedBox(
                    width: 300,
                    child: TestCard(
                      test: test,
                      onTap: () => context.go('/tests/${test.id}'),
                    ),
                  );
                },
              ),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentResultsSection(BuildContext context, AsyncValue<List<TestResult>> resultsAsync) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Resultados Recientes',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
              onPressed: () => context.go('/results'),
              child: const Text('Ver todos'),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.sm),
        resultsAsync.when(
          data: (results) {
            if (results.isEmpty) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.assessment_outlined,
                          size: 48,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(height: AppSizes.sm),
                        Text(
                          'No has completado ningún test aún',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return Column(
              children: results.take(3).map((result) {
                return ResultSummaryCard(
                  result: result,
                  onTap: () => context.go('/results/${result.id}'),
                );
              }).toList(),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ],
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: AppSizes.xs),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}