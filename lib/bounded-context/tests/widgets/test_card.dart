import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../entities/test.dart';

class TestCard extends StatelessWidget {
  final Test test;
  final VoidCallback onTap;

  const TestCard({
    super.key,
    required this.test,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: _getTypeColor(test.type).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Icon(
                  _getTypeIcon(test.type),
                  color: _getTypeColor(test.type),
                  size: 30,
                ),
              ),
              const SizedBox(width: AppSizes.md),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      test.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSizes.xs),
                    Text(
                      test.description,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSizes.sm),
                    // ✅ CAMBIADO: Wrap en lugar de Row para evitar overflow
                    Wrap(
                      spacing: AppSizes.sm,
                      runSpacing: AppSizes.xs,
                      children: [
                        _buildChip(
                          context,
                          Icons.quiz,
                          '${test.questionCount} preguntas',
                        ),
                        if (test.duration > 0)
                          _buildChip(
                            context,
                            Icons.timer,
                            '${test.duration} min',
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              // Arrow
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.sm,
        vertical: AppSizes.xs,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: AppSizes.xs),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTypeIcon(TestType type) {
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

  Color _getTypeColor(TestType type) {
    switch (type) {
      case TestType.aptitude:
        return AppColors.primary;
      case TestType.personality:
        return AppColors.secondary;
      case TestType.intelligence:
        return AppColors.tertiary;
      case TestType.vocational:
        return AppColors.info;
    }
  }
}