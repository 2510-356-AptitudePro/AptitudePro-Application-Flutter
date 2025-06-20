import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/formatters.dart';
import '../entities/test_result.dart';

class ResultSummaryCard extends StatelessWidget {
  final TestResult result;
  final VoidCallback onTap;

  const ResultSummaryCard({
    super.key,
    required this.result,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSizes.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      result.test?.title ?? 'Test',
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.sm,
                      vertical: AppSizes.xs,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
                    ),
                    child: Text(
                      '${result.totalScore}%',
                      style: TextStyle(
                        color: AppColors.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.sm),

              // Date and time
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppSizes.xs),
                  Text(
                    Formatters.date(result.completedAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: AppSizes.md),
                  Icon(
                    Icons.timer,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppSizes.xs),
                  Text(
                    Formatters.duration(result.timeSpent),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),

              // Aptitude profile
              if (result.aptitudeProfile != null) ...[
                const SizedBox(height: AppSizes.sm),
                Wrap(
                  spacing: AppSizes.xs,
                  children: result.aptitudeProfile!.strengths.take(3).map((strength) {
                    return Chip(
                      label: Text(
                        strength,
                        style: const TextStyle(fontSize: 12),
                      ),
                      backgroundColor: AppColors.primaryContainer,
                      labelStyle: const TextStyle(
                        color: AppColors.onPrimaryContainer,
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}