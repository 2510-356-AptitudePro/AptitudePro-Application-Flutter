import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/utils/formatters.dart';
import '../entities/test.dart';
import '../providers/test_provider.dart';
import '../../../presentation/widgets/error_state.dart';


class TestDetailScreen extends ConsumerWidget {
  final String testId;

  const TestDetailScreen({
    super.key,
    required this.testId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testAsync = ref.watch(testProvider(testId));

    return Scaffold(
      body: testAsync.when(
        data: (test) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(test.title),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        _getTestIcon(test.type),
                        size: 80,
                        color: Colors.white.withOpacity(0.3),
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
                      // Descripción
                      Card(
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
                                    'Descripción',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSizes.sm),
                              Text(
                                test.description,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.md),

                      // Detalles del test
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppSizes.md),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.assignment,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  const SizedBox(width: AppSizes.sm),
                                  Text(
                                    'Detalles del Test',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSizes.md),
                              _buildDetailRow(
                                context,
                                Icons.category,
                                'Tipo',
                                test.type.displayName,
                              ),
                              const SizedBox(height: AppSizes.sm),
                              _buildDetailRow(
                                context,
                                Icons.timer,
                                'Duración',
                                test.duration > 0
                                    ? '${test.duration} minutos'
                                    : 'Sin límite de tiempo',
                              ),
                              const SizedBox(height: AppSizes.sm),
                              _buildDetailRow(
                                context,
                                Icons.quiz,
                                'Preguntas',
                                '${test.questionCount} preguntas',
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Instrucciones
                      if (test.instructions != null) ...[
                        const SizedBox(height: AppSizes.md),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(AppSizes.md),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.list_alt,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(width: AppSizes.sm),
                                    Text(
                                      'Instrucciones',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSizes.sm),
                                Text(
                                  test.instructions!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],

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
            ref.invalidate(testProvider(testId));
          },
        ),
      ),
      bottomNavigationBar: testAsync.maybeWhen(
        data: (test) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: ElevatedButton(
              onPressed: () => context.go('/tests/$testId/take'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
              ),
              child: const Text(
                'Comenzar Test',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
        orElse: () => null,
      ),
    );
  }

  Widget _buildDetailRow(
      BuildContext context,
      IconData icon,
      String label,
      String value,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(width: AppSizes.sm),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  IconData _getTestIcon(TestType type) {
    switch (type) {
      case TestType.aptitude:
        return Icons.lightbulb_outline;
      case TestType.personality:
        return Icons.person_outline;
      case TestType.intelligence:
        return Icons.psychology_outlined;
      case TestType.vocational:
        return Icons.work_outline;
    }
  }
}