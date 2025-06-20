import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../bounded-context/auth/providers/auth_provider.dart';
import '../../../bounded-context/tests/providers/test_provider.dart';


class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final resultsAsync = ref.watch(myTestResultsProvider);

    if (currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header con foto de perfil
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.lg),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: currentUser.profileImage != null
                        ? NetworkImage(currentUser.profileImage!)
                        : null,
                    child: currentUser.profileImage == null
                        ? Text(
                      currentUser.firstName?.substring(0, 1).toUpperCase() ??
                          currentUser.username.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    )
                        : null,
                  ),
                  const SizedBox(height: AppSizes.md),
                  Text(
                    '${currentUser.firstName ?? ''} ${currentUser.lastName ?? ''}'.trim().isEmpty
                        ? currentUser.username
                        : '${currentUser.firstName} ${currentUser.lastName}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: AppSizes.xs),
                  Text(
                    currentUser.email,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSizes.md),
                  OutlinedButton.icon(
                    onPressed: () => context.go('/profile/edit'),
                    icon: const Icon(Icons.edit),
                    label: const Text('Editar Perfil'),
                  ),
                ],
              ),
            ),

            // Estadísticas
            Padding(
              padding: const EdgeInsets.all(AppSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mis Estadísticas',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSizes.md),
                  resultsAsync.when(
                    data: (results) {
                      final totalTests = results.length;
                      final avgScore = results.isEmpty
                          ? 0
                          : results
                          .map((r) => r.totalScore)
                          .reduce((a, b) => a + b) ~/
                          results.length;

                      return Row(
                        children: [
                          Expanded(
                            child: _StatCard(
                              icon: Icons.quiz,
                              title: 'Tests Completados',
                              value: totalTests.toString(),
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: AppSizes.sm),
                          Expanded(
                            child: _StatCard(
                              icon: Icons.star,
                              title: 'Puntuación Promedio',
                              value: '$avgScore%',
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stack) => const SizedBox(),
                  ),
                  const SizedBox(height: AppSizes.lg),

                  // Secciones del perfil
                  _buildProfileSection(
                    context,
                    icon: Icons.assessment,
                    title: 'Mis Resultados',
                    subtitle: 'Ver todos mis resultados de tests',
                    onTap: () => context.go('/results'),
                  ),
                  const SizedBox(height: AppSizes.sm),
                  _buildProfileSection(
                    context,
                    icon: Icons.calendar_today,
                    title: 'Mis Consultas',
                    subtitle: 'Ver y gestionar mis consultas',
                    onTap: () => context.go('/consultations'),
                  ),
                  const SizedBox(height: AppSizes.sm),
                  _buildProfileSection(
                    context,
                    icon: Icons.help,
                    title: 'Ayuda y Soporte',
                    subtitle: 'Centro de ayuda y contacto',
                    onTap: () {
                      // TODO: Implementar ayuda
                    },
                  ),
                  const SizedBox(height: AppSizes.sm),
                  _buildProfileSection(
                    context,
                    icon: Icons.info,
                    title: 'Acerca de',
                    subtitle: 'Información de la aplicación',
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: 'AptitudePro',
                        applicationVersion: '1.0.0',
                        applicationIcon: const Icon(Icons.psychology),
                      );
                    },
                  ),
                  const SizedBox(height: AppSizes.lg),

                  // Botón de cerrar sesión
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Cerrar Sesión'),
                            content: const Text(
                              '¿Estás seguro de que quieres cerrar sesión?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  //ref.read(authServiceProvider).logout();
                                  context.go('/auth/signin');
                                },
                                child: const Text('Cerrar Sesión'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Cerrar Sesión'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.error,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.xl),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: AppSizes.sm),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSizes.xs),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
