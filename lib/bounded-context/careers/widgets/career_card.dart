import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../entities/career.dart';

class CareerCard extends StatelessWidget {
  final Career career;
  final VoidCallback onTap;

  const CareerCard({
    super.key,
    required this.career,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen
            if (career.imageUrl != null)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppSizes.radiusMd),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    career.imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        child: Icon(
                          Icons.school,
                          size: 48,
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              )
            else
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppSizes.radiusMd),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.school,
                    size: 48,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),

            // Contenido
            Padding(
              padding: const EdgeInsets.all(AppSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Campo
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.sm,
                      vertical: AppSizes.xs,
                    ),
                    decoration: BoxDecoration(
                      color: _getFieldColor(career.field).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
                    ),
                    child: Text(
                      career.field.displayName,
                      style: TextStyle(
                        fontSize: 12,
                        color: _getFieldColor(career.field),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.sm),

                  // Título
                  Text(
                    career.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSizes.xs),

                  // Descripción
                  Text(
                    career.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSizes.md),

                  // Información adicional
                  Row(
                    children: [
                      _buildInfoChip(
                        context,
                        Icons.timer,
                        '${career.duration} años',
                      ),
                      const SizedBox(width: AppSizes.sm),
                      if (career.averageSalary != null)
                        _buildInfoChip(
                          context,
                          Icons.attach_money,
                          '\$${career.averageSalary!.toStringAsFixed(0)}',
                        ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.sm),

                  // Demanda laboral
                  Row(
                    children: [
                      Icon(
                        Icons.trending_up,
                        size: 16,
                        color: _getDemandColor(career.jobDemand as JobDemand),
                      ),
                      const SizedBox(width: AppSizes.xs),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String label) {
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

  Color _getFieldColor(CareerField field) {
    switch (field) {
      case CareerField.technology:
        return AppColors.primary;
      case CareerField.health:
        return AppColors.error;
      case CareerField.business:
        return AppColors.secondary;
      case CareerField.arts:
        return AppColors.tertiary;
      case CareerField.science:
        return AppColors.info;
      case CareerField.education:
        return AppColors.success;
      case CareerField.engineering:
        return AppColors.warning;
      case CareerField.socialSciences:
        return Colors.purple;
    }
  }

  Color _getDemandColor(JobDemand demand) {
    switch (demand) {
      case JobDemand.veryHigh:
        return AppColors.success;
      case JobDemand.high:
        return AppColors.info;
      case JobDemand.medium:
        return AppColors.warning;
      case JobDemand.low:
        return AppColors.error;
    }
  }
}
